Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep12-int.chello.at (viefep12-int.chello.at [213.46.255.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id DE8AC482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  4 Jun 2002 17:08:14 -0600 (MDT)
Message-ID: <3CFD487C.5F74FDA6@gmx.at>
Date: Wed, 05 Jun 2002 01:08:44 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Steve Pacenka <spacenka@lightlink.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] howdy and 720/50 framebuffer question
References: <1023226391.1465.226.camel@romano-nyswri>
Content-Type: text/plain; charset=us-ascii
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

An interesting question at this point. I also have a 720, but I never
tested the graphics display up to now (I only use it via serial line).

My 720 has a single board graphics card with three BNC connectors
on it. Is this really a 24bit graphics or a 8bit graphics. The only
thing I know, is that the resolution was used with 1280x1024 under
HP-UX 9.05 (or similar...).

One day I will carry up my 21" monitor and try the grpahics on this 
machine !

Christoph


Steve Pacenka wrote:
> 
> Greetings,
> 
> I have a couple of 720's and a couple of 735's to rehabilitate.  The
> PARISC-Linux developers have done truly excellent work on the kernel and
> Debian adaptations for this architecture.  If this can yield reasonable
> GNU/Linux installs including X, the machines will go on display in our
> recycling showroom as examples of reuse of discarded cool hardware.
> Maybe someone will then adopt them to give them new homes.
> 
> I'm stymied about X on a 720/50.  Starting from an 0.9.3 ISO which
> worked fine for a base install, the default video seems to be a one bit
> B&W buffer (text overlay plane?).  fbset -i says there's no device at
> /dev/fb0, which does exist in the filesystem; XFree86 subsequently
> doesn't load the framebuffer driver.  There's no Penguin at boot.  I've
> tried later precompiled kernels through -pa33, compiling my own from
> CVS, and appending video=stifb at a boot prompt with and without sti=0.
> 
> The hardware is there:
> 
> "1. Coral SGC Graphics (10) at 0xf8000000 [1], versions 0x4, 0x0, 0x77"
> 
> This is some kind of 24 plane framebuffer, right?  I'd be satisfied with
> 8 bit color from it.
> 
> Any hints for additional instrumentation or settings?
> 
> -- thanks, SP
>    Babbage's Basement volunteer and workstation curator
>        http://www.lightlink.com/babbages/workstations.html
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
