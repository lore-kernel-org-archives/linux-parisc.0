Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hsbcsv16.hsbc.com.br (hsbcsv16.hsbc.com.br [200.208.29.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id 77E6D4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Oct 2002 10:27:09 -0600 (MDT)
Received: from pop.hsbc.com.br (unverified) by hsbcsv16.hsbc.com.br
 (Content Technologies SMTPRS 4.2.10) with ESMTP id <T5dd5bf0adfac1c5052358@hsbcsv16.hsbc.com.br> for <parisc-linux@lists.parisc-linux.org>;
 Wed, 9 Oct 2002 13:27:05 -0300
Received: from pcaktel083 ([167.10.11.219])
	by pop.hsbc.com.br (8.11.6/8.11.6) with SMTP id g99GR0H25002
	for <parisc-linux@lists.parisc-linux.org>; Wed, 9 Oct 2002 13:27:00 -0300
Message-ID: <00b601c26fb0$a4ce35a0$db0b0aa7@pcaktel083>
From: "Jeffo" <jeffo@pop.hsbc.com.br>
To: <parisc-linux@lists.parisc-linux.org>
Date: Wed, 9 Oct 2002 13:26:38 -0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Burning CD Images difficulties: revisited
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

Hello all!
I hope this is the right place for posting such a question:

- I´ve tried MANY times  (5) burning an PA-RISC image to a bootable CD.
Couldn´t make my system
boot from the CD though...the image I´m talking about is this one:
http://pateam.esiee.fr/cd-images/palinux-0.9.3.iso

I have a 712/60 HP station, with an external SCSI CD-rom drive. The drive is
at ID "scsi.3.0".
I do the boot search after the POST routine, it finds my SCSI drive, its
brand and everything else.

When I try to boot from the CD the station simply does nothing. It tryes to
boot and returns
to the BOOT_ADMIN screen. ONCE I could get a message like "loading the
stuff, etc....OPS, KERNEL something".
And only ONCE...in one of the first CDs.

I did an extensive search on the Internet regarding this subject, and used
all hints found for
the burning software (yes, I´m burning on XP, unfortunately all linuxes I´ve
found doens´t
have CD writers)...used Nero 5.5, CDRWin 4.0B and Blindwrite. None of them
seem to burn this image
correctly. And I say that with the knowledge after burning many, many
applications, games, etc
onto CD-R. Protected or not. For AIX, for Windows, for Solaris.
Weird...

The simptoms are:

- If I load the CD on a windows machine, everything seems to be fine,
DESPITE all filenames
being in CAPS... (bad sign?)
- On the 712/60 it won´t boot.
- After booting into HP-UX, if I try to mount the CD it takes a looong time
and then the OS finally mounts it, but all filenames are capitalised AND
SOMETIMES, the ";1" suffix is appended to every filename. I´ve seen
something about that on Nero, but on tabs that you simply cannot change.
(something like "doesn´t append ;1 on...")
- I contacted a friend and co-worker which is a "Linux" guy, but he wasn´t
willing to help much..
- Things that I´ve read on the net like "Search the iso or the CD for the
#8000 sector and see if the MAGIC word is on there (CD001) and IT IS in all
Cds I´ve searched.

I am REALLY interested in putting this thing to run up on my HP
station....but I´m having a hard time...

Maybe someone could give some help?

Thanks for now.
[ ]s,
Jeffo - Brazil.
