Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.cs.tu-berlin.de (mail.cs.tu-berlin.de [130.149.17.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id A69674829
	for <parisc-linux@parisc-linux.org>; Thu, 29 May 2003 10:13:37 -0600 (MDT)
From: Matthias Klose <doko@cs.tu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <16086.12537.788243.943349@gargle.gargle.HOWL>
Date: Thu, 29 May 2003 18:10:33 +0200
To: "H. J. Lu" <hjl@lucon.org>
Cc: Randolph Chung <tausq@debian.org>, bug-binutils@gnu.org,
	binutils@sources.redhat.com, parisc-linux@parisc-linux.org,
	debian-gcc@lists.debian.org
Subject: Re: [parisc-linux] Re: [hppa] binutils will not build shared libraries with external deps?
In-Reply-To: <20030528132757.A14921@lucon.org>
References: <20030527052251.GC24873@tausq.org>
	<20030528190706.GC21904@bubble.sa.bigpond.net.au>
	<20030528132757.A14921@lucon.org>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

H. J. Lu writes:
> On Thu, May 29, 2003 at 04:37:06AM +0930, amodra@bigpond.net.au wrote:
> > On Mon, May 26, 2003 at 10:22:51PM -0700, Randolph Chung wrote:
> > > tausq@ios:~$ gcc -shared -fPIC -o blah.so blah.c
> > > /tmp/ccC3fZeH.o(.text+0x1c): In function `call_foo':
> > > : undefined reference to `foo'
> > 
> > This should fix it.  Would someone mind applying it for me?  I'm in
> > transit at the moment and internet access is slow and flaky.  2.14
> > branch too, I guess.
> 
> Applied to mainline.

built binutils-2.14.90.0.4 with this patch, diffs between 2.14.90.0.3
and 2.14.90.0.4 (plus patch) attached.

	Matthias

--- ../ts-2.14.90.0.3	2003-05-28 23:26:27.000000000 +0200
+++ ../ts-2.14.90.0.4	2003-05-28 23:27:04.000000000 +0200
@@ -1,4 +1,4 @@
-Test Run By doko on Sat May 24 09:29:16 2003
+Test Run By doko on Wed May 28 23:17:19 2003
 Native configuration is hppa-unknown-linux-gnu
 
 		=== binutils tests ===
@@ -52,7 +52,7 @@
 		=== binutils Summary ===
 
 # of expected passes		32
-Test Run By doko on Sat May 24 09:29:43 2003
+Test Run By doko on Wed May 28 23:17:47 2003
 Native configuration is hppa-unknown-linux-gnu
 
 		=== gas tests ===
@@ -385,7 +385,7 @@
 # of expected failures		11
 ../as-new Inc.
 
-Test Run By doko on Sat May 24 09:33:34 2003
+Test Run By doko on Wed May 28 23:21:37 2003
 Native configuration is hppa-unknown-linux-gnu
 
 		=== ld tests ===
@@ -425,7 +425,7 @@
 PASS: size/aligment change of common symbols (change 2)
 Running ld/testsuite/ld-elfvers/vers.exp ...
 PASS: vers1
-FAIL: vers2
+PASS: vers2
 PASS: vers3
 PASS: vers4
 PASS: vers4a
@@ -472,7 +472,7 @@
 PASS: vers27c1
 PASS: vers27c2
 PASS: vers27d1
-FAIL: vers27d2
+PASS: vers27d2
 PASS: vers27d3
 PASS: vers27d4
 PASS: vers27d5
@@ -485,9 +485,9 @@
 PASS: ld-elfvsb/protected1
 FAIL: visibility (hidden) (non PIC)
 FAIL: visibility (hidden) (non PIC, load offset)
-FAIL: visibility (hidden)
+PASS: visibility (hidden)
 FAIL: visibility (hidden) (PIC main, non PIC so)
-FAIL: visibility (hidden) (PIC main)
+PASS: visibility (hidden) (PIC main)
 FAIL: visibility (hidden_normal) (non PIC)
 FAIL: visibility (hidden_normal) (non PIC, load offset)
 FAIL: visibility (hidden_normal)
@@ -500,9 +500,9 @@
 PASS: visibility (hidden_undef) (PIC main)
 FAIL: visibility (hidden_undef_def) (non PIC)
 FAIL: visibility (hidden_undef_def) (non PIC, load offset)
-FAIL: visibility (hidden_undef_def)
+PASS: visibility (hidden_undef_def)
 FAIL: visibility (hidden_undef_def) (PIC main, non PIC so)
-FAIL: visibility (hidden_undef_def) (PIC main)
+PASS: visibility (hidden_undef_def) (PIC main)
 FAIL: visibility (hidden_weak) (non PIC)
 FAIL: visibility (hidden_weak) (non PIC, load offset)
 FAIL: visibility (hidden_weak)
@@ -510,9 +510,9 @@
 FAIL: visibility (hidden_weak) (PIC main)
 FAIL: visibility (protected) (non PIC)
 FAIL: visibility (protected) (non PIC, load offset)
-FAIL: visibility (protected)
+PASS: visibility (protected)
 FAIL: visibility (protected) (PIC main, non PIC so)
-FAIL: visibility (protected) (PIC main)
+PASS: visibility (protected) (PIC main)
 FAIL: visibility (protected_undef) (non PIC)
 FAIL: visibility (protected_undef) (non PIC, load offset)
 PASS: visibility (protected_undef)
@@ -520,9 +520,9 @@
 PASS: visibility (protected_undef) (PIC main)
 FAIL: visibility (protected_undef_def) (non PIC)
 FAIL: visibility (protected_undef_def) (non PIC, load offset)
-FAIL: visibility (protected_undef_def)
+PASS: visibility (protected_undef_def)
 FAIL: visibility (protected_undef_def) (PIC main, non PIC so)
-FAIL: visibility (protected_undef_def) (PIC main)
+PASS: visibility (protected_undef_def) (PIC main)
 FAIL: visibility (protected_weak) (non PIC)
 FAIL: visibility (protected_weak) (non PIC, load offset)
 FAIL: visibility (protected_weak)
@@ -547,10 +547,10 @@
 FAIL: ELF weak func last DSO
 PASS: ELF DSO weak data first
 PASS: ELF DSO weak data last
-FAIL: ELF DSO weak data first DSO
-FAIL: ELF DSO weak data last DSO
-FAIL: ELF DSO weak data first DSO common
-FAIL: ELF DSO weak data last DSO common
+PASS: ELF DSO weak data first DSO
+PASS: ELF DSO weak data last DSO
+PASS: ELF DSO weak data first DSO common
+PASS: ELF DSO weak data last DSO common
 PASS: ELF weak data first
 PASS: ELF weak data last
 PASS: ELF weak data first common
@@ -613,10 +613,10 @@
 Running ld/testsuite/ld-shared/shared.exp ...
 FAIL: shared (non PIC)
 FAIL: shared (non PIC, load offset)
-FAIL: shared
+PASS: shared
 PASS: shared -Bsymbolic
 FAIL: shared (PIC main, non PIC so)
-FAIL: shared (PIC main)
+PASS: shared (PIC main)
 Running ld/testsuite/ld-sparc/sparc.exp ...
 Running ld/testsuite/ld-srec/srec.exp ...
 XFAIL: S-records
@@ -635,8 +635,8 @@
 
 		=== ld Summary ===
 
-# of expected passes		117
-# of unexpected failures	63
+# of expected passes		133
+# of unexpected failures	47
 # of expected failures		4
 builddir-single/ld/ld-new Inc.
 
