Return-Path: <rbradetich@uswest.net>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6C587484B
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 16 Apr 2004 02:03:20 -0600 (MDT)
Subject: Re: Antwort: Re: [parisc-linux] Problem with SCSI in K-Class
From: Ryan Bradetich <rbradetich@uswest.net>
To: Jens_Konrad/Linotype/DE@linotype.com
In-Reply-To: <OF8E29CCF9.DD26A3F6-ONC1256E77.007BC8F2-C1256E77.007BC9DE@fonts.de>
References: <OF8E29CCF9.DD26A3F6-ONC1256E77.007BC8F2-C1256E77.007BC9DE@fonts.de>
Content-Type: text/plain
Message-Id: <1082102597.956.8.camel@laptop.bradetich.net>
Mime-Version: 1.0
Date: Fri, 16 Apr 2004 02:03:18 -0600
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hmm... 

I will try to duplicate this problem using disk array over the weekend
to see if this is a generic problem.

Thanks,

- Ryan

On Thu, 2004-04-15 at 16:32, Jens_Konrad/Linotype/DE@linotype.com wrote:
> Hi,
> 
>  
> 
> I just managed to get a screenshot:
> 
>  
> 
> (none):~# mkfs /dev/sde1
> mke2fs 1.27 (8-Mar-2002)
> Filesystem label=
> OS type: Linux
> Block size=4096 (log=2)
> Fragment size=4096 (log=2)
> 6111232 inodes, 12211708 blocks
> 610585 blocks (5.00%) reserved for the super user
> First data block=0
> 373 block groups
> 32768 blocks per group, 32768 fragments per group
> 16384 inodes per group
> Superblock backups stored on blocks:
>        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632,
> 2654208,
>        4096000, 7962624, 11239424
> 
> Writing inode tables:   0/373HHHHHHH  1/373HHHHHHH  2/373HHHHHHH
> 3/373HHHHHHH  4/373HHHHHHH  5/373HHHHHHH  6/373HHHHHHH  7/3
> Writing superblocks and filesystem accounting information: scsi1 (0:0)
> Target is suffering from tag starvation.
> SCSI disk error : host 1 channel 0 id 0 lun 0 return code = 8
> I/O error: dev 08:41, sector 34078720
> SCSI disk error : host 1 channel 0 id 0 lun 0 return code = 8
> I/O error: dev 08:41, sector 34078722
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 04 90 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 04 7c 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 05 c4 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 05 ac 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 05 10 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 05 9c 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 04 00 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 04 80 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 05 c4 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 05 ac 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 05 10 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 05 9c 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 04 00 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 04 80 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 02 04 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 01 d0 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 01 fc 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 02 00 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 04 8c 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants to abort command
>        0x2a 00 04 f4 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants device reset
>        0x2a 00 04 90 00 28 00 00 08 00
> scsi1 (0:0) New error handler wants BUS reset, cmd 21e46e00
>        0x2a 00 04 90 00 28 00 00 08 00
> scsi1: Bus Reset detected, executing command 00000000, slot 00000000,
> dsp 001704a8[04a8]
> failing command because of reset, slot 21e88654, cmnd 21e46e00
> failing command because of reset, slot 21e88788, cmnd 21e47e00
> failing command because of reset, slot 21e888bc, cmnd 21e47800
> failing command because of reset, slot 21e889f0, cmnd 21e46200
> failing command because of reset, slot 21e88b24, cmnd 21e46000
> failing command because of reset, slot 21e88c58, cmnd 21e46400
> failing command because of reset, slot 21e88d8c, cmnd 21e46600
> failing command because of reset, slot 21e88ec0, cmnd 21e46a00
> failing command because of reset, slot 21e88ff4, cmnd 21e47c00
> failing command because of reset, slot 21e89128, cmnd 21e47a00
> failing command because of reset, slot 21e8925c, cmnd 21e47600
> failing command because of reset, slot 21e894c4, cmnd 21e47400
> failing command because of reset, slot 21e895f8, cmnd 21e47200
> failing command because of reset, slot 21e8972c, cmnd 21e47000
> 
> Stack Dump:
> 21e90740:  0004ff0e 00000000 21e90670 21e90650
> 21e90730:  00000000 10228630 00000000 21e90000
> 21e90720:  00000000 00000000 00000000 21e90000
> 21e90710:  00000001 00000002 21f36000 00000002
> 21e90700:  21f3c040 1006c000 103aa010 103aa010
> 21e906f0:  1032b010 1020e448 103cd000 00000001
> 
> Kernel addresses on the stack:
> [<10228630>]  [<1020e448>]  [<102248b8>]  [<1020e51c>]
> [<1020e808>]  [<1020e328>]  [<1020f3bc>]  [<1020f75c>]
> [<10108c4c>]  [<10108cf4>]  [<101375f4>]  [<10137a44>]
> [<10165c4c>]  [<1012307c>]  [<1020d3f0>]  [<10165ee0>]
> [<1020f608>]  [<1020d3f0>]  [<1020d600>]  [<101216f0>]
> 
> 
> Kernel Fault: Code=26 regs=21e90740 (Addr=00000048)
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111100001110 Not tainted
> r00-03  00000000 103ebab8 10228630 21e8972c
> r04-07  21e46e00 1020de94 21f60400 00002000
> r08-11  000003e8 0000ffff 00002000 00001000
> r12-15  00001002 21f61ea0 000000fd f0100000
> r16-19  f0000fe0 f0000074 f000006c 00000080
> r20-23  00000000 21e889f0 10065860 00000000
> r24-27  00000000 00000000 21f60404 10316010
> r28-31  21f60404 10326c00 21e90740 1020e51c
> sr0-3   00000000 00000003 00000000 00000003
> sr4-7   00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: 102286bc 102286c0
> IIR: 4a930090    ISR: 00000000  IOR: 00000048
> CPU:        0   CR30: 21e90000 CR31: 103d8000
> ORIG_R28: 00000000
> 
> 
> Jens Konrad
> 04/15/2004 11:57 PM
> 
> An: Jens Konrad/Linotype/DE
> Kopie: Jens_Konrad/Linotype/DE@linotype.com,
> parisc-linux@lists.parisc-linux.org, Ryan Bradetich
> <rbradetich@uswest.net>
> Blindkopie:
> Thema: Antwort: Re: [parisc-linux] Problem with SCSI in K-Class
> 
> 
> 
> 
> btw
> 
> 
> 
> this also happens when I format the device without a partition on it.
> I will try to get a screenshot.
> 
> Jens Konrad
> 04/15/2004 11:38 PM
> 
> An: Ryan Bradetich <rbradetich@uswest.net>
> Kopie: Jens_Konrad/Linotype/DE@linotype.com,
> parisc-linux@lists.parisc-linux.org
> Blindkopie:
> Thema: Antwort: Re: [parisc-linux] Problem with SCSI in K-Class
> 
> 
>   Hi,
> 
> 
> 
> it is 2.4.23-pa3, I downloaded the kernel from
> http://parisc-linux.org/~rbrad/vmlinux-2.4.23-pa3.bz2 because I needed
> a kernel supporting Mux. I have not yet built my own kernel, not sure
> if that might help.
> 
> 
> 
> Anyway, fdisk always told me that "Partition 1 does not end on
> cylinder boundary:". I then partitioned the drive using sector mode,
> and it worked, fdisk is now fine with the partition. But when I use
> mkfs.ext3 or even mkfs.ext2, it just comes to the writing of the
> superblock information, then it crashes. Kernel fault, code=26,
> regs=21e90740 (Addr=000000481) - if that helps, that is about all I
> can read.
> 
> 
> 
> The drive is a 50GB UW SCSI from Seagate, I use an adapter to connect
> it to the SCSI cable of the K-Class.
> 
> When I check /proc/scsi/scsi, the drive is absolutely okay, it is read
> perfectly. But the format is not done correctly, something is wrong
> with the superblock. When I try to mount /dev/sde1, I am told that the
> superblock could not be read.
> 
> Thanx for your help,
> 
> 
> 
> Jay
> 
> Ryan Bradetich <rbradetich@uswest.net>
> Gesendet von: parisc-linux-bounces@lists.parisc-linux.org
> 04/15/2004 01:32 PM CST
> 
> An: Jens_Konrad/Linotype/DE@linotype.com
> Kopie: parisc-linux@lists.parisc-linux.org
> Blindkopie:
> Thema: Re: [parisc-linux] Problem with SCSI in K-Class
> 
> 
> Which kernel?  I will see if I can duplicate on K460.
> 
> Thanks,
> 
> - Ryan
> 
> On Thu, 2004-04-15 at 13:04, Jens_Konrad/Linotype/DE@linotype.com
> wrote:
> > Hi guys,
> >
> > I got my K-Class 200 working in single kernel mode, it is booting
> from high voltage scsi - on the normal scsi I got a CD-Rom and a
> Streamer.
> >
> > Now I took away the streamer and replaced it with a 50GB SCSI and
> booted the machine. During boot he can see the HD without any problems
> (it is a Seagate), and I can also address it via fdisk (it is
> > sde).
> >
> > But when I try to partition it, it comes as far as writing
> superblocks - and then I get a stack dump and the kernel panics, the
> machine freezes - and that was it.
> >
> > My guess is that the low voltage scsi-controller cannot handle the
> size of the HD - could that be?? Anyone have an idea how I could get
> the disk to work?? I would really love to use it, since I wanted
> > to use the K-Class 200 as a file server.
> >
> > Yours,
> >
> > Jay
> >
> >
> >
> >
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> >
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
