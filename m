Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.latnet.lv (mail.latnet.lv [159.148.108.208])
	by dsl2.external.hp.com (Postfix) with SMTP id AD262482B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Jul 2003 12:03:28 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1057687402.3f0b076a99c5d@clients.latnet.lv>
Date: Tue, 08 Jul 2003 21:03:22 +0300 (EEST)
From: Dub <dub@latnet.lv>
MIME-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Subject: [parisc-linux] Corrections for RAID1 howto and Resyncing after failure
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

Hi,

1. The document on 
http://www.parisc-linux.org/faq/raidboot-howto.html
is really great. However, there is one exception

Command from FAQ:
mdadm --create /dev/md0 --level 1 --raid-devices=2 missing /dev/sdb2

Command working with curreny woody release:
mdadm -C /dev/md0 --level raid1 --raid-disks 2 missing /dev/sde2

There is no --raid-devices option in my release!

2. 

I have mirrored boot, swap and root devices on pair of physical disks. I took
off one hot-plug disk and returned it back.
root device did not want to resync even after reboot.


md0 : active raid1 sde2[1] sda2[0]
      33728 blocks [2/2] [UU]
      
md1 : active raid1 sde3[1] sda3[0]
      525248 blocks [2/2] [UU]
      
md2 : active raid1 sda5[0]
      4218752 blocks [2/1] [U_]

I fixed it by command

mdadm /dev/md2 -a /dev/sde5

What's wrong???

Kernel was compiled with CONFIG_HOTPLUG=y


Many thanks in advance for your help!

BR,
Dub
