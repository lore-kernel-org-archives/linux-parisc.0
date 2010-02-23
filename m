From: tip-bot for Roland McGrath <roland@redhat.com>
Subject: [tip:x86/ptrace] parisc: Disable CONFIG_HAVE_ARCH_TRACEHOOK
Date: Tue, 23 Feb 2010 18:36:43 GMT
Message-ID: <tip-5e6dbc260704ce4d22fc9664f517f0bb6748feaa@git.kernel.org>
References: <20100222183707.8749D64C@magilla.sf.frob.com>
Reply-To: mingo@redhat.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
	  roland@redhat.com, jejb@parisc-linux.org, tglx@linutronix.de,
	  linux-parisc@vger.kernel.org, deller@gmx.de, kyle@mcmartin.ca
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-kernel@vger.kernel.org, hpa@zytor.com, mingo@redhat.com,
	roland@redhat.com, jejb@parisc-linux.org,
	linux-parisc@vger.kernel.org, tglx@linutronix.de, deller@gmx.de,
	kyle@mcmartin.ca
To: linux-tip-commits@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100222183707.8749D64C@magilla.sf.frob.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Commit-ID:  5e6dbc260704ce4d22fc9664f517f0bb6748feaa
Gitweb:     http://git.kernel.org/tip/5e6dbc260704ce4d22fc9664f517f0bb6748feaa
Author:     Roland McGrath <roland@redhat.com>
AuthorDate: Mon, 22 Feb 2010 10:37:07 -0800
Committer:  H. Peter Anvin <hpa@zytor.com>
CommitDate: Tue, 23 Feb 2010 10:34:41 -0800

parisc: Disable CONFIG_HAVE_ARCH_TRACEHOOK

> FYI, this commit broke tip:master on PARISC (other architectures are fine):
>
>  kernel/built-in.o: In function `ptrace_request':
>  (.text.ptrace_request+0x2cc): undefined reference to `task_user_regset_view'

This means that parisc failed to meet the documented requirements for
setting CONFIG_HAVE_ARCH_TRACEHOOK, but set it anyway.  If arch folks don't
follow the specs, it defeats the whole purpose of having clear statements
of requirements for arch code.

Until parisc finishes up its requirements, disable CONFIG_HAVE_ARCH_TRACEHOOK.

Signed-off-by: H. Peter Anvin <hpa@zytor.com>
LKML-Reference: <20100222183707.8749D64C@magilla.sf.frob.com>
Cc: <linux-parisc@vger.kernel.org>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Helge Deller <deller@gmx.de>
Cc: James E.J. Bottomley <jejb@parisc-linux.org>
---
 arch/parisc/Kconfig |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 524d935..f388dc6 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -18,7 +18,6 @@ config PARISC
 	select BUG
 	select HAVE_PERF_EVENTS
 	select GENERIC_ATOMIC64 if !64BIT
-	select HAVE_ARCH_TRACEHOOK
 	help
 	  The PA-RISC microprocessor is designed by Hewlett-Packard and used
 	  in many of their workstations & servers (HP9000 700 and 800 series,
