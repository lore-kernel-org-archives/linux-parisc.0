Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from c003.snv.cp.net (h016.c003.snv.cp.net [209.228.32.230])
	by dsl2.external.hp.com (Postfix) with SMTP id A35D9482B
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Oct 2002 14:33:09 -0600 (MDT)
Date: Wed, 9 Oct 2002 16:33:14 -0400
Subject: Re: [parisc-linux] Burning CD Images difficulties: revisited
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v546)
Cc: <parisc-linux@lists.parisc-linux.org>
To: "Jeffo" <jeffo@pop.hsbc.com.br>
From: Chuck Slivkoff <caslivkoff@telocity.com>
In-Reply-To: <00b601c26fb0$a4ce35a0$db0b0aa7@pcaktel083>
Message-Id: <55E2C72A-DBC6-11D6-82A6-000393581E44@telocity.com>
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

On Wednesday, Oct 9, 2002, at 12:26 US/Eastern, Jeffo wrote:

> - I=B4ve tried MANY times  (5) burning an PA-RISC image to a bootable =
CD.
> Couldn=B4t make my system
> boot from the CD though...the image I=B4m talking about is this one:
> http://pateam.esiee.fr/cd-images/palinux-0.9.3.iso
>
> I have a 712/60 HP station, with an external SCSI CD-rom drive. The=20
> drive is
> at ID "scsi.3.0".
> I do the boot search after the POST routine, it finds my SCSI drive,=20=

> its
> brand and everything else.
>
> When I try to boot from the CD the station simply does nothing. It=20
> tryes to
> boot and returns
> to the BOOT_ADMIN screen. ONCE I could get a message like "loading the
> stuff, etc....OPS, KERNEL something".
> And only ONCE...in one of the first CDs.

Assuming that the ISO md5sum matches, I would suggest that you try=20
another CD drive. Also, if you have DIP switches/jumpers on the drive,=20=

make sure that the sector size is set to 512 and not 2048.

Have you burned other disks and successfully read them in this drive?=20
Under HP-UX? Perhaps try CDR/RW media with different dyes (ie, blue,=20
black, green, etc)?
