From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] [PATCH] Correctly define mcontext for HPPA
Date: Tue, 19 Nov 2002 01:07:35 -0500
Message-ID: <20021119060735.GH12451__44645.4852157787$1416621947$gmane$org@systemhalted>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="wwU9tsYnHnYeRAKj"
Cc: debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
To: libc-alpha@sources.redhat.com
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--wwU9tsYnHnYeRAKj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


libc-alpha,

A machine context is really a signal context.

This has never worked correctly in hppa since the
kernel has always returned a sigcontext instead of
the struct defined in ucontext.h.

This definition change is made such that glibc
matches the ABI, rather than presenting an odd
view of mcontext_t.

The only thought I have...

- Is there enough information in our sigcontext to
  implement [set,get,make,swap]context calls?

c.

---

2002-08-20  Carlos O'Donell  <carlos@baldric.uwo.ca>

        * sysdeps/unix/sysv/linux/hppa/sys/ucontext.h:
        Define mcontext_t as a sigcontext.


--wwU9tsYnHnYeRAKj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=05-glibc23-hppa-mcontext

diff -urN glibc-2.2.5/sysdeps/unix/sysv/linux/hppa/sys/ucontext.h glibc-2.2.5/sysdeps/unix/sysv/linux/hppa/sys/ucontext.h
--- glibc-2.2.5/sysdeps/unix/sysv/linux/hppa/sys/ucontext.h	2002-08-20 20:50:17.000000000 -0400
+++ glibc-2.2.5/sysdeps/unix/sysv/linux/hppa/sys/ucontext.h	2002-08-20 20:49:01.000000000 -0400
@@ -52,11 +52,7 @@
   } fpregset_t;
 
 /* Context to describe whole processor state.  */
-typedef struct
-  {
-    gregset_t gregs;
-    fpregset_t fpregs;
-  } mcontext_t;
+typedef struct sigcontext mcontext_t;
 
 /* Userlevel context.  */
 typedef struct ucontext


--wwU9tsYnHnYeRAKj--
