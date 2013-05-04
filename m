From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: use long branch in fork_like macro
Date: Sat, 4 May 2013 15:16:41 -0400
Message-ID: <BLU0-SMTP309E196061626014B6723497BF0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-9-693261634"
Cc: Helge Deller <deller@gmx.de>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-9-693261634
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

The "b" branch instruction used in the fork_like macro only can handle  
17-bit pc-relative offsets.
This fails with an out of range offset with some .config files.   
Rewrite to use the "be" instruction which
can branch to any address in a space.

Signed-off-by: John David Anglin  <dave.anglin@bell.net>
---



--Apple-Mail-9-693261634
Content-Disposition: attachment; filename="fork_like.d.txt"
Content-Type: text/plain; x-unix-mode=0644; name="fork_like.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index f33201b..3a6bb7b 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -1694,7 +1695,8 @@ ENTRY(sys_\name\()_wrapper)
 	ldo	TASK_REGS(%r1),%r1
 	reg_save %r1
 	mfctl	%cr27, %r28
-	b	sys_\name
+	ldil	L%sys_\name, %r31
+	be	R%sys_\name(%sr4,%r31)
 	STREG	%r28, PT_CR27(%r1)
 ENDPROC(sys_\name\()_wrapper)
 	.endm

--Apple-Mail-9-693261634
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit



--
John David Anglin	dave.anglin@bell.net


--Apple-Mail-9-693261634--
