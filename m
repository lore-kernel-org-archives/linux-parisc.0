Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pimout3-ext.prodigy.net (pimout3-ext.prodigy.net [207.115.63.102])
	by dsl2.external.hp.com (Postfix) with ESMTP id EA1984829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  1 Feb 2003 14:35:17 -0700 (MST)
Reply-To: <adam.sk@groovy.ffloth.com>
From: "Adam Skaffloth" <adam.sk@groovy.ffloth.com>
To: "'Thibaut VARENE'" <varenet@esiee.fr>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Tried to Install Debian 3r1 on C110, C180 and 2 712/60, no luck.
Date: Sat, 1 Feb 2003 13:34:24 -0800
Message-ID: <003701c2ca39$b11141c0$b601a8c0@pepp>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20030201200720.1be3a2da.varenet@esiee.fr>
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

I downloaded the iso images from
ftp://gsyprf10.external.hp.com/debian-cd/3.0_r0/hppa/
I went back to check for the MD5 Checksums.
They did not compare, but then I saw that the MD5SUM file was referencing
i386 disks,
under the hppa directory :)

I then tried jigdo download, it could find the first segment that are under
above server,
but could after that not find any other, dead end.

Under ftp://ftp.parisc-linux.org/cd-images/testing/auto-isos/
are a lot of test netinstalls,
Is there any of them that are corresponfing to 3.0r0 ?
Should I download the .iso image or is the lifimage to prefer ?

Where do I find netinstall for woody ?

/ Adam

-----Original Message-----
From: Thibaut VARENE [mailto:varenet@esiee.fr]
Sent: Saturday, February 01, 2003 11:07 AM
To: adam.sk@groovy.ffloth.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Tried to Install Debian 3r1 on C110, C180
and 2 712/60, no luck.


On Sat, 1 Feb 2003 10:26:57 -0800
"Adam Skaffloth" <adam.sk@groovy.ffloth.com> wrote:

> Did you install it from the woody iso ?
> My install are from the iso image.
> Or did you use netinstall ?
netinsts and 3.0r0
haven't tried yet 3.0r1
>
> The C180 has 768MB Ram, the C110 has 512MB.
> The 712s has 64MB and 80MB.
far enough.
>
> I need to know if this is a installer problem in woody iso.
most unlikely.
I'd suspect a problem with you CD. Have you checked checksums and tried with
another CD?
>
> I am also confused that there are reference to some problems with
different
> PS/2
> keyboards. I used original HP Workstation Keyboard and mouse and still got
> the problem with
> the C110 and C180.
any ps/2 keyboard/mouse *should* work.


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
