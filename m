Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xo.hp.is (xo.hp.is [194.105.242.199])
	by dsl2.external.hp.com (Postfix) with ESMTP id 577C4482B
	for <parisc-linux@parisc-linux.org>; Wed, 26 Sep 2001 04:52:59 -0600 (MDT)
Date: Wed, 26 Sep 2001 10:52:55 +0000
From: Richard Allen <ra@hp.is>
To: Jurriaan Kalkman <Jurriaan.Kalkman@zrt.nl>
Cc: parisc-linux@parisc-linux.org
Subject: Re: Betr.: Re: [parisc-linux] Trace/breakpoint trap
Message-ID: <20010926105255.A16693@hp.is>
References: <sbb18da2.041@ms-zrt1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <sbb18da2.041@ms-zrt1>; from Jurriaan.Kalkman@zrt.nl on Wed, Sep 26, 2001 at 08:05:23AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Sep 26, 2001 at 08:05:23AM +0200, Jurriaan Kalkman wrote:

> I have exactly the same on my C200+, since 2.4.9-<who knows>, but it went
> away when I didn't compile the kernel for PA8x00, but for the default value
> of PA7100. That means it may be something in the kernel, or some gcc bug.
> In my case, a 'make mrproper' in the kernel source directory triggered it.
> 
> I have posted it to this list, some weeks ago (under much the same subject).
> 
> Perhaps recompiling your kernel also fixes it?

LOL! :)  

bofh:~# cd /usr/src/linux 
bofh:/usr/src/linux# make menuconfig
Trace/breakpoint trap

Mmm :)    The .config I used contains:

CONFIG_PARISC=y
CONFIG_PA8X00=y
CONFIG_PA20=y
CONFIG_GSC=y
CONFIG_IOMMU_CCIO=y
CONFIG_GSC_LASI=y
CONFIG_GSC_WAX=y
CONFIG_PCI=y
CONFIG_GSC_DINO=y
CONFIG_PCI_LBA=y
CONFIG_WAX_EISA=y
CONFIG_SUPERIO=y
CONFIG_IOSAPIC=y
CONFIG_IOMMU_SBA=y
CONFIG_PCI_NAMES=y
CONFIG_CHASSIS_LCD_LED=y


Im going to try this.   I'll simply get rid of CONFIG_PA8X00 and CONFIG_PA20.

-- 
Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
               --  Solaris 7 Certified Systems and Network Administrator.
Bell Labs Unix --  Reach out and grep someone.
Those who do not understand Unix are condemned to reinvent it, poorly.
