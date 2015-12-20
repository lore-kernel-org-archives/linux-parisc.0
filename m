From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Fix syscall restarts
Date: Sun, 20 Dec 2015 18:57:19 -0500
Message-ID: <70AB971F-59D1-4F1C-9CBA-C100FAE74FB7@bell.net>
References: <20151218233034.GA24910@p100.box> <1947554021.268870.1450619952347.JavaMail.zimbra@efficios.com> <1102516129.268911.1450620565285.JavaMail.zimbra@efficios.com> <5676CE11.9020808@gmx.de> <485EBA8B-C9F3-4A5C-9962-ADD70134B52C@bell.net> <56770264.90706@gmx.de> <DB44FC0C-734A-477F-BA28-2271D151F15C@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: multipart/mixed; boundary=Apple-Mail-2--97763325
Cc: Helge Deller <deller@gmx.de>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <DB44FC0C-734A-477F-BA28-2271D151F15C@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--Apple-Mail-2--97763325
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

On 2015-12-20, at 2:46 PM, John David Anglin wrote:

> I think we should fix syscall().  It's not used that much.

Attached is glibc fix.  Testing.

Dave
--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-2--97763325
Content-Disposition: attachment;
	filename=syscall-restart.d.txt
Content-Type: text/plain;
	name="syscall-restart.d.txt"
Content-Transfer-Encoding: quoted-printable

diff --git a/sysdeps/unix/sysv/linux/hppa/syscall.c =
b/sysdeps/unix/sysv/linux/hppa/syscall.c
index 958fa47..9c7ee4f 100644
--- a/sysdeps/unix/sysv/linux/hppa/syscall.c
+++ b/sysdeps/unix/sysv/linux/hppa/syscall.c
@@ -48,8 +48,9 @@ syscall (long int __sysno, ...)
     PIC_REG_DEF
     LOAD_REGS_6
     asm volatile (SAVE_ASM_PIC
-		  "	ble  0x100(%%sr2, %%r0)	\n"
 		  "	copy %1, %%r20		\n"
+		  "	ble  0x100(%%sr2, %%r0)	\n"
+		  "	nop			\n"
 		  LOAD_ASM_PIC
 		  : "=3Dr" (__res)
 		  : "r" (__sysno) PIC_REG_USE ASM_ARGS_6
diff --git a/sysdeps/unix/sysv/linux/hppa/sysdep.h =
b/sysdeps/unix/sysv/linux/hppa/sysdep.h
index 2cae70f..cc16c1a 100644
--- a/sysdeps/unix/sysv/linux/hppa/sysdep.h
+++ b/sysdeps/unix/sysv/linux/hppa/sysdep.h
@@ -434,8 +434,9 @@ L(pre_end):					=
ASM_LINE_SEP	\
 		/* FIXME: HACK save/load r19 around syscall */		=
\
 		asm volatile(						=
\
 			SAVE_ASM_PIC					=
\
-			"	ble  0x100(%%sr2, %%r0)\n"		=
\
 			"	copy %1, %%r20\n"			=
\
+			"	ble  0x100(%%sr2, %%r0)\n"		=
\
+			"	nop\n"					=
\
 			LOAD_ASM_PIC					=
\
 			: "=3Dr" (__res)					=
\
 			: "r" (name) PIC_REG_USE ASM_ARGS_##nr		=
\

--Apple-Mail-2--97763325--
