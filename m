Return-Path: <simmel@anymotion.de>
Received: from mail.3d-boerse.de (port-212-202-156-103.reverse.qsc.de
	[212.202.156.103])
	by dsl2.external.hp.com (Postfix) with ESMTP id E3489488A
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  6 Feb 2004 11:28:28 -0700 (MST)
Message-ID: <00ed01c3ecdf$5a9fa560$8100a8c0@punk>
From: "Jens Simmoleit" <simmel@anymotion.de>
To: <parisc-linux@lists.parisc-linux.org>
References: <40218AE200001791@ocpmta2.freegates.net>
Date: Fri, 6 Feb 2004 19:30:53 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Made it - Install GNOME on 712/80
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi list,

I made it, there was the package gnome-session missing (lokks like I missed
that one, oops!)
Also I made a dpkg-reconfigure setlocale to C (was with POSIX??)
then I got into the profile and added export for locale and after that I
changed the .xinitrc to gnome-session
taaaadaaaaaa, works :-) at least I can login, superb....
BTW, sawfish gnome looks nice, is there another gnome you can recommend?
Also I'd be interested if it'S possible to better the performance of my gfx
system, anybody out there with a few tricks?

I'm so happy right now.......


Greets,
Simmel


----- Original Message ----- 
From: "Joel Soete" <soete.joel@tiscali.be>
To: "Jens Simmoleit" <simmel@anymotion.de>;
<parisc-linux@lists.parisc-linux.org>
Sent: Friday, February 06, 2004 5:12 PM
Subject: RE: [parisc-linux] Additions - Install GNOME on 712/80


> Hi Jens,
>
> >1. My mouse won't work too *argh*
>
> 2. that is why you couldn't login with your user (i presume not root) :)
>
> X absolutely need a mouse pointer :(
>
> iirc you should have this entry in your XF86config-4 file:
> Section "InputDevice"
>         Identifier      "Configured Mouse"
>         Driver          "mouse"
>         Option          "CorePointer"
>         Option          "Device"                "/dev/psaux"
>         Option          "Protocol"              "PS/2"
> EndSection
>
> Check that /dev/psaux was well created, should look like:
> # ll /dev/psaux
> crw-------    1 root     root      10,   1 Mar 15  2002 /dev/psaux
>
> (if you build your own kernel check that its support is in the kernel)
>
>
>  and that gpm is not running (would not disable X to start but well
trouble
> the behaviour of cursor).
>
> Hth,
>     Joel
>
> PS: can you also mentioned which kernel are you using
>
> -------------------------------------------------------------------------
> Tiscali ADSL: 12 mois à 29,50 ?/mois! L'Internet rapide, c'est pour tout
> le monde.
> http://reg.tiscali.be/default.asp?lg=fr
>
>
>
