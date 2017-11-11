From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Fix validity check of pointer size argument in new CAS implementation
Date: Sat, 11 Nov 2017 17:11:16 -0500
Message-ID: <45F72D1B-5939-43D5-B4E5-B7D604432C02@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-36--444867575
Cc: Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-36--444867575
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

As noted by Christoph Biedl, passing a pointer size of 4 in the new CAS =
implementation causes a
kernel crash.  The attached patch corrects the off by one error in the =
argument validity check.

In reviewing the code, I noticed that we only perform word operations =
with the pointer size argument.
The subi instruction intentionally uses a word condition on 64-bit =
kernels.  Nullification was used instead
of a cmpib instruction as the branch should never be taken.  The shlw =
pseudo-operation generates a
depw,z instruction and it clears the target before doing a shift left =
word deposit.  Thus, we don't need to
clip the upper 32 bits of this argument on 64-bit kernels.

Tested with a gcc testsuite run with a 64-bit kernel.  The gcc atomic =
code in libgcc is the only direct user
of the new CAS implementation that I am aware of.

Signed-off-by: John David Anglin <dave.anglin@bell.net>


--Apple-Mail-36--444867575
Content-Disposition: attachment;
	filename=syscall-size.d.txt
Content-Type: text/plain;
	name="syscall-size.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
index 41e60a9c7db2..e775f80ae28c 100644
--- a/arch/parisc/kernel/syscall.S
+++ b/arch/parisc/kernel/syscall.S
@@ -690,15 +690,15 @@ cas_action:
 	/* ELF32 Process entry path */
 lws_compare_and_swap_2:
 #ifdef CONFIG_64BIT
-	/* Clip the input registers */
+	/* Clip the input registers. We don't need to clip %r23 as we
+	   only use it for word operations */
 	depdi	0, 31, 32, %r26
 	depdi	0, 31, 32, %r25
 	depdi	0, 31, 32, %r24
-	depdi	0, 31, 32, %r23
 #endif
 
 	/* Check the validity of the size pointer */
-	subi,>>= 4, %r23, %r0
+	subi,>>= 3, %r23, %r0
 	b,n	lws_exit_nosys
 
 	/* Jump to the functions which will load the old and new values into

--Apple-Mail-36--444867575
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii



--
John David Anglin	dave.anglin@bell.net

--Apple-Mail-36--444867575--
