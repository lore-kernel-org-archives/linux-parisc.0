Return-Path: <hppa-linux@puffingroup.com>
Message-Id: <199902161847.TAA01112@e35.msede.com>
Subject: Re: [hppa-linux] Booting issues.
To: hppa-linux@puffingroup.com
Date: Tue, 16 Feb 99 19:47:03 MEZ
Cc: jason@gatekeeper.equator.com
In-Reply-To: <199902161812.KAA22762@hairball.cup.hp.com>; from "Richard "J." Rauenzahn" at Feb 16, 99 10:12 am
From: Michael Marxmeier <mike@msede.com>
Resent-Message-ID: <"2rvpG2.0._m4.MsRos"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

> Software convention.  Pre 10.x, people used whole disks, after 10.x we
> have Logical Volume Manager which lets you put a set of disks into a
> Volume Group and create Logical Volumes using the space within that
> Volume Group.  You then newfs the Logical Volumes..
> 
> /dev/vg01/lvol1
> /dev/vg01/rlvol1

For older systems (read pre-LVM) fixed partitions (calls "sections")
were used which were defined in /etc/disktab and hard-coded
in the driver. With the LVM this has changed.

AFAIR only a small boot area (/stand) or for other configurations
the root file system is required to be in hfs format and must be
contiguous. There should be a pointer towards it somewhere in the
LVM data structures. All other file systems can be VxFS.

> A logical volume might span one disk, or multiple disks, or stripe
> across all the disks..  and you can extend the filesystems later, and
> they don't have to be contiguous.  Pretty handy -- I've wished Linux had
> it as I hate PC partition schemes that aren't resizable..

It has. http://linux.msede.com/lvm (alpha code)

> I'm not sure how the root directory logical volume is handled -- I
> believe it has to be the first volume on the root volume group, and has
> to be contiguous.

Yes.


Michael

--
Michael Marxmeier           Marxmeier Software GmbH
E-Mail: mike@msede.com      Besenbruckstrasse 9
Voice : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
