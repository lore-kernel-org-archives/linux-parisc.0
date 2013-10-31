From: Chen Gang <gang.chen@asianux.com>
Subject: [PATCH] arch: * : include: asm: remove empty SERIAL_PORT_DFNS in
 serial.h
Date: Thu, 31 Oct 2013 15:37:46 +0800
Message-ID: <527208CA.3000007@asianux.com>
References: <5267406C.9030805@asianux.com> <20131025052926.GA26786@kroah.com> <526BC113.3040003@asianux.com> <5271B1D2.6020301@asianux.com> <C2D7FE5348E1B147BCA15975FBA230751538D9@IN01WEMBXA.internal.synopsys.com> <527202EF.6080704@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
	"w.d.hubbs@gmail.com" <w.d.hubbs@gmail.com>,
	"chris@the-brannons.com" <chris@the-brannons.com>,
	"kirk@reisers.ca" <kirk@reisers.ca>,
	"samuel.thibault@ens-lyon.org" <samuel.thibault@ens-lyon.org>,
	"devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
	"speakup@braille.uwo.ca" <speakup@braille.uwo.ca>
To: Greg KH <gregkh@linuxfoundation.org>,
	"dhowells@redhat.com" <dhowells@redhat.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <527202EF.6080704@asianux.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

If architectures don't support SERIAL_PORT_DFNS, they need not define
it to "nothing", the related drivers need do it by themselves (e.g.
8250 serial driver).

Signed-off-by: Chen Gang <gang.chen@asianux.com>
---
 arch/frv/include/asm/serial.h    |    2 --
 arch/parisc/include/asm/serial.h |    2 --
 2 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/arch/frv/include/asm/serial.h b/arch/frv/include/asm/serial.h
index dbb8259..658ceea 100644
--- a/arch/frv/include/asm/serial.h
+++ b/arch/frv/include/asm/serial.h
@@ -14,5 +14,3 @@
 #define BASE_BAUD 0
 
 #define STD_COM_FLAGS		ASYNC_BOOT_AUTOCONF
-
-#define SERIAL_PORT_DFNS
diff --git a/arch/parisc/include/asm/serial.h b/arch/parisc/include/asm/serial.h
index d7e3cc6..77e9b67 100644
--- a/arch/parisc/include/asm/serial.h
+++ b/arch/parisc/include/asm/serial.h
@@ -6,5 +6,3 @@
  * This is used for 16550-compatible UARTs
  */
 #define BASE_BAUD ( 1843200 / 16 )
