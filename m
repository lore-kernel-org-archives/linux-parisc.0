Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA25925
	for <parisc-linux@puffin.external.hp.com>; Thu, 31 Aug 2000 20:16:43 -0600
Message-Id: <200009010220.TAA20141@milano.cup.hp.com>
To: gcc-patches@gcc.gnu.org
Cc: parisc-linux@thepuffingroup.com
Date: Thu, 31 Aug 2000 19:20:06 -0700
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] PATCH: build gcc/gcc/depedence.c w/HPUX ANSI C
List-ID: <linux-parisc.vger.kernel.org>


Hi folks,
I work on the parisc-linux port and was trying to build binutils/gcc
on an HP-UX 11 system. HP-UX ansic didn't like enum direction_type[][]
or int[][] constructs.  It complained with:
cc: "/linux/pa32/gcc/gcc/dependence.c", line 199: error 1501: Only the first
	dimension of an array may be omitted.

I've been told GCC refuses to compile the same thing with:
	x.c:1: warning: array `i' assumed to have one element
	x.c:1: storage size of `i' isn't known

This is probably not exactly the right fix but at least I can
build a binary now. I haven't tested the resulting binary.

thanks,
grant

grundler <815>cvs diff gcc/gcc/dependence.c
Index: gcc/gcc/dependence.c
===================================================================
RCS file: /home/cvs/parisc/gcc/gcc/dependence.c,v
retrieving revision 1.1
diff -u -p -r1.1 dependence.c
--- dependence.c        2000/08/22 20:56:22     1.1
+++ dependence.c        2000/08/31 23:44:27
@@ -196,15 +196,15 @@ static int get_one_coefficient PARAMS ((
 static void normalize_coefficients PARAMS ((subscript[], loop*, int));
 static void classify_dependence PARAMS ((subscript[], subscript[],
                                 enum complexity_type[], int*, int));
-static void ziv_test PARAMS ((subscript[], subscript[], enum direction_type[][],
-                     int[][], loop*, int));
-static void siv_test PARAMS ((subscript[], subscript[], enum direction_type[][],
-                     int[][], loop*, int));
+static void ziv_test PARAMS ((subscript[], subscript[], enum direction_type[MAX_SUBSCRIPTS][MAX_SUBSCRIPTS],
+                     int[MAX_SUBSCRIPTS][MAX_SUBSCRIPTS], loop*, int));
+static void siv_test PARAMS ((subscript[], subscript[], enum direction_type[MAX_SUBSCRIPTS][MAX_SUBSCRIPTS],
+                     int[MAX_SUBSCRIPTS][MAX_SUBSCRIPTS], loop*, int));
 static int check_subscript_induction PARAMS ((subscript*, subscript*, loop*));
-static void gcd_test PARAMS ((subscript[], subscript[], enum direction_type[][],
-                     int[][], loop*, int));
+static void gcd_test PARAMS ((subscript[], subscript[], enum direction_type[MAX_SUBSCRIPTS][MAX_SUBSCRIPTS],
+                     int[MAX_SUBSCRIPTS][MAX_SUBSCRIPTS], loop*, int));
 static int find_gcd PARAMS ((int, int));
-static void merge_dependencies PARAMS ((enum direction_type[][], int[][], int, int));
+static void merge_dependencies PARAMS ((enum direction_type[MAX_SUBSCRIPTS][MAX_SUBSCRIPTS], int[MAX_SUBSCRIPTS][MAX_SUBSCRIPTS], int, int));
 static void dump_array_ref PARAMS ((tree));
 static void dump_one_node PARAMS ((def_use*, varray_type*));
 static void dump_node_dependence PARAMS ((void));
