Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from brev.stud.ntnu.no (brev.stud.ntnu.no [129.241.56.70])
	by dsl2.external.hp.com (Postfix) with ESMTP id E24A94829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 31 May 2003 15:40:31 -0600 (MDT)
Date: Sat, 31 May 2003 23:40:29 +0200
From: Stian =?iso-8859-1?Q?S=F8iland?= <stian@soiland.no>
To: "Siraj 'Sid' Rakhada" <sid@mindless.co.uk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Installation on a K370 with Debian 3.0r1 + RAID1 boot.
Message-ID: <20030531214029.GD9267@itea.ntnu.no>
References: <56739.194.131.108.2.1054389276.squirrel@ssl.mindless.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <56739.194.131.108.2.1054389276.squirrel@ssl.mindless.co.uk>
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

On 2003-05-31 15:54:36, Siraj 'Sid' Rakhada wrote:

> If you skip this step, Debian will boot, but you will be unable to use the
> console.
> Note I have not actually done the above when I was installing - I cheated
> and installed sshd via a chroot setup - because I did not realise the
> ttyB0 major number was incorrect on the install CD. I'm expecting that
> modifying the device as above should work. If I had more time I would have
> tried the above method.

For later boots, devfs and devfsd should be able to handle this if your
kernel supports it.

> This is also the first time I've ever really used a HP box, and they are
> ... interesting :) e.g. is it normal that the machine will take about 10+
> minutes to boot up? (just to get to the boot ROM, nothing to do with linux
> - self tests are enabled, though disabilng them does not make too much of
> a difference).

Oh yeah, my K250 takes ages just to get started, the LCD display and
status line on the serial console changes with different numbers. Any
idea of what all those numbers mean? I suppose they are different parts
that are tested, but a translation would be nice.=20

My manuals does not explain these messages in detail..

How ever, nice guide, I wish I had it when I set up my system =3D)


=2E.. goes off-topic:

I have 6 SCSI disks connected, distributed in two raid1-sets for / and
/usr, and a raid5-set for /home. Some of the disks are 4 GB, the rest 2
GB, so I've done dirty tricks with partitions to get the whole thing up,
and not waisting any space, and I now even have a spare disk, although
tests reveal the disk is broken.. I've managed to get two more 2
GB-disk to replace it.. =3D)

Ah, yes, the K250 is BIG, but there's only room for 4 disks! Stupid!
I've placed one disk beside the CD-rom, connected to the other
controller, and the last disk in an external cabinet =3D)

I've wondered if it would not be possible to modify the housing to get
room for more disks... Would it be immoral of me to destroy the beauty
of a K250 by cutting some holes here and there? =3D)


--=20
Stian S=F8iland               Work toward win-win situation. Win-lose
Trondheim, Norway           is where you win and the other lose.
http://www.soiland.no/      Lose-lose and lose-win are left as an
                            exercise to the reader.  [Limoncelli/Hogan]
K250 at http://beist.ntnu.nu/  =3D)                           =20
