Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.petescaff.com (petem.xs4all.nl [194.109.247.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id E7E2C482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 24 May 2002 07:11:08 -0600 (MDT)
Date: Fri, 24 May 2002 15:11:01 +0200 (CEST)
From: Peter Mottram <peter@petescaff.com>
To: "joel.soete@freebel.net" <joel.soete@freebel.net>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] raid-1 on boot disk
In-Reply-To: <1022244947.3cee385378f63@webmail.tiscalinet.be>
Message-ID: <Pine.LNX.4.44.0205241504430.19280-100000@r6.petescaff.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Joel

I did some playing with this some time ago. To have all filesystems under
md control then palo must understand two things:

1. how to read the md filesystem to get the kernel (can use the F0
partition for kernel to get round this)

2. how to use md / filesystem

AFAIK these 2 things just don't work right now & Paul Bame has other more
important things to do with palo right now.

The approach I take is to have a small / and small /boot as normal ext2
partitions & automatically copy these over to spare / & /boot filesystems
on mirror + hot spare disk each night. All other filesystems (including
swap) are on md. If I update the primary boot disk's F0 then I also
update the F0 slice on mirror & spare disks. If the primary boot disk
fails then the system will go down but then can boot off the mirror. Make
sure you set up PRI and ALT boot paths correctly if you want this to
happen automagically & make usre the script which copies / onto the
mirror/spare modifies /etc/fstab appropriately!

R.
PeteM

On Fri, 24 May 2002, joel.soete@freebel.net wrote:

> Hi all,
>
> I just find a spare disk for my b180 and would like to test md mirroring on my
> boot disk.
>
> I am just a bit affraided because Software-RAID-HOWTO mentioned that the
> persistent-superblock (requested for boot disk) is writen at the begining of disks.
>
> Is somebody has already test this config and raidtools2 ?
>
> Thanks in advance for info
>     Joel
>
>
> -------------------------------------------------
> This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
