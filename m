Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (mail.tiscali.be [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2A8964829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Oct 2002 10:56:21 -0600 (MDT)
Date: Wed, 9 Oct 2002 18:48:52 +0200
Message-ID: <3DA3C54C000001C0@ocpmta5.be.tiscali.com>
In-Reply-To: <00b601c26fb0$a4ce35a0$db0b0aa7@pcaktel083>
From: jsoe0708@tiscali.be
Subject: RE: [parisc-linux] Burning CD Images difficulties: revisited
To: "Jeffo" <jeffo@pop.hsbc.com.br>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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

Hello Jeffo,

>-- Original Message --
>From: "Jeffo" <jeffo@pop.hsbc.com.br>
>To: <parisc-linux@lists.parisc-linux.org>
>Subject: [parisc-linux] Burning CD Images difficulties: revisited
>Date: Wed, 9 Oct 2002 13:26:38 -0300
>
>
>Hello all!
>I hope this is the right place for posting such a question:
>
>- I?ve tried MANY times  (5) burning an PA-RISC image to a bootable CD.
>Couldn?t make my system
>boot from the CD though...the image I?m talking about is this one:
>http://pateam.esiee.fr/cd-images/palinux-0.9.3.iso
>

I also used this CD (a long long time ago) to install also a 712/60 and do
not met any problem (not mentionned in FAQ).
So the first think I would do before burning my CD is to check with md5sum
the imaged downloaded.
If it is Ok check the burned image (dd if=/dev/rdsk/c1t2d0 of=- | md5sum;
should work).


>I have a 712/60 HP station, with an external SCSI CD-rom drive. The drive
>is
>at ID "scsi.3.0".
>I do the boot search after the POST routine, it finds my SCSI drive, its
>brand and everything else.
>
>When I try to boot from the CD the station simply does nothing. It tryes
>to
>boot and returns
>to the BOOT_ADMIN screen. ONCE I could get a message like "loading the
>stuff, etc....OPS, KERNEL something".
>And only ONCE...in one of the first CDs.
>
It should be that the begining of the CD is Ok but corrupted else where?

Goog luck,
    Joel

PS: md5sum for hpux should be available near: <http://hpux.connect.org.uk/>
(or a repository)
