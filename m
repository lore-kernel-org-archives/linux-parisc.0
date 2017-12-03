From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Debian vmlinux-4.14.0-1-parisc64-smp fails to boot on c3750
Date: Sun, 3 Dec 2017 15:37:25 -0500
Message-ID: <30E98BD7-6BDC-4CAA-AFE6-99B02647D429@bell.net>
References: <008A2452-42ED-45E9-8FDE-69757C9D6962@bell.net> <5b767291-0b39-b38b-26f6-80bb6f462032@gmx.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5b767291-0b39-b38b-26f6-80bb6f462032@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-12-03, at 3:21 PM, Helge Deller wrote:

> On 03.12.2017 17:54, John David Anglin wrote:
>> Fails early, probably in palo.  I don't have a boot log as the machine has a graphics console.
>> 
>> ii  linux-image-4.13.0-1-parisc64-smp          4.13.13-1     hppa         Linux 4.13 for multiprocessor 64-bit PA-RISC
>> ii  linux-image-4.14.0-1-parisc64-smp          4.14.2-1      hppa         Linux 4.14 for multiprocessor 64-bit PA-RISC
>> 
>> The 4.13.13-1 kernel boots okay.
>> 
>> root@hiauly6:/var/log# dpkg -l palo
>> ii  palo                               1.99                   hppa                   Linux boot loader for HP PA-RISC
> 
> 
> Strange.
> It works nicely for me on my C3700 machine:
> 
> 
> palo ipl 1.99 http://www.parisc-linux.org - Fri, 18 Aug 2017 11:50:44 +0200
> Skipping extended partition 6 - beyond reach of IPL
> 
> Partition Start(MB) End(MB) Id Type
> 1               2      33   f0 Palo
> 2              34     157   83 ext2
> 5             159   134887   83 ext2
> 
> PALO(F0) partition contains:
>    0/vmlinux64 18847280(0) bytes @ 0x140000
> 
> Information: No console specified on kernel command line. This is normal.
> PALO will choose the console currently used by firmware (serial).
> Command line for kernel: 'root=LABEL=ROOT rootfstype=ext4 HOME=/ panic_timeout=60 panic=-1 console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux'
> Selected kernel: /vmlinux from partition 2
> Selected ramdisk: /initrd.img from partition 2
> ELF64 executable
> Entry 00100000 first 00100000 n 5
> Segment 0 load 00100000 size 463104 mediaptr 0x1000
> Segment 1 load 00172000 size 210976 mediaptr 0x73000
> Segment 2 load 00200000 size 10634416 mediaptr 0xa7000
> Segment 3 load 00c25000 size 3194732 mediaptr 0xacc000
> Segment 4 load 01000000 size 2631320 mediaptr 0xdd8000

Console output stops at the above line.  I'm using VisEG console (tty).  Also, on rp3440 command line console
changed from ttyS1 to ttyS0.

Dave
--
John David Anglin	dave.anglin@bell.net



