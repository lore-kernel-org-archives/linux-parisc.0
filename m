From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] Fwd: Fix getpid in new threads after fork
Date: Mon, 31 Jul 2006 14:26:58 -0400
Message-ID: <119aab440607311126g3a55cb46g423df9b00f890a6a@mail.gmail.com>
References: <20060731161551.GA7926@nevyn.them.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 "Randolph Chung" <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060731161551.GA7926@nevyn.them.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Randolph,

Look familiar?

---------- Forwarded message ----------
From: Daniel Jacobowitz <drow@false.org>
Date: Jul 31, 2006 12:15 PM
Subject: Fix getpid in new threads after fork
To: libc-alpha@sourceware.org


I noticed a failure with thread cancellation after fork, which turned
out to be caused by the si_pid sanity check in sigcancel_handler.
The PID was stale.  This happened because the main program created a
thread, joined it, and then forked.  The cached thread was reused with
a stale PID.

Patch and testcase attached.  Tested on x86_64-pc-linux-gnu.

--
Daniel Jacobowitz
CodeSourcery

2006-07-31  Daniel Jacobowitz  <dan@codesourcery.com>

        * Makefile (tests): Run tst-getpid3.
        * allocatestack.c (__reclaim_stacks): Reset the PID on cached
        stacks.
        * tst-getpid3.c: New test.

Index: nptl/Makefile
===================================================================
RCS file: /cvs/glibc/libc/nptl/Makefile,v
retrieving revision 1.180
diff -u -p -r1.180 Makefile
--- nptl/Makefile       28 Mar 2006 04:13:27 -0000      1.180
+++ nptl/Makefile       31 Jul 2006 16:04:16 -0000
@@ -251,7 +251,7 @@ tests = tst-typesizes \
        tst-backtrace1 \
        tst-oddstacklimit \
        tst-vfork1 tst-vfork2 tst-vfork1x tst-vfork2x \
-       tst-getpid1 tst-getpid2 \
+       tst-getpid1 tst-getpid2 tst-getpid3 \
        tst-initializers1 $(patsubst %,tst-initializers1-%,c89 gnu89 c99 gnu99)
 xtests = tst-setuid1 tst-setuid1-static

Index: nptl/allocatestack.c
===================================================================
RCS file: /cvs/glibc/libc/nptl/allocatestack.c,v
retrieving revision 1.62
diff -u -p -r1.62 allocatestack.c
--- nptl/allocatestack.c        28 Mar 2006 04:14:00 -0000      1.62
+++ nptl/allocatestack.c        31 Jul 2006 16:04:17 -0000
@@ -758,6 +758,15 @@ __reclaim_stacks (void)
        }
     }

+  /* Reset the PIDs in any cached stacks.  */
+  list_for_each (runp, &stack_cache)
+    {
+      struct pthread *curp;
+
+      curp = list_entry (runp, struct pthread, list);
+      curp->pid = self->pid;
+    }
+
   /* Add the stack of all running threads to the cache.  */
   list_splice (&stack_used, &stack_cache);

Index: nptl/tst-getpid3.c
===================================================================
RCS file: nptl/tst-getpid3.c
diff -N nptl/tst-getpid3.c
--- /dev/null   1 Jan 1970 00:00:00 -0000
+++ nptl/tst-getpid3.c  31 Jul 2006 16:04:17 -0000
@@ -0,0 +1,112 @@
+#include <string.h>
+#include <stdio.h>
+#include <unistd.h>
+#include <sys/wait.h>
+#include <pthread.h>
+#include <stdlib.h>
+
+static pid_t pid;
+
+static void *
+pid_thread (void *arg)
+{
+  if (pid != getpid ())
+    {
+      printf ("pid wrong in thread: %d / %d\n", pid, getpid ());
+      return (void *) 1L;
+    }
+
+  return NULL;
+}
+
+static int
+do_test (void)
+{
+  pthread_t thr;
+  int ret, status;
+  void *thr_ret;
+  pid_t child;
+
+  pid = getpid ();
+  ret = pthread_create (&thr, NULL, pid_thread, NULL);
+  if (ret)
+    {
+      printf ("pthread_create failed: %d\n", ret);
+      return 1;
+    }
+
+  ret = pthread_join (thr, &thr_ret);
+  if (ret)
+    {
+      printf ("pthread_create failed: %d\n", ret);
+      return 1;
+    }
+  else if (thr_ret)
+    {
+      printf ("thread getpid failed\n");
+      return 1;
+    }
+
+  child = fork ();
+  if (child == -1)
+    {
+      printf ("fork failed: %m\n");
+      return 1;
+    }
+  else if (child == 0)
+    {
+      if (pid == getpid ())
+       {
+         puts ("pid did not change after fork");
+         exit (1);
+       }
+
+      pid = getpid ();
+      ret = pthread_create (&thr, NULL, pid_thread, NULL);
+      if (ret)
+       {
+         printf ("pthread_create failed: %d\n", ret);
+         return 1;
+       }
+
+      ret = pthread_join (thr, &thr_ret);
+      if (ret)
+       {
+         printf ("pthread_create failed: %d\n", ret);
+         return 1;
+       }
+      else if (thr_ret)
+       {
+         printf ("thread getpid failed\n");
+         return 1;
+       }
+
+      return 0;
+    }
+
+  if (waitpid (child, &status, 0) != child)
+    {
+      puts ("waitpid failed");
+      kill (child, SIGKILL);
+      return 1;
+    }
+
+  if (!WIFEXITED (status))
+    {
+      if (WIFSIGNALED (status))
+       printf ("died from signal %s\n", strsignal (WTERMSIG (status)));
+      else
+       puts ("did not terminate correctly");
+      return 1;
+    }
+  if (WEXITSTATUS (status) != 0)
+    {
+      printf ("exit code %d\n", WEXITSTATUS (status));
+      return 1;
+    }
+
+  return 0;
+}
+
+#define TEST_FUNCTION do_test ()
+#include "../test-skeleton.c"
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
