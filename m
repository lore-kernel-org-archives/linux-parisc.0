Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from jaguar.mkp.net (jaguar.mkp.net [66.11.169.42])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3982482B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Jul 2003 14:11:46 -0600 (MDT)
To: Dub <dub@latnet.lv>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Corrections for RAID1 howto and Resyncing after failure
From: "Martin K. Petersen" <mkp@mkp.net>
References: <1057687402.3f0b076a99c5d@clients.latnet.lv>
Date: 08 Jul 2003 16:11:28 -0400
In-Reply-To: <1057687402.3f0b076a99c5d@clients.latnet.lv>
Message-ID: <yq1llv8dbin.fsf@wilson.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

>>>>> "Dub" == Dub  <dub@latnet.lv> writes:

Dub> Command from FAQ: mdadm --create /dev/md0 --level 1
Dub> --raid-devices=2 missing /dev/sdb2

Dub> Command working with curreny woody release: mdadm -C /dev/md0
Dub> --level raid1 --raid-disks 2 missing /dev/sde2

Dub> There is no --raid-devices option in my release!

Odd.  I'm running mdadm 1.2.0 and it says:

        allegro:~# mdadm --create --help 2>&1 | grep raid-dev
        Usage:  mdadm --create device -chunk=X --level=Y --raid-devices=Z devices
          --raid-devices= -n : number of active devices in array

Maybe Neil changed it in a later version?


Dub> I have mirrored boot, swap and root devices on pair of physical
Dub> disks. I took off one hot-plug disk and returned it back.  root
Dub> device did not want to resync even after reboot.

Well.  If the disk is no longer part of the metadevice, you manually
have to add it using the mdadm command.

It would be quite dangerous if the RAID code decided to add things to
an array just because a disk is inserted (fine for a storage
appliance, bad idea for a server).

CONFIG_HOTPLUG has nothing to do with it.

-- 
Martin K. Petersen      http://mkp.net/
