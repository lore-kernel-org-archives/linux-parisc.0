Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from brev.stud.ntnu.no (brev.stud.ntnu.no [129.241.56.70])
	by dsl2.external.hp.com (Postfix) with ESMTP id C2DE74834
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jun 2003 14:31:47 -0600 (MDT)
Received: from localhost (localhost [127.0.0.1])
	by brev.stud.ntnu.no (Postfix) with ESMTP id 4135813F08C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jun 2003 22:31:46 +0200 (CEST)
Received: from ozelot.stud.ntnu.no (ozelot.stud.ntnu.no [129.241.56.185])
	by brev.stud.ntnu.no (Postfix) with ESMTP id 6D4B013ED96
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jun 2003 22:31:45 +0200 (CEST)
Received: (from stain@localhost)
	by ozelot.stud.ntnu.no (8.11.6p2/8.10.0.Beta12) id h5BKVjm01414
	for parisc-linux@lists.parisc-linux.org; Wed, 11 Jun 2003 22:31:45 +0200
Date: Wed, 11 Jun 2003 22:31:45 +0200
From: Stian =?iso-8859-1?Q?S=F8iland?= <stian@soiland.no>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] palo II
Message-ID: <20030611203145.GB30555@itea.ntnu.no>
References: <3ED4C8B600004A2B@ocpmta1.freegates.net> <20030611175110.GE28581@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20030611175110.GE28581@parcelfarce.linux.theplanet.co.uk>
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

On 2003-06-11 19:51:10, Matthew Wilcox wrote:

> On Wed, Jun 11, 2003 at 07:46:54PM +0200, Joel Soete wrote:
> > Anoyed to change my fstab because I add or remove a disk to/from the ex=
ternal
> > scsi controler of my b2k (boot disk sda became sdb, sdc, or what else),
> > I decide so to test devfs kernel. It seems to works (excepted that I co=
uld
> > not specify root=3D/dev/scsi/host1/bus0/target5/lun0/part5)
> (a) devfs is shit.  do not use it.
> (b) even if it's compiled in, the kernel still matches `root=3D' against a
> built-in table that has nothing to do with devfs.
> (c) devfs is shit.  do not use it.

This thread is going way off-topic for the parisc-list.. but.. I feel
the need to disagree anyway! =3D)

Your argumentation is flawed.

Joel gave a perfect example of when devfs would come of perfect use,
variation of scsi devices fucks up "sdb", "sdc" and so on.=20

I earlier mentioned another fine use of devfs, to avoid the trouble of
constantly changing major number for /dev/ttB0 =3D)

Matthew, I wonder if it would not be possible to have a ext3-label
'root' on the partition and say root=3DLABEL=3Droot (even though that would
look rather weird =3D) )

    tune2fs -L root /dev/bla/blah

LABEL=3Dblapp can be used in fstab aswell.

Sad things I've discovered:

  * reiserfs does not support those labels
 =20
  * you cannot have two devices with the same labels
    (I tried to have multiple BOOT-partitions, with hopes that
    witchever was available could be used, however, that won't
    work when both devices are present, of course =3D) )
 =20
  * Labels DON'T work with software raid, because the kernel will
    recognize the labels even on the seperate units of the raid,=20
    and start complaining about multible labels.
 =20
    However, you might specify raids using their UUIDs in=20
    /etc/mdadm/mdadm.conf:
 =20
    # root
    ARRAY /dev/md/0 UUID=3D9ec52c6f:af4958dd:4c8ff16e:95abab7c spare-group=
=3Dekstra
    # usr
    ARRAY /dev/md/1 UUID=3Dbd627bf7:8fcae3d0:4f3f4fe7:7b3786df spare-group=
=3Dekstra
    # home
    ARRAY /dev/md/2 UUID=3D47e9c924:5bbda641:b506006e:599c80e5 spare-group=
=3Dekstra
 =20
    ... but.. I've had trouble with usr and home switching place (md1 and
    md2) from now and then anyway, so maybe this is just a teoretical
    feature =3D)
 =20
    Obligatory quote from bash.org:

      #85899 +(53)- [X]
      * unchellmatt does the RAID lovers cheer... "ARRAY! ARRAY!"

I don't think you will be able to use devfs in root=3D as /dev can't be
mounted before / (unless you use initrd, that is, but I haven't figured
out how to do that with palo)

--=20
Stian S=F8iland               Work toward win-win situation. Win-lose
Trondheim, Norway           is where you win and the other lose.
http://www.soiland.no/      Lose-lose and lose-win are left as an
                            exercise to the reader.  [Limoncelli/Hogan]
