Return-Path: <asifayaz@hp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: RE: [parisc-linux] UNable to boot the cd.
Date: Tue, 3 Feb 2004 20:13:21 +0530
Message-ID: <8BF7471D09AA9B4190A9C96778BC2A1748D234@qcaexc02.asiapacific.cpqcorp.net>
From: "AYAZ, MOHAMMED ASIF" <asifayaz@hp.com>
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Grant,=20
Thanks For your Mail,=20
To start with.=20
o I Had downloaded the iso image from  =
ftp.de.debian.org/debian-cd/3.0_r0/hppa

o Used a Winxp to write a CD!!=20

o I did Search ipl from teh main menu itdid'nt  show the cdrom as an ipl =
device.=20
o I tried booting hte CD rom as well but to no luck..=20
o IT's on a A500 (9000/800/A500-44)=20

I wonder wat's wrong with my cd !!=20


Thanks & Regards=20
Asif=20





-----Original Message-----
From: Grant Grundler [mailto:grundler@parisc-linux.org]
Sent: Sunday, February 01, 2004 10:22 AM
To: AYAZ, MOHAMMED ASIF
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] UNable to boot the cd.


On Sun, Feb 01, 2004 at 04:46:01AM +0530, AYAZ, MOHAMMED ASIF wrote:
> Hello .=20
> I have downloaded  the  iso images from
> ftp.de.debian.org/debian-cd/3.0_r0/hppa
> and made a bootable cd of the image..

Can you elaborate (give precise steps) on how you accomplished this?
The ISO images are "raw" files. ie burn them bit-for-bit to the CD.
On a linux box, use
	cdrecord -v dev=3D0,0,0 -data debian-30r0-hppa-binary-1.iso

where "0,0,0" matches the output from "cdrecord -scanbus".


> All I  did  is to search for ipl from the PDC main menu. but it
> doesnt show the cdrom as an ipl device.=20

It will show up. If you absolutely can't get this work,
start thinking about doing a bootp/net install.

> I'm testing this on a A class server !!=20

Which one? A180 or A500?
It doesn't really matter since palo is "smart" and will pick
the right kernel (32 vs 64 bit). I'm just curious.

grant
