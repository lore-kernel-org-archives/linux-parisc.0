From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] [PATCH] dlfcn/default fixes for hppa
Date: Mon, 11 Aug 2003 23:59:29 -0400
Message-ID: <20030812035929.GC9325__1953.6453801722$1416622674$gmane$org@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
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

libc-alpha,

The hppa backend in gcc uses type information to determine if the variable 
we manipulate is a function descriptor, and thus, on comparisons, make 
calls behind the scenes to canonicalize that descriptor. When variables are
cast to 'void *' all the type information is lost. I've included a
patch to the dlfcn/default test that changes some of the casts in the test
such as to retain the type information. 

What I've done is to cast 'p' to a function pointer of type 
"(int (*)(int, char **))" rather than casting 'main' to an opaque
pointer of type "(void *)". Second to that I've modified test_in_mod[12]
to take a variable of type "(int (*)(int, char **))" (the address of the
calling main) rather than "(void *)", and carry out the appropriate casting.

This is the only method to do the required casts, and I am open to
comments.

Passes tests without regression on i386, and removes the dlfcn/default
failure from hppa.

Cheers,
Carlos.
---

 libc/dlfcn/default.c     |    6 +++---
 libc/dlfcn/defaultmod1.c |    6 +++---
 libc/dlfcn/defaultmod2.c |    6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

---

2003-08-11  Carlos O'Donell  <carlos@baldric.uwo.ca>

	* dlfcn/default.c (main): 
	Cast dlsym loaded value to same type as main.
	Address passed to test_in_mod1 and test_in_mod2 without casting.
	* dlfcn/defaultmod1.c: Change prototype of test_in_mod1.
	(test_in_mod1): Cast dlsym loaded value to same type as mainp.
	* dlfcn/defaultmod2.c: Change prototype of test_in_mod2.
	(test_in_mod2): Cast dlsym loaded value to same type as mainp.

diff -u -p -r1.2 default.c
--- libc/dlfcn/default.c	16 Nov 2000 02:12:46 -0000	1.2
+++ libc/dlfcn/default.c	29 Jul 2003 16:11:34 -0000
@@ -36,7 +36,7 @@ main (int argc, char *argv[])
       printf ("%s: main not found\n", __FILE__);
       result = 1;
     }
-  else if (p != (void *) &main)
+  else if ((int (*)(int, char **))p != main)
     {
       printf ("%s: wrong address returned for main\n", __FILE__);
       result = 1;
@@ -72,9 +72,9 @@ main (int argc, char *argv[])
   else
     printf ("%s: found_in_mod2 correctly found\n", __FILE__);
 
-  result |= test_in_mod1 ((void *) &main);
+  result |= test_in_mod1 (main);
 
-  result |= test_in_mod2 ((void *) &main);
+  result |= test_in_mod2 (main);
 
   return result;
 }
diff -u -p -r1.2 defaultmod1.c
--- libc/dlfcn/defaultmod1.c	29 Nov 2000 00:03:27 -0000	1.2
+++ libc/dlfcn/defaultmod1.c	29 Jul 2003 16:11:34 -0000
@@ -9,9 +9,9 @@ found_in_mod1 (void)
 }
 
 
-extern int test_in_mod1 (void *mainp);
+extern int test_in_mod1 (int (*mainp)(int, char **));
 int
-test_in_mod1 (void *mainp)
+test_in_mod1 (int (*mainp)(int, char **))
 {
   int (*ifp) (void);
   void *p;
@@ -24,7 +24,7 @@ test_in_mod1 (void *mainp)
       printf ("%s: main not found\n", __FILE__);
       result = 1;
     }
-  else if (p != mainp)
+  else if ((int (*)(int, char **))p != mainp)
     {
       printf ("%s: wrong address returned for main\n", __FILE__);
       result = 1;
diff -u -p -r1.2 defaultmod2.c
--- libc/dlfcn/defaultmod2.c	29 Nov 2000 00:03:27 -0000	1.2
+++ libc/dlfcn/defaultmod2.c	29 Jul 2003 16:11:34 -0000
@@ -16,9 +16,9 @@ found_in_mod2 (void)
 }
 
 
-extern int test_in_mod2 (void *mainp);
+extern int test_in_mod2 (int (*mainp)(int, char **));
 int
-test_in_mod2 (void *mainp)
+test_in_mod2 (int (*mainp)(int, char **))
 {
   int (*ifp) (void);
   void *p;
@@ -31,7 +31,7 @@ test_in_mod2 (void *mainp)
       printf ("%s: main not found\n", __FILE__);
       result = 1;
     }
-  else if (p != mainp)
+  else if ((int (*)(int, char **))p != mainp)
     {
       printf ("%s: wrong address returned for main\n", __FILE__);
       result = 1;
