Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (pop.gmx.de [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 32FA5489D
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 28 Dec 2003 13:00:46 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.6 & pdc_console pb on c110: "Warning: unable to
	open an initial console."
Date: Sun, 28 Dec 2003 21:00:40 +0100
References: <3FEDF301.5030901@tiscali.be> <200312280019.55830.deller@gmx.de>
	<3FEF1A99.4010307@tiscali.be>
In-Reply-To: <3FEF1A99.4010307@tiscali.be>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200312282100.40814.deller@gmx.de>
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sunday 28 December 2003 19:02, Joel Soete wrote:
> My goal is to test pdc_console mainly for EARLY_BOOTUP_DEBUG facility (for later b2k 64bit kernel pb).
> Also afaik otc I have to switch off serial mux (well i say uncheck):
> drivers/serial/Kconfig
> [snip]
> config PDC_CONSOLE
>          bool "PDC software console support"
>          depends on PARISC && !SERIAL_MUX && VT
>          default n
> [snip]?

To debug such problems I often just turn on EARLY_BOOTUP_DEBUG 
in arch/parisc/kernel/pdc_cons.c, line 15:

/* Define EARLY_BOOTUP_DEBUG to debug kernel related boot problems.
 * On production kernels EARLY_BOOTUP_DEBUG should be undefined. */
#define EARLY_BOOTUP_DEBUG

HTH,
Helge
