From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Re: hppa glibc 2.3.3
Date: Sun, 10 Oct 2004 21:44:09 -0700
Message-ID: <20041011044409.GW14151@tausq.org>
References: <41617557000010DC@mail-6-bnl.tiscali.it>
	<20041008170106.GW24430@baldric.uwo.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041008170106.GW24430@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> The only problem might exist if __errno_location does not return the
> proper address of rltd_errno when RTLD_PRIVATE_ERRNO is defined. It
> should. If it doesn't then our definition of
> SYSCALL_ERRNO_HANDLER should change in that situation (away from
> DEFAULT_SYSCALL_ERROR_HANDLER which is set to __errno_location).

is there a fix for this? i was building glibc from cvs today to look at
the _dl_debug_state problem and ran into this too.... (also the problem
with the missing NULL defn for waitid)

The problem here seems to be that we are using the generic dl-sysdep.h 
and errno.c/errno-loc.c definitions, and when building rtld-errno-loc.o,
__errno_location is coded to return &errno and not &rtld_errno.

i hacked this in my build but not sure if this is the proper solution --
should we propose a change to the generic errno-loc.c? or do we need our
own? or am i on the wrong track?

i'm using something like this:

Index: linuxthreads/sysdeps/pthread/errno-loc.c
===================================================================
RCS file: /cvs/glibc/libc/linuxthreads/sysdeps/pthread/errno-loc.c,v
retrieving revision 1.3
diff -u -p -r1.3 errno-loc.c
--- linuxthreads/sysdeps/pthread/errno-loc.c	1 Apr 2003 00:52:40 -0000	1.3
+++ linuxthreads/sysdeps/pthread/errno-loc.c	11 Oct 2004 04:41:14 -0000
@@ -24,9 +24,13 @@
 #include <sysdep-cancel.h>
 
 #if ! USE___THREAD
+#if RTLD_PRIVATE_ERRNO
+extern int rtld_errno;
+#else
 #undef errno
 extern int errno;
 #endif
+#endif
 
 int *
 #if ! USE___THREAD
@@ -41,6 +45,10 @@ __errno_location (void)
       return LIBC_THREAD_GETMEM (self, p_errnop);
     }
 #endif
+#if RTLD_PRIVATE_ERRNO
+  return &rtld_errno;
+#else
   return &errno;
+#endif
 }
 libc_hidden_def (__errno_location)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
