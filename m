Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pimout3-ext.prodigy.net (pimout3-ext.prodigy.net [207.115.63.102])
	by dsl2.external.hp.com (Postfix) with ESMTP id AF1F44829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  1 Feb 2003 11:27:53 -0700 (MST)
Reply-To: <adam.sk@groovy.ffloth.com>
From: "Adam Skaffloth" <adam.sk@groovy.ffloth.com>
To: "'Thibaut VARENE'" <varenet@esiee.fr>,
	"'Christian Suder'" <csuder@cisco.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Tried to Install Debian 3r1 on C110, C180 and 2 712/60, no luck.
Date: Sat, 1 Feb 2003 10:26:57 -0800
Message-ID: <003401c2ca1f$81ca9750$b601a8c0@pepp>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20030201103005.42be16f9.varenet@esiee.fr>
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

Did you install it from the woody iso ?
My install are from the iso image.
Or did you use netinstall ?

The C180 has 768MB Ram, the C110 has 512MB.
The 712s has 64MB and 80MB.

All above machines was running HP-UX 10.20 or 11.00 before I tried to
install,
or still is as nothing has been installed yet.
So I know they are working.

I need to know if this is a installer problem in woody iso.
I have seen that a lot of people have got these machines installed and
working,
but did they use a previous version or did they use netinstalls ?

I am also confused that there are reference to some problems with different
PS/2
keyboards. I used original HP Workstation Keyboard and mouse and still got
the problem with
the C110 and C180.

/ Adam

-----Original Message-----
From: parisc-linux-admin@lists.parisc-linux.org
[mailto:parisc-linux-admin@lists.parisc-linux.org]On Behalf Of Thibaut
VARENE
Sent: Saturday, February 01, 2003 1:30 AM
To: adam.sk@groovy.ffloth.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Tried to Install Debian 3r1 on C110, C180
and 2 712/60, no luck.


On Fri, 31 Jan 2003 20:27:21 -0800
"Adam Skaffloth" <adam.sk@groovy.ffloth.com> wrote:


> The Visualize-EG in C180 seems not be working, seen threads about that,
> so installed the Visualize-24 card from the C110 on the C180 and get the
> same result.
IIRC, Visualize-EG should be working with STIfb driver.

> I also read that their are no trouble with installing on 712/60.
> I got 2, one with the second LAN/Serial Card (So I can use it as a FW).
We have that conf as well, and installed it without any problem.
> Bot are starting but are hanging after the message:
>
> The Installation Program is determining the current state
> of your system and the next installation step that should
>  be performed.
>
> It hangs there forever on both boxes.
That's definitely not normal.
How much RAM does these boxes have ?
We noticed that bellow 32MB of RAM, the installer may 'Defunct' during the
install process. In that case you would have to install the HD into another
box, prepare it and install the software on it, and plug it back into the
712, see the PA-RISC/Linux Boot HOWTO for details
(http://pateam.esiee.fr/doc.html)

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
