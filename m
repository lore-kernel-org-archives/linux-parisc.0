Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from intro.peace.co.nz (intro.peace.co.nz [202.14.141.227])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4B2D7482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 30 Apr 2002 19:22:41 -0600 (MDT)
From: "James Braid" <james.braid@peace.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] mkraid doesnt work on L2000 with 64-bit kernel 
Date: Wed, 1 May 2002 13:25:17 +1200
Message-ID: <014c01c1f0af$0d0db630$5e01000a@bongo>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20020501004239.75E8B482B@dsl2.external.hp.com>
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

 
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Woohoo! Just rebooted the L2000 and RAID is now working on it :)

How do I go about submitting a patch (sorry, I am a complete newbie
to kernel stuff). 

Basically all I have done is copy the RAID section from the sparc64
ioctl32.c into the parisc ioctl32.c file, and fix up the md.h
include.

Just some output:

hypo:/raid# cat /proc/mdstat
Personalities : [linear] [raid0] [raid1] [raid5]
read_ahead 1024 sectors
md0 : active raid0 sdd1[2] sdc1[1] sdb1[0]
      2930640 blocks 16k chunks

unused devices: <none>

hypo:/raid# df -k
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/sda4             15458288    848292  13824744   6% /
/dev/sda2                60485     13835     43527  25% /boot
/dev/md0               2884592     32836   2705224   2% /raid

Cheers, James

-----BEGIN PGP SIGNATURE-----
Version: PGP 7.1.1

iQA/AwUBPM9D/FW+bhIOiSqWEQKeaQCeN5cXOfXz4Z0Pi1Jed9k0lGpldfAAn1G3
RrlNIJ0T8Gr/X11uUkblt/7h
=xtyl
-----END PGP SIGNATURE-----
