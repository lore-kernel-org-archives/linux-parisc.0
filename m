From: Kyle McMartin <kyle@mcmartin.ca>
Subject: sys_accept4, SOCK_CLOEXEC, misc, bonghits, and others...
Date: Sat, 26 Dec 2009 13:20:50 -0500
Message-ID: <20091226182050.GH11593@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="ReaqsoxgOBHFXBhH"
Cc: Carlos O'Donell <carlos@systemhalted.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

So I wired up sys_accept4 over lunch today... it works ok in general,
and takes arguments such that it doesn't need a wrapper (yay.)

Problem. O_CLOEXEC is special on parisc because of the HPUX gunk which
makes everything miserable. The value in glibc is one bit off the value
in the kernel, and kaboom. No worky syscall.

Carlos, patch included below, tested with test_accept4.c, from Ulrich's
commit adding this syscall, modified (fixed) version of the test case
is attached to this email unless I'm a muppet and forgot.

Happy hacking^WHolidays, Kyle

diff --git a/ChangeLog.hppa b/ChangeLog.hppa
index 24a152e..4ce4cc7 100644
--- a/ChangeLog.hppa
+++ b/ChangeLog.hppa
@@ -1,3 +1,7 @@
+2009-12-26  Kyle McMartin   <kyle@redhat.com>
+	* sysdeps/unix/sysv/linux/hppa/bits/socket.h: Fix value of
+	SOCK_CLOEXEC to match O_CLOEXEC.
+
 2009-11-25  Carlos O'Donell  <carlos@codesourcery.com>
 
 	* sysdeps/unix/sysv/linux/hppa/nptl/bits/pthreadtypes.h:
diff --git a/sysdeps/unix/sysv/linux/hppa/bits/socket.h b/sysdeps/unix/sysv/linux/hppa/bits/socket.h
index ac6e81b..d552d85 100644
--- a/sysdeps/unix/sysv/linux/hppa/bits/socket.h
+++ b/sysdeps/unix/sysv/linux/hppa/bits/socket.h
@@ -62,7 +62,7 @@ enum __socket_type
   /* Flags to be ORed into the type parameter of socket and socketpair and
      used for the flags parameter of paccept.  */
 
-  SOCK_CLOEXEC = 02000000,	/* Atomically set close-on-exec flag for the
+  SOCK_CLOEXEC = 01000000,	/* Atomically set close-on-exec flag for the
 				   new descriptor(s).  */
 #define SOCK_CLOEXEC SOCK_CLOEXEC
 #undef SOCK_NONBLOCK

--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="test_accept4.c"

/* test_accept4.c

  Copyright (C) 2008, Linux Foundation, written by Michael Kerrisk
       <mtk.manpages@gmail.com>

  Licensed under the GNU GPLv2 or later.
*/
#define _GNU_SOURCE
#include <unistd.h>
#include <sys/syscall.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <stdlib.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>

#define PORT_NUM 33333

#define die(msg) do { perror(msg); exit(EXIT_FAILURE); } while (0)

/**********************************************************************/

/* The following is what we need until glibc gets a wrapper for
  accept4() */

/* Flags for socket(), socketpair(), accept4() */
#undef SOCK_CLOEXEC
#define SOCK_CLOEXEC    010000000
#ifndef SOCK_NONBLOCK
#define SOCK_NONBLOCK   O_NONBLOCK
#endif

#define SYS_accept4 319

static int
__accept4(int fd, struct sockaddr *sockaddr, socklen_t *addrlen, int flags)
{
   printf("Calling accept4(): flags = 0x%x", flags);
   if (flags != 0) {
       printf(" (");
       if (flags & SOCK_CLOEXEC)
           printf("SOCK_CLOEXEC");
       if ((flags & SOCK_CLOEXEC) && (flags & SOCK_NONBLOCK))
           printf(" ");
       if (flags & SOCK_NONBLOCK)
           printf("SOCK_NONBLOCK");
       printf(")");
   }
   printf("\n");

#if USE_SOCKETCALL
   long args[6];

   args[0] = fd;
   args[1] = (long) sockaddr;
   args[2] = (long) addrlen;
   args[3] = flags;

   return syscall(SYS_socketcall, SYS_ACCEPT4, args);
#else
   return syscall(SYS_accept4, fd, sockaddr, addrlen, flags);
#endif
}

/**********************************************************************/

static int
do_test(int lfd, struct sockaddr_in *conn_addr,
       int closeonexec_flag, int nonblock_flag)
{
   int connfd, acceptfd;
   int fdf, flf, fdf_pass, flf_pass;
   struct sockaddr_in claddr;
   socklen_t addrlen;

   printf("=======================================\n");

   connfd = socket(AF_INET, SOCK_STREAM, 0);
   if (connfd == -1)
       die("socket");
   if (connect(connfd, (struct sockaddr *) conn_addr,
               sizeof(struct sockaddr_in)) == -1)
       die("connect");

   addrlen = sizeof(struct sockaddr_in);
   acceptfd = __accept4(lfd, (struct sockaddr *) &claddr, &addrlen,
                      closeonexec_flag | nonblock_flag);
   if (acceptfd == -1) {
       perror("accept4()");
       close(connfd);
       return 0;
   }

   fdf = fcntl(acceptfd, F_GETFD);
   if (fdf == -1)
       die("fcntl:F_GETFD");
   fdf_pass = ((fdf & FD_CLOEXEC) != 0) ==
              ((closeonexec_flag & SOCK_CLOEXEC) != 0);
   printf("Close-on-exec flag is %sset (%s); ",
           (fdf & FD_CLOEXEC) ? "" : "not ",
           fdf_pass ? "OK" : "failed");

   flf = fcntl(acceptfd, F_GETFL);
   if (flf == -1)
       die("fcntl:F_GETFD");
   flf_pass = ((flf & O_NONBLOCK) != 0) ==
              ((nonblock_flag & SOCK_NONBLOCK) !=0);
   printf("nonblock flag is %sset (%s)\n",
           (flf & O_NONBLOCK) ? "" : "not ",
           flf_pass ? "OK" : "failed");

   close(acceptfd);
   close(connfd);

   printf("Test result: %s\n", (fdf_pass && flf_pass) ? "PASS" : "FAIL");
   return fdf_pass && flf_pass;
}

static int
create_listening_socket(int port_num)
{
   struct sockaddr_in svaddr;
   int lfd;
   int optval;

   memset(&svaddr, 0, sizeof(struct sockaddr_in));
   svaddr.sin_family = AF_INET;
   svaddr.sin_addr.s_addr = htonl(INADDR_ANY);
   svaddr.sin_port = htons(port_num);

   lfd = socket(AF_INET, SOCK_STREAM, 0);
   if (lfd == -1)
       die("socket");

   optval = 1;
   if (setsockopt(lfd, SOL_SOCKET, SO_REUSEADDR, &optval,
                  sizeof(optval)) == -1)
       die("setsockopt");

   if (bind(lfd, (struct sockaddr *) &svaddr,
            sizeof(struct sockaddr_in)) == -1)
       die("bind");

   if (listen(lfd, 5) == -1)
       die("listen");

   return lfd;
}

int
main(int argc, char *argv[])
{
   struct sockaddr_in conn_addr;
   int lfd;
   int port_num;
   int passed;

   passed = 1;

   port_num = (argc > 1) ? atoi(argv[1]) : PORT_NUM;

   memset(&conn_addr, 0, sizeof(struct sockaddr_in));
   conn_addr.sin_family = AF_INET;
   conn_addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
   conn_addr.sin_port = htons(port_num);

   lfd = create_listening_socket(port_num);

   if (!do_test(lfd, &conn_addr, 0, 0))
       passed = 0;
   if (!do_test(lfd, &conn_addr, SOCK_CLOEXEC, 0))
       passed = 0;
   if (!do_test(lfd, &conn_addr, 0, SOCK_NONBLOCK))
       passed = 0;
   if (!do_test(lfd, &conn_addr, SOCK_CLOEXEC, SOCK_NONBLOCK))
       passed = 0;

   close(lfd);

   exit(passed ? EXIT_SUCCESS : EXIT_FAILURE);
}

--ReaqsoxgOBHFXBhH--
