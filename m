From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: copy_user_page_asm suggested 64bit improvment
	(Test case)
Date: Tue, 28 Dec 2004 22:46:55 -0700
Message-ID: <20041229054655.GB11816@colo.lackof.org>
References: <418A80E8000124B5@mail-6-bnl.tiscali.it>
	<20041227073654.GI29492@colo.lackof.org>
	<41D18909.9060308@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41D18909.9060308@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Dec 28, 2004 at 04:25:45PM +0000, Joel Soete wrote:
> A test case may can help better to show improvement:
> 
> gcc -O2 -o cpup0 cpup0.c
> gcc -march=2.0 -O2 -DLP64 -o cpup1 cpup0.c
> gcc -march=2.0 -O2 -DLP64 -DV1 -o cpup2 cpup0.c
> gcc -march=2.0 -O2 -DLP64 -DV2 -o cpup3 cpup0.c

As usual, I've hacked the cpup.c test.
Don't compare my results below with the previous ones Joel posted.
I've committed my version of cpup.c to "build-tools" repository.

grundler <549>for j in 1 2 3 4 5 ; do echo -n $j " " ; for i in 0 1 2 3; do time ./cpup$i ; done 2>&1 | fgrep user | cut -f2 ; done

and globbed the output a bit so it looks like a table:
#   cpup0    cpup1    cpup2    cpup3
1  0m1.033s 0m0.616s 0m0.607s 0m0.616s
2  0m1.039s 0m0.651s 0m0.587s 0m0.589s
3  0m1.004s 0m0.605s 0m0.631s 0m0.613s
4  0m1.015s 0m0.615s 0m0.572s 0m0.592s
5  0m1.014s 0m0.619s 0m0.564s 0m0.607s

Results are not statistically significant between 64-bit variants.
Results are from 2.6.10-rc3-pa6 SMP 64-bit kernel on a500-65 w/8G RAM
that was running a compile in the background.

cpupX columns above are defined by the following:
/*
** gcc -O2 -o cpup0 cpup.c             vanilla 32-bit loop
**      -march=2.0 -DLP64 -o cpup1      64-bit, 4ld + 4st sequences
**      -march=2.0 -DLP64 -DV1 -o cpup2 64-bit, 4regs, 2ld/2st bundles
**      -march=2.0 -DLP64 -DUSE6REGS -o cpup3 64-bit, 6 regs, 2ld/2st bundles
*/

And I'm wondering how/if 64-bit user space test ever worked since we don't
officially support 64-bit user space.
Likely I'm copying trash around even though the pointers are probably intact.

cpup2 is what I'd like to commit for the kernel version.
I've appended the patch.

I was expecting cpup3 would be slightly faster but don't have data
to prove it. And I'm still worried that GR23/GR24 won't be saved
by the caller since the __copy_user_page_asm function prototype
only specifies two arguments.

thanks,
grant


Index: arch/parisc/kernel/pacache.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/pacache.S,v
retrieving revision 1.13
diff -u -p -r1.13 pacache.S
--- arch/parisc/kernel/pacache.S	19 Dec 2004 04:50:35 -0000	1.13
+++ arch/parisc/kernel/pacache.S	29 Dec 2004 05:37:46 -0000
@@ -295,17 +295,72 @@ copy_user_page_asm:
 	.callinfo NO_CALLS
 	.entry
 
-	ldi		64, %r1
+#ifdef __LP64__
+	/* PA8x00 CPUs can consume 2 loads and 2 stores per cycle.
+	 * Unroll the loop by hand and arrange insn appropriately.
+	 * GCC probably can do this just as well.
+	 *
+	 * Prefetching and using more regs to increase the "distance"
+	 * between ldd and corresponding std are possible optimizations.
+	 */
+
+	ldi		32, %r1                 /* PAGE_SIZE/128 == 32 */
+
+1:	ldd		0(%r25), %r19		/* prolog == 1 bundle */
+	ldd		8(%r25), %r20
+
+	ldd		16(%r25), %r21		/* bundle 2 */
+	ldd		24(%r25), %r22
+	std		%r19, 0(%r26)
+	std		%r20, 8(%r26)
+
+	ldd		32(%r25), %r19		/* bundle 3 */
+	ldd		40(%r25), %r20
+	std		%r21, 16(%r26)
+	std		%r22, 24(%r26)
+
+	ldd		48(%r25), %r21		/* bundle 4 */
+	ldd		56(%r25), %r22
+	std		%r19, 32(%r26)
+	std		%r20, 40(%r26)
+
+	ldd		64(%r25), %r19		/* bundle 5 */
+	ldd		72(%r25), %r20
+	std		%r21, 48(%r26)
+	std		%r22, 56(%r26)
+
+	ldd		80(%r25), %r21		/* bundle 6 */
+	ldd		88(%r25), %r22
+	std		%r19, 64(%r26)
+	std		%r20, 72(%r26)
+
+	ldd		 96(%r25), %r19		/* bundle 7 */
+	ldd		104(%r25), %r20
+	std		%r21, 80(%r26)
+	std		%r22, 88(%r26)
+
+	ldd		112(%r25), %r21		/* bundle 8 */
+	ldd		120(%r25), %r22
+	std		%r19, 96(%r26)
+	std		%r20, 104(%r26)
+
+	ldo		128(%r25), %r25		/* epilog == 2 bundles */
+	std		%r21, 112(%r26)
+	std		%r22, 120(%r26)
+
+	ADDIB>		-1, %r1, 1b
+	ldo		128(%r26), %r26
+
+#else
 
 	/*
 	 * This loop is optimized for PCXL/PCXL2 ldw/ldw and stw/stw
-	 * bundles (very restricted rules for bundling). It probably
-	 * does OK on PCXU and better, but we could do better with
-	 * ldd/std instructions. Note that until (if) we start saving
+	 * bundles (very restricted rules for bundling).
+	 * Note that until (if) we start saving
 	 * the full 64 bit register values on interrupt, we can't
 	 * use ldd/std on a 32 bit kernel.
 	 */
-
+	ldi		64, %r1		/* PAGE_SIZE/64 == 64 */
 
 1:
 	ldw		0(%r25), %r19
@@ -343,7 +398,7 @@ copy_user_page_asm:
 	ldo		64(%r26), %r26
 	ADDIB>		-1, %r1, 1b
 	ldo		64(%r25), %r25
