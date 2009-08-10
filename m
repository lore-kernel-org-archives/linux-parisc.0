From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: HPPA hang with PCI SERR or PARITY enabling
Date: Mon, 10 Aug 2009 17:20:36 -0600
Message-ID: <20090810232036.GA20454@lackof.org>
References: <20090805174507.GB11458@lackof.org> <Pine.SOC.4.64.0908052241550.4076@math.ut.ee> <20090806141542.bf48febf.berndg@fsim-ev.de> <20090807162242.GA18373@lackof.org> <20090808113100.37e0f4ab.berndg@fsim-ev.de> <20090809052714.GA22362@lackof.org> <4A7F7652.6050209@tausq.org> <7d01f9f00908100101w3d73e91fmce80eb79e85bdc61@mail.gmail.com> <7d01f9f00908100109y6265c3efs31a6a2c46679ae90@mail.gmail.com> <20090810130827.98dfd895.berndg@fsim-ev.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Thibaut VARENE <T-Bone@parisc-linux.org>,
	Randolph Chung <randolph@tausq.org>,
	Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Bernd Gietzelt <berndg@fsim-ev.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090810130827.98dfd895.berndg@fsim-ev.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Aug 10, 2009 at 01:08:27PM +0200, Bernd Gietzelt wrote:
> On Mon, 10 Aug 2009 10:09:36 +0200
> Thibaut VARENE <T-Bone@parisc-linux.org> wrote:
> 
> > Bummer, I've been reading the logs a bit too quickly. It seems we have
> > two different problems here:
> > 
> > 2.6.30-1-64smp doesn't boot (apparently doesn't load init, hangs after
> > the badness in smp.c message)
> > 2.6.30-1-64up crashes while loading PCI drivers
> > 
> > A log of the up kernel with pdcchassis=0 would thus be helpful.
> 
> http://pastebin.com/m2a494b9b
> 
> I couldn't see any difference to the log without pdcchassis=0.

Yeah, wierd....I must be misremembering then.

In any case, the HPMC occurs on the first none-zero numbered Sym2 device:
sym53c8xx 0000:00:01.0: enabling device (0000 -> 0003)  is OK
sym53c8xx 0000:00:01.1: enabling device (0146 -> 0147)  is OK
sym53c8xx 0000:00:02.0: enabling device (0000 -> 0003)  is OK
sym53c8xx 0000:00:02.1: enabling device (0000 -> 0003)  is OK
sym53c8xx 0000:30:00.0: enabling device (0000 -> 0003)  seems to be OK
sym53c8xx 0000:38:00.0: enabling device (0000 -> 0003) HPMCs?

The second cards seems to be the culprit though there are
two add-on cards in the machine (I was expecting both to
fail in similar ways).

I saw you included the PIM dump with a later console capture
but I won't have time this week to look at it. :(
This PIM dump should confirm if we had problems accessing MMIO
space and which device (should) owns that space.

thanks,
grant

> 
> 
> 
> -- 
> Bernd Gietzelt <berndg@fsim-ev.de>
