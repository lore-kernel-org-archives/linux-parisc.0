From: Sasha Levin <Alexander.Levin@microsoft.com>
Subject: [PATCH AUTOSEL for 4.9 277/281] signal/parisc: Document a conflict
 with SI_USER with SIGFPE
Date: Mon, 19 Mar 2018 16:03:23 +0000
Message-ID: <20180319155742.13731-277-alexander.levin@microsoft.com>
References: <20180319155742.13731-1-alexander.levin@microsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        Sasha Levin <Alexander.Levin@microsoft.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180319155742.13731-1-alexander.levin@microsoft.com>
List-ID: <linux-parisc.vger.kernel.org>

From: "Eric W. Biederman" <ebiederm@xmission.com>

[ Upstream commit b5daf2b9d1c9a2b4f03ca93f75913ba2da3b3eaa ]

Setting si_code to 0 results in a userspace seeing an si_code of 0.
This is the same si_code as SI_USER.  Posix and common sense requires
that SI_USER not be a signal specific si_code.  As such this use of 0
for the si_code is a pretty horribly broken ABI.

Further use of si_code =3D=3D 0 guaranteed that copy_siginfo_to_user saw a
value of __SI_KILL and now sees a value of SIL_KILL with the result
that uid and pid fields are copied and which might copying the si_addr
field by accident but certainly not by design.  Making this a very
flakey implementation.

Utilizing FPE_FIXME siginfo_layout will now return SIL_FAULT and the
appropriate fields will reliably be copied.

This bug is 13 years old and parsic machines are no longer being built
so I don't know if it possible or worth fixing it.  But it is at least
worth documenting this so other architectures don't make the same
mistake.

Possible ABI fixes includee:
  - Send the signal without siginfo
  - Don't generate a signal
  - Possibly assign and use an appropriate si_code
  - Don't handle cases which can't happen

Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org
Ref: 313c01d3e3fd ("[PATCH] PA-RISC update for 2.6.0")
Histroy Tree: https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.=
git
Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
---
 arch/parisc/include/uapi/asm/siginfo.h | 7 +++++++
 arch/parisc/kernel/traps.c             | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/include/uapi/asm/siginfo.h b/arch/parisc/include/u=
api/asm/siginfo.h
index 8fd10f85c50e..882a8775441f 100644
--- a/arch/parisc/include/uapi/asm/siginfo.h
+++ b/arch/parisc/include/uapi/asm/siginfo.h
@@ -7,4 +7,11 @@
=20
 #include <asm-generic/siginfo.h>
=20
+/*
+ * SIGFPE si_codes
+ */
+#ifdef __KERNEL__
+#define FPE_FIXME	0	/* Broken dup of SI_USER */
+#endif /* __KERNEL__ */
+
 #endif
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 378df9207406..3172cb52f703 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -627,7 +627,7 @@ void notrace handle_interruption(int code, struct pt_re=
gs *regs)
 			si.si_signo =3D SIGFPE;
 			/* Set to zero, and let the userspace app figure it out from
 			   the insn pointed to by si_addr */
-			si.si_code =3D 0;
+			si.si_code =3D FPE_FIXME;
 			si.si_addr =3D (void __user *) regs->iaoq[0];
 			force_sig_info(SIGFPE, &si, current);
 			return;
--=20
2.14.1
