Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Juergen Braukmann <juergen.braukmann@ruhr-west.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Installing on C110 
In-Reply-To: Message from Juergen Braukmann <juergen.braukmann@ruhr-west.de>
   of "Thu, 04 Jul 2002 18:41:16 +0200." <3D247AAC.EF70A4CA@ruhr-west.de>
References: <3D247AAC.EF70A4CA@ruhr-west.de> 
Date: Thu, 04 Jul 2002 12:07:59 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020704180759.C5FF44843@dsl2.external.hp.com>
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

Juergen Braukmann wrote:
> I an stuck with three problems, for one my german keyboard doesn't work
> as expected (the <>| key in particvular). I should get round that with
> kbdconfig as suggested in another mail, but I diddn't fint that program
> installed. ;-( Since this is my first ever debian install, it's more a
> problem of finding and reading the docs to the packet manager and some
> more general info about debian systems.

"apt-get" is your friend.
Once upon a time, "apt-cache search <pgm>" would tell me which package
contained the program. But I've forgotten the explanation of why
that stopped working.

> More annoying is the system clock, that always puts me back to 1970. Set
> the date, wrote it back to CMOS, checked it, rebooted and was back into
> the seventies. The device /dev/rtc exists with the suggested major/minor
> numbers from the FAQ. At this time, I enter date time after bootup like
> with my first PC. ;-)

Could the battery be dead?
You might take that out and measure it with a volt meter.

> I cannot get X to run. "No screens found". I tried the good old
> xf86config setup, but don't realy know what to enter for a video card
> (thinking that's the problem). Help on that is also appreciated. Is
> there any tool to identify hardware in general?

www.parisc-linux.org has lots of FAQ info and HOW-TOs.
Look at the boot console output to determine which type
of graphics card you have and start hunting from there.

grant
