From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] DIFF use 6-regs in copy_user_page_asm
Date: Sun, 2 Jan 2005 23:19:10 -0700
Message-ID: <20050103061910.GJ15061@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


This patch adds one more cycle between the load and store of a
given register by using three pairs of registers instead of two.
I had previously quoted one of the PA-8xxx papers that indicated
L1 cache was 2 cycles latency.
With this diff, the unrolled part of the loop now meets that.
The prolog and epilogue obviously cannot.

If anyone can show me a workload that improves with this diff,
I'll apply it. Otherwise it's just an academic excercise.

BTW, I don't really trust build-tools/cpup.c unless someone
can convince me it's really running in wide mode and not getting
lots of page faults/page zeroing to interfere with the test.
Maybe need to iterate over a smaller buffer (e.g. 64MB) several times
and ignore the first iteration. Maybe also record cr16 values between
calls to find a minima and median *after* all the copying
is done.

thanks,
grant

ps. The "alignment doesn't matter" comment is too short. It really
    means the alignment doesn't matter for the rest of the loop.
    ie I don't need to add nops to seperate the pairs of "std" insns.

Index: arch/parisc/kernel/pacache.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/pacache.S,v
retrieving revision 1.14
diff -u -p -r1.14 pacache.S
--- arch/parisc/kernel/pacache.S	30 Dec 2004 08:07:48 -0000	1.14
+++ arch/parisc/kernel/pacache.S	3 Jan 2005 05:59:19 -0000
@@ -306,51 +306,52 @@ copy_user_page_asm:
 
 	ldd		0(%r25), %r19		/* bundle 1 */
 	ldi		32, %r1                 /* PAGE_SIZE/128 == 32 */
-
 1:	ldd		8(%r25), %r20
 	ldw		256(%r25), %r0		/* prefetch 4 cacheline ahead */
 
 	ldd		16(%r25), %r21		/* bundle 2 */
 	ldd		24(%r25), %r22
+	nop		/* preserve alignment of quads */
+	nop		/* preserve alignment of quads */
+
+	ldd		32(%r25), %r23		/* bundle 3 */
+	ldd		40(%r25), %r24
 	std		%r19, 0(%r26)
 	std		%r20, 8(%r26)
 
-	ldd		32(%r25), %r19		/* bundle 3 */
-	ldd		40(%r25), %r20
+	ldd		48(%r25), %r19		/* bundle 4 */
+	ldd		56(%r25), %r20
 	std		%r21, 16(%r26)
 	std		%r22, 24(%r26)
 
-	ldd		48(%r25), %r21		/* bundle 4 */
-	ldd		56(%r25), %r22
-	std		%r19, 32(%r26)
-	std		%r20, 40(%r26)
-
-	ldd		64(%r25), %r19		/* bundle 5 */
-	ldd		72(%r25), %r20
-	std		%r21, 48(%r26)
-	std		%r22, 56(%r26)
-
-	ldd		80(%r25), %r21		/* bundle 6 */
-	ldd		88(%r25), %r22
-	std		%r19, 64(%r26)
-	std		%r20, 72(%r26)
+	ldd		64(%r25), %r21		/* bundle 5 */
+	ldd		72(%r25), %r22
+	std		%r23, 32(%r26)
+	std		%r24, 40(%r26)
+
+	ldd		80(%r25), %r23		/* bundle 6 */
+	ldd		88(%r25), %r24
+	std		%r19, 48(%r26)
+	std		%r20, 56(%r26)
 
 	ldd		 96(%r25), %r19		/* bundle 7 */
 	ldd		104(%r25), %r20
-	std		%r21, 80(%r26)
-	std		%r22, 88(%r26)
+	std		%r21, 64(%r26)
+	std		%r22, 72(%r26)
 
 	ldd		112(%r25), %r21		/* bundle 8 */
 	ldd		120(%r25), %r22
+	std		%r23, 80(%r26)
+	std		%r24, 88(%r26)
+
+	ldo		128(%r25), %r25		/* alignment doesn't matter */
 	std		%r19, 96(%r26)
 	std		%r20, 104(%r26)
