Return-Path: <hppa-linux@puffingroup.com>
From: Richard "J." Rauenzahn <rrauenza@cup.hp.com>
Message-Id: <199902161812.KAA22762@hairball.cup.hp.com>
Subject: Re: [hppa-linux] Booting issues.
To: hppa-linux@puffingroup.com
Date: Tue, 16 Feb 1999 10:12:02 -0800 (PST)
Cc: jason@gatekeeper.equator.com
In-Reply-To: <199902161632.IAA00701@gatekeeper.equator.com> from Jason Eckhardt at Feb "16," 1999 "08:32:41" am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Resent-Message-ID: <"-7DmU3.0.ej4.WLRos"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

>     2. How are disks "partitioned" on HPs. The bootloader, if it uses the
>        scheme of loading the kernel from a linux filesystem, will have to
>        also "understand" the partition of the disk.
>        Does anyone know how the partitions are setup (i.e. partition table,
>        or equivalent)? Is the partition scheme imposed by hardware or
>        is this just a software convention? 

Software convention.  Pre 10.x, people used whole disks, after 10.x we
have Logical Volume Manager which lets you put a set of disks into a
Volume Group and create Logical Volumes using the space within that
Volume Group.  You then newfs the Logical Volumes..

/dev/vg01/lvol1
/dev/vg01/rlvol1
...

A logical volume might span one disk, or multiple disks, or stripe
across all the disks..  and you can extend the filesystems later, and
they don't have to be contiguous.  Pretty handy -- I've wished Linux had
it as I hate PC partition schemes that aren't resizable..

I'm not sure how the root directory logical volume is handled -- I
believe it has to be the first volume on the root volume group, and has
to be contiguous.

Rich

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
