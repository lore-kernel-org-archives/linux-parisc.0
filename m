Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 0A2EB482A
	for <parisc-linux@parisc-linux.org>; Mon, 28 May 2001 01:39:12 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: parisc-linux@parisc-linux.org
Date: Mon, 28 May 2001 09:37:51 +0200
MIME-Version: 1.0
Message-Id: <20010528073912.0A2EB482A@dsl2.external.hp.com>
Subject: [parisc-linux] Fwd: Configure.help entries wanted
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I saw the following mail from lkml and thought we should feed Eric S. Raymond 
with the necessary explanations for 
CONFIG_IODC_CONSOLE and
CONFIG_IOMMU_CCIO.

Anyone to volunteer for CONFIG_IOMMU_CCIO ? 
I can take care of CONFIG_IODC_CONSOLE later today - even if it will be 
removed later in the parisc-kernel development cycle.

Greetings,
Helge

----------  Forwarded Message  ----------
Subject: Configure.help entries wanted
Date: Fri, 25 May 2001 01:22:00 -0400
From: "Eric S. Raymond" <esr@thyrsus.com>
To: CML2 <linux-kernel@vger.kernel.org>, kbuild-devel@lists.sourceforge.net


Over the last few week, Steven Cole and I have been working hard on filling
in the missing entries in Configure.help.  When I accepted the maintainer's
baton from Axel Boldt, there were 537 of these.  There are now 55.  Yes,
we collected around 50 entries and outright wrote close to 450 others.

That's the good news.  The bad news is that the 55 left are the ones we could
not document by reading the code and doing Web searches to find context.
All but two are buried in deep, obscure corners of the port trees.

If we take the open-source idea seriously, we're trying to create a
kernel that can be tinkered with by anyone with a bright idea.
Therefore we should have *every* configuration symbol documented.

Please help.  If you understand what one of these symbols is doing, mail
me and tell me.  Your English doesn't have to be perfectly polished, I'll
take care of that.  The important thing is that your explanation should
provide *motivation* -- not just what the option does, but why somebody
building a kernel might want it on.

Here's an example of a poor explanation:

CONFIG_GONKULATOR
   Say Y here to support adaptive gonkulation using the Randomatics 5523
   board.

Here's an example of a good explanation:

CONFIG_GONKULATOR
   Say Y here to enable adaptive gonkulation using the Randomatics 5523
   board.  With this feature you'll be able to cross-wire your frobozz ports
   to a nonce generator for significantly faster foo-counter spin.

Amaze your friends and confound your enemies with your hackerly erudition --
contribute a Configure.help entry today!

---------------------------------------------------------------------------
Mainline:

CONFIG_NET_SCH_ATM

Multiple ports:

CONFIG_SUN_KEYBOARD

ARM port:

CONFIG_ARCH_FTVPCI
CONFIG_ARCH_NEXUSPCI
CONFIG_ARCH_P720T
CONFIG_CPU_ARM920_CPU_IDLE
CONFIG_CPU_ARM920_D_CACHE_ON
CONFIG_CPU_ARM920_I_CACHE_ON
CONFIG_DEBUG_CLPS711X_UART2
CONFIG_SA1100_SHERMAN

PPC port:

CONFIG_EST8260
CONFIG_BLK_DEV_MPC8xx_IDE
CONFIG_IRQ_ALL_CPUS
CONFIG_USE_MDIO

S390 port:

CONFIG_CHANDEV
CONFIG_CTC
CONFIG_DASD_DIAG
CONFIG_BLK_DEV_XPRAM
CONFIG_FAST_IRQ
CONFIG_IUCV
CONFIG_S390_SUPPORT
CONFIG_S390_TAPE
CONFIG_S390_TAPE_3480
CONFIG_S390_TAPE_3490
CONFIG_S390_TAPE_BLOCK
CONFIG_S390_TAPE_CHAR

SuperH port:

CONFIG_SH_SCI
CONFIG_SH_STANDARD_BIOS
CONFIG_DEBUG_KERNEL_WITH_GDB_STUB

IA64 port:

CONFIG_DISABLE_VHPT
CONFIG_MCKINLEY_A0_SPECIFIC
CONFIG_MCKINLEY_ASTEP_SPECIFIC
CONFIG_IA64_DEBUG_CMPXCHG
CONFIG_IA64_DEBUG_IRQ
CONFIG_IA64_EARLY_PRINTK
CONFIG_IA64_PRINT_HAZARDS

CRIS port:

CONFIG_ETRAX_FLASH_BUSWIDTH
CONFIG_ETRAX_I2C_USES_PB_NOT_PB_I2C
CONFIG_ETRAX_RS485_ON_PA_BIT
CONFIG_ETRAX_SDRAM
CONFIG_ETRAX_SER0_CD_ON_PB_BIT
CONFIG_ETRAX_SER0_DSR_ON_PB_BIT
CONFIG_ETRAX_SER0_DTR_ON_PB_BIT
CONFIG_ETRAX_SER0_RI_ON_PB_BIT
CONFIG_ETRAX_SER1_CD_ON_PB_BIT
CONFIG_ETRAX_SER1_DSR_ON_PB_BIT
CONFIG_ETRAX_SER1_DTR_ON_PB_BIT
CONFIG_ETRAX_SER1_RI_ON_PB_BIT
CONFIG_ETRAX_SER2_CD_ON_PA_BIT
CONFIG_ETRAX_SER2_DSR_ON_PA_BIT
CONFIG_ETRAX_SER2_DTR_ON_PA_BIT
CONFIG_ETRAX_SER2_RI_ON_PA_BIT
CONFIG_JULIETTE

PA-RISC port:

CONFIG_IODC_CONSOLE
CONFIG_IOMMU_CCIO
--
		<a href="http://www.tuxedo.org/~esr/">Eric S. Raymond</a>

Nearly all men can stand adversity, but if you want to test a man's
 character, give him power.
	-- Abraham Lincoln
