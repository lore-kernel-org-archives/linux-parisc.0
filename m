Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id C7D04482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Sep 2001 19:57:39 -0600 (MDT)
Message-Id: <200109250150.TAA30927@puffin.external.hp.com>
To: thunder7@xs4all.nl
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 712/60 boots fine 
In-Reply-To: Message from thunder7@xs4all.nl
   of "Fri, 21 Sep 2001 21:17:33 +0200." <20010921211733.A5505@middle.of.nowhere>
Date: Mon, 24 Sep 2001 19:50:55 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

thunder7@xs4all.nl wrote:
> I guess that means me :-)

Uhm...yeah. :^)

> This is my current palo output:
> 
> jurriaan@pa8200:~$ sudo /sbin/palo
> palo version 0.94 bame@c3k Sat Sep  8 12:33:24 MDT 2001
> ELF32 executable
> Partition Start(MB) End(MB) Id Type
> 1               1      31   f0 Palo
> 2              32    3846   83 ext2
> 3            3847    7661   83 ext2
> 4            7662    8678   82 swap
> ipl: addr 16384 size 28672 entry 0x0
>  ko 0x0 ksz 0 k64o 0x0 k64sz 0 rdo 0 rdsz 0
> <2/boot/vmlinux-2.4.9-pa24 root=/dev/sda2 HOME=/>
> ipl: addr 16384 size 28672 entry 0x0
>  ko 0x44000 ksz 2853588 k64o 0x0 k64sz 0 rdo 0 rdsz 0
> <2/boot/vmlinux-2.4.9-pa24 root=/dev/sda2 HOME=/>
> 
> Now if I understand correctly, palo must
> 
> - warn if there is no f0 partition
> - warn if there is no ext2 partition in the first 2 Gb

warn if the partition with vmlinux (eg /boot/vmlinux) exceeds 2GB.
The problem is palo uses IODC to load data.
IODC can't access beyond 2GB due to signed numbers/offset issues.

Note that your partition 2 violates that rule.

grant
