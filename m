Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA15987
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Nov 1999 14:02:38 -0700
Date: Wed, 24 Nov 1999 22:05:28 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Philipp Heinrich Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        sieler@allegro.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress - Update
Message-Id: <19991124220528.L1009@mathe.stud.uni-erlangen.de>
References: <19991124203349.J1009@mathe.stud.uni-erlangen.de> <199911242055.PAA14777@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911242055.PAA14777@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

>I have modified real/setup.c, boot/boot_code/ipl_c.c and include/asm/bootdata.h
>so that a default command line is now set when I boot with the hpux loader.
>The default command line now prints during the boot.  However, the system
>is still not able to open an initial console.

ramdisk known to be good (which one do you use, md5sum if possible) ?
.config known to be good (attach it) ?
are you up-to-date with the cvs tree (I have no idea which caches the 735 has,
but cache flushes won't harm (well, they do harm performance)) ?

> Available Virtual mapped memory 0xc0139370 - c5000000
> Memory : 14768K available (536K kernel code, 1016K data, 64K init) [c0000000, c1000000]
> ...
> initrd : c009e000 - c00f5800
> free_area_init : c0143000 c2000000
> mem_map = c0143000
> ...
> 
> The initial BSS clear and the start of free memory are correct.  However,
> the 14768K available and the upper limit for the free_area_init appear
> incorrect.

Only using 16 MB RAM is hard-coded for now.  (Not because we can't detect
more, but because we don't want to use more as that might require additional
BTLB entries.).

	Philipp Rumpf
