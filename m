Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm1.tiscalinet.be (spoolm1.tiscalinet.be [212.35.2.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0A107482E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 25 May 2002 13:33:05 -0600 (MDT)
Message-ID: <3CEFE702.7060503@freebel.net>
Date: Sat, 25 May 2002 19:33:22 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: Peter Mottram <peter@petescaff.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] raid-1 on boot disk
References: <Pine.LNX.4.44.0205241504430.19280-100000@r6.petescaff.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Peter,


Peter Mottram wrote:
> Joel
> 
> I did some playing with this some time ago. To have all filesystems under
> md control then palo must understand two things:
> 
> 1. how to read the md filesystem to get the kernel (can use the F0
> partition for kernel to get round this)

I undurstand F0 is a special slice that PDC has to access to load ipl

> 
> 2. how to use md / filesystem
> 

Is a ramdisk (located in the special slice /boot) would not help?
I thought to this because of my read on the use of lvm and evms 
structure system disk. Both write a script to build such ramdisk.

> AFAIK these 2 things just don't work right now & Paul Bame has other more
> important things to do with palo right now.
> 
> The approach I take is to have a small / and small /boot as normal ext2
> partitions & automatically copy these over to spare / & /boot filesystems
> on mirror + hot spare disk each night.

Well ramdisk will avoid to have to do this 'manual' mirror on F0 and 
/boot but there are quasi-static and so easy to mirror with dd. On the 
contrary / is more dynamic so I do not see how do you realise the mirror 
  of this fs?

> All other filesystems (including
> swap) are on md. If I update the primary boot disk's F0 then I also
> update the F0 slice on mirror & spare disks. If the primary boot disk
> fails then the system will go down but then can boot off the mirror. Make
> sure you set up PRI and ALT boot paths correctly if you want this to
> happen automagically & make usre the script which copies / onto the
> mirror/spare modifies /etc/fstab appropriately!
> 
> R.
> PeteM

I am now much more confident, I will try to have a look in more details.

Many thanks for all information,
	Joel
