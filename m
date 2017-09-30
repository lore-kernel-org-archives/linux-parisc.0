From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix double-word compare and exchange on 32-bit kernels
Date: Sat, 30 Sep 2017 17:24:23 -0400
Message-ID: <44C4D87F-A487-4537-AE07-B938416DA437@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-33-218486278
Cc: Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-33-218486278
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

As discussed on the debian-hppa list, double-wordcompare and exchange =
operations
fail on 32-bit kernels.  Looking at the code, I realized that the ",ma" =
completer does the wrong
thing in the  "ldw,ma  4(%r26), %r29" instruction.  This increments %r26 =
and causes the following
store to write to the wrong location.

Signed-off-by: John David Anglin <dave.anglin@bell.net>


--Apple-Mail-33-218486278
Content-Disposition: attachment;
	filename=syscall.S.d.txt
Content-Type: text/plain;
	x-unix-mode=0644;
	name="syscall.S.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 23de307c3052..41e60a9c7db2 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -742,7 +742,7 @@ lws_compare_and_swap_2:
 10:	ldd	0(%r25), %r25
 11:	ldd	0(%r24), %r24
 #else
-	/* Load new value into r22/r23 - high/low */
+	/* Load old value into r22/r23 - high/low */
 10:	ldw	0(%r25), %r22
 11:	ldw	4(%r25), %r23
 	/* Load new value into fr4 for atomic store later */
@@ -834,11 +834,11 @@ cas2_action:
 	copy	%r0, %r28
 #else
 	/* Compare first word */
-19:	ldw,ma	0(%r26), %r29
+19:	ldw	0(%r26), %r29
 	sub,=	%r29, %r22, %r0
 	b,n	cas2_end
 	/* Compare second word */
-20:	ldw,ma	4(%r26), %r29
+20:	ldw	4(%r26), %r29
 	sub,=	%r29, %r23, %r0
 	b,n	cas2_end
 	/* Perform the store */

--Apple-Mail-33-218486278
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



--
John David Anglin	dave.anglin@bell.net

--Apple-Mail-33-218486278--
