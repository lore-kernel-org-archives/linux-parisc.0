Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflash.com (unknown [207.19.136.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3A11F486B
	for <parisc-linux@parisc-linux.org>; Sun,  3 Jun 2001 21:42:44 -0600 (MDT)
Received: from wolf01.morethan.org (ppp36.cc1.pflash.com [63.121.24.38]) by vopserver.pflash.com
 (Vircom SMTPRS 4.7.191) with SMTP id <B0005275740@vopserver.pflash.com> for <parisc-linux@parisc-linux.org>;
 Sun, 3 Jun 2001 22:37:07 -0500
From: Michael S.Zick <mszick@pflash.com>
To: parisc-linux@parisc-linux.org
Date: Sun, 3 Jun 2001 22:38:14 -0500
Content-Type: text/plain
References: <20010601030203.EE8B937EF8@carmen.fc.hp.com>
MIME-Version: 1.0
Message-Id: <01060322312700.08633@wolf01.morethan.org>
Subject: [parisc-linux] Re: Version 0.9 of PA-RISC Linux Released
List-ID: <linux-parisc.vger.kernel.org>

Hi Folks -
Sub-Title this one: Adventures in running V0.9 on a HP9000/720 box:

1) I had been working with V0.6 and CVS snapshot of 05/25/2001 when this =
notice arrived.
Great - Gotta get that! -- 18 hours later, got it.  (very slow modem conn=
ection to a backwoods ISP).
2) Now make some working room - throw out (almost) all of that old stuff.
3) Mount new ISO image - What, no new ISO image! *&^%$#$%=20

V0.9 ISO - Test one: it deletes just fine.
Now repeat step 1).

xx hours later - it's here (I will not delete this copy, I know that work=
s).

Now, will it run "out of the box" - well, out of the things in the ISO an=
yway?

V0.9 ISO - Test two: Nope, not on a Model 720

Ok, so will it build "out of the box" and then run?

V0.9 ISO - Test three: Nope - the /devel directory is gone.

4) Turn loose ncFTP daemon clinet loose on cvs - get current snapshots,=20
being optimistic - get the new (hppa) native stuff also.

5) Meanwhile - what things of possible use can I say, well there are some=
 similarities
between the "boxed" 32STI vmlinux and what I have found to date:

File: linux/arch/parisc/kernel/setup.c
Function: void __init setup_console....
Approx. lines 332-335
=09printk ->
=09arg[0] -> free_memory start
=09arg[1] -> passed command line (from palo/ipl/ipl.c - Funciton: static =
void join
=09arg[2] -> initrd start
=09arg[3] -> initrd end
The values shown for arg[0] and arg[1] are the same - does this indicate =
a problem?
The passed command line (after copy from arg[1]) prints correctly.

File: linux/drivers/char/console.c
Function: void __init con_init
Approx. lines 2455-2457
=09call to register_console appears to never return -=20
The 9000/720 (at least mine) has a SGC display reported by the inventory =
list.
Changing the passed command line (with IPL editor) to: console=3DttyB
(which specifies the PDC console functions) seems to by-pass the above co=
de
and things proceed until this kernel gets into the same troubles that I w=
as working on:

I had been trouble shooting a number of different things in the LASI-SEM7=
00 scsi
driver for the 53c7xx (yes, the 9000/720 has the oldest controller availa=
ble).

The driver was reporting "unable to obtain consistant DMA memory" - among=
 other
strange and mysterious things.
Only recently did I notice that the ethernet driver is reporting the same=
 thing -

The printer port driver is reporting (interrupt driven mode) - is the pri=
nter port on
the 720 DMA capable?

So my next step will be to quit looking only at the SCSI driver and start=
 looking=20
for something common to the same problem reports from two different drive=
rs.

Note: All work is being done XC(x86) - the 720 disk was wiped clean befor=
e I got the
machine.  So I have to get it running before I can trouble shoot why it i=
sn't running=20
with the native mode toolset.

Yes - I am using the most recent XC-... things available from your site.

Any suggestions?
HELP !?!

PS: Is any work being done at the work station end?  Such as an 80960 X-c=
lient?  This
system came with two workstations - a HP 700/RX (model C2708A) and a HP
Envizex, aSeries (model C2731A).

PPS: A note on used equipment - I know this system was working (under HP-=
UX)
until it was shut down, the day before I bought it from a second-hand sto=
re.

Mike


On Thu, 31 May 2001, Matt Taggart wrote:
> Version 0.9 of PA-RISC Linux Released
>=20
> On May 31, 2001 the PA-RISC Linux development community released versio=
n
> 0.9, the latest version of Linux for computers using Hewlett Packard's
> PA-RISC processor. This release is the result of several years of work =
by
> developers in the Free Software community including developers from The
> Debian Project, Hewlett Packard, and Linuxcare.
>=20
> - Latest Debian Installer=20
> - Support for 32 and 64 bit systems=20
> - Over 4000 Debian packages=20
> - Full development environment=20
> - Support for large memory (up to 16GB)
> - Ability to use Debian's apt tool to update to the latest
>     package versions
>=20
> The 0.9 release install CDROM images and related documentation can be f=
ound at
>=20
> http://parisc-linux.org/release-0.9/
>=20
> Information about PA-RISC Linux is available at
>=20
> http://parisc-linux.org/
>=20
> Any questions or comments about the release should be directed to the
> mailing list at
>=20
> parisc-linux@parisc-linux.org
>=20
> --=20
> Matt Taggart        Linux Development Lab
> taggart@fc.hp.com   HP Linux Systems Operation
>=20
>=20
>=20
>=20
>=20
> -- =20
> To UNSUBSCRIBE, email to debian-hppa-request@lists.debian.org
> with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debi=
an.org
