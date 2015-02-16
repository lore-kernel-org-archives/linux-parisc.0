From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: hpux - Drop support for HP-UX binaries
Date: Mon, 16 Feb 2015 22:17:58 +0100
Message-ID: <20150216211758.GA1702@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This patch series drops the support for 32bit HP-UX binaries.

The HP-UX compat layer has always been incomplete and it's unlikely that
someone will ever implement it.

Furthermore those two commits which enhance the compatibility of Linux on parisc
to other architectures:
 f5a408d: parisc: Make EWOULDBLOCK be equal to EAGAIN on parisc
 1f25df2: parisc: Reduce SIGRTMIN from 37 to 32 to behave like other Linux architectures
basically make it impossible to implement the HP-UX support correctly.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 1554a6f..8014727 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -291,10 +291,6 @@ config SYSVIPC_COMPAT
 config AUDIT_ARCH
 	def_bool y
 
-config HPUX
-	bool "Support for HP-UX binaries"
-	depends on !64BIT
