Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from boden.synopsys.com (unknown [204.176.20.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id A7E164831
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Jul 2002 07:16:46 -0600 (MDT)
From: "Michael Audette" <Mike.Audette@synopsys.com>
To: "Juergen Braukmann" <juergen.braukmann@ruhr-west.de>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Installing on C110
Date: Mon, 8 Jul 2002 09:16:00 -0400
Message-ID: <HMEKIKEAKEFFMJJOEAJNOEDHFJAA.maudette@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <3D254C22.7645EDE3@ruhr-west.de>
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

I have the same problem with the RTC on my C110.  I replaced the
battery...and the real-time clock does work.  Even after a reboot.  But upon
a kernel panic the RTC gets nuked.  I can panic the 0.93 kernel by 'cat
/etc/passwd > /dev/audio' without the harmony driver installed (I have not
gotten around to recompiling my kernel as of yet).  Try setting it upon boot
then rebooting.  If this works then your RTC is more than likely ok.

				-Mike


-----Original Message-----
From: parisc-linux-admin@lists.parisc-linux.org
[mailto:parisc-linux-admin@lists.parisc-linux.org]On Behalf Of Juergen
Braukmann
Sent: Friday, July 05, 2002 3:35 AM
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Installing on C110


Grant Grundler schrieb:
>
Hi Grant

> Juergen Braukmann wrote:
> > I an stuck with three problems, for one my german keyboard doesn't work
> > as expected (the <>| key in particvular). I should get round that with
> > kbdconfig as suggested in another mail, but I diddn't fint that program
> > installed. ;-( Since this is my first ever debian install, it's more a
> > problem of finding and reading the docs to the packet manager and some
> > more general info about debian systems.
>
> "apt-get" is your friend.
> Once upon a time, "apt-cache search <pgm>" would tell me which package
> contained the program. But I've forgotten the explanation of why
> that stopped working.
>

OK, I will look that one up.

> > More annoying is the system clock, that always puts me back to 1970. Set
> > the date, wrote it back to CMOS, checked it, rebooted and was back into
> > the seventies. The device /dev/rtc exists with the suggested major/minor
> > numbers from the FAQ. At this time, I enter date time after bootup like
> > with my first PC. ;-)
>
> Could the battery be dead?
> You might take that out and measure it with a volt meter.
>

I think the battery is OK. HP-UX worked well, but I hadn't used it for a
time and didn't check. I should rule out that possibility before start
to cry. ;-) (i.e. My network connection started to work perfect after I
plugged the other machine back to the coax cable... ;-))
But things looked like that I can set the CMOS time from the boot
program (active before realy booting something) and linux telling me
something about garbled time afterwards. My suspicion is that the stored
format differs from that hwclock -w tried to use.

> > I cannot get X to run. "No screens found". I tried the good old
> > xf86config setup, but don't realy know what to enter for a video card
> > (thinking that's the problem). Help on that is also appreciated. Is
> > there any tool to identify hardware in general?
>
> www.parisc-linux.org has lots of FAQ info and HOW-TOs.
> Look at the boot console output to determine which type
> of graphics card you have and start hunting from there.
>

well, hunting starts with  that pice of fragment:

CORAL SGC Graphics
1280x1024-32 framebuffer

and that is not listed amongst the cards. So I add some more questions
to that:
when I get system info at the boot program, I see that I'v got no EISA
devices. The graphics card looks propetary -from the connectors side of
view-. Are the slots EISA slots? In what case, I'd fetch an old ELSA
Winner 2000 EISA from work and try with that. At least, I know how to
configure these.

Anyway, this has to wait to the next week, since I am off over the
weekend. ;-)


Juergen

--
===========================================     __   _
Juergen Braukmann juergen.braukmann@gmx.de| -o)/ /  (_)__  __ ____  __
Tel: 0201-743648  dk4jb@db0qs.#nrw.deu.eu | /\\ /__/ / _ \/ // /\ \/ /
===========================================_\_v __/_/_//_/\_,_/ /_/\_\

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
