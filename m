Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA04152
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Mar 2000 18:05:54 -0700
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: Ulrich Strelow <ulrich_strelow@yahoo.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ramdisk problem with ELF kernel
Date: Thu, 16 Mar 2000 00:59:32 +0100
Content-Type: text/plain
References: <20000315113909.28758.qmail@web501.mail.yahoo.com>
In-Reply-To: <20000315113909.28758.qmail@web501.mail.yahoo.com>
MIME-Version: 1.0
Message-Id: <00031601070900.00312@P100>
List-ID: <linux-parisc.vger.kernel.org>

Am Wed, 15 Mar 2000 schrieb Ulrich Strelow:
> Hi all,

Hi Ulrich,

> 
> I switched my build environment from HP-UX 10.20 SOM
> to cross compile on x86 ELF and building and booting a
> kernel works fine. Compiling the kernel now only takes
> 5-10 minutes compared to 1 to 1 1/2 hours(!) on my
> 715/33. Great ! But (there is always a but) ...
> 
> Because there is currently no network driver for the
> 715/33 I need to boot with a ramdisk. 

I just checked the hardware-database, and it seems that the 715/33 has a
standard LASI-LAN-Adaptor (i82596, (old driver: Apricot)).
If you enable lasi-support and the "lasi-ethernet"-driver from the
network-devices, you should be able to boot with root-nfs.....


> In former times there was copying ramdisk.bin to /usr/src/linux and
> "make Image", but how to do this now (when "make
> Image" no longer works)?
> 
> This is what I have tried:
> I found the undocumented "-r" switch in palo to add a
> ramdisk to the lif image. I tried both the original
> ramdisk.bin and the compiled ramdisk.o but in both
> cases the kernel is not able to detect the ramdisk.
> 
> Has anyone a solution to this?
> 
> Ulrich

Helge.
