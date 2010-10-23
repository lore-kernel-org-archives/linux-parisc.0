From: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Subject: Re: C8000 cpu upgrade problem
Date: Sat, 23 Oct 2010 18:40:42 +0200 (CEST)
Message-ID: <alpine.DEB.1.10.1010231802330.18664@artax.karlin.mff.cuni.cz>
References: <alpine.DEB.1.10.1010221555220.3134@artax.karlin.mff.cuni.cz> <AANLkTi=YJJgP-tDhh2g6D8d8BkKa-ENoJankd-ZMV+i2@mail.gmail.com> <alpine.DEB.1.10.1010231118350.23687@artax.karlin.mff.cuni.cz> <AANLkTikD5cvJdAxUg7zj0ySM9z6fThE-9H9txVpNC9Ez@mail.gmail.com>
 <AANLkTimhs8gyJOwh4eB9M8S3NHNO5KBm_DJZDc=3+=w6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: Matt Turner <mattst88@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTimhs8gyJOwh4eB9M8S3NHNO5KBm_DJZDc=3+=w6@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Sat, 23 Oct 2010, Matt Turner wrote:

> On Sat, Oct 23, 2010 at 7:22 AM, Carlos O'Donell
> <carlos@systemhalted.org> wrote:
> > On Sat, Oct 23, 2010 at 5:21 AM, Mikulas Patocka
> > <mikulas@artax.karlin.mff.cuni.cz> wrote:
> >> On Fri, 22 Oct 2010, Carlos O'Donell wrote:
> >>> AFAIK you can't add a second CPU without an HP technician enabling the
> >>> firmware for a second CPU.
> >>>
> >>> The same goes for enabling additional PCI slots.
> >>>
> >>> Cheers,
> >>> Carlos.
> >>
> >> And is there some hack that enables it?
> >>
> >> It looks quite dishonest to me when the machine is advertised as capable
> >> of two dual-core CPUs, 32GB RAM, 4 PCI-X slots ... and you get this
> >> advertised capability only if you buy expensive support contract :-(
> >
> > I know of no hack.
> >
> > It is not dishonest, the original purchase contract for the machine
> > probably said "1 active CPU slot" and "1 active PCI-X slot."
> >
> > Cheers,
> > Carlos.
> 
> It _is_ dishonest, and deceptive at that. When was the last time you
> bought a multisocket system and couldn't add a second processor
> because you needed a support contract? I've never encountered such a
> thing and I've got multisocket x86, Alpha, and SPARC systems.
> 
> This whole license-to-use-hardware thing is bullshit. Mikulas bought
> the hardware, and thus he should be able to use it. I'm struggling to
> find any information about this problem online. I can't even find
> anyone else who has reported that adding a second CPU doesn't just
> work.

I searched extensively (first, I also thought that it's my fault and I've 
forgotten something) and found this:

http://forums13.itrc.hp.com/service/forums/questionanswer.do?admit=109447627+1287849831841+28353475&threadId=1251754 
--- some person replaces a mainboard, gets warnings about invalid serial 
number, too many CPUs (the same as me), CPU speed limit exceeded, 6GB 
memory limit exceeded. The advice was to contact HP to change the serial 
numbers :-(

http://sql.ru/forum/actualthread.aspx?tid=726002 --- the same warning, in 
Russian, no response

http://3000newswire.blogs.com/3000_newswire/2007/08/programs-off-li.html
--- considerations about some programs that can remove limits, nothing 
specific

http://3000newswire.blogs.com/3000_newswire/2007/08/helpful-program.html 
--- some more moaning about HP locking some diagnostic programs

http://3000newswire.blogs.com/3000_newswire/2010/10/indie-resets-of-3000-system-ids-still-available.html 
--- some company that can supposedly reset the serial numbers and allow 
upgrades. The only problem is that sending the workstation to them is 
likely more expensive than the price of the workstation itself :-(

> Are we absolutely sure you've got to jump through some licensing
> bullshit to enable the CPU? Maybe it's just a missed setting in PDC?

I went through the whole PDC menu, didn't find anything. I tried to clear 
all logs, reset it to defaults, etc., but no help.

> > The same goes for enabling additional PCI slots.
> 
> You've got to be kidding me.
> 
> I'd been planning to grab a cheap C8000 and help Linux/PARISC. But no.
> I'll never use hardware like this on principle.
> 
> Matt

I wouldn't buy even a laptop from HP after this experience. What would I 
have to do if I needed a bigger hard drive or more memory? Be forced to 
call HP "award winning" support, pay for the work that I can do myself and 
be forced to upgrade it with overpriced "original" parts?

BTW. I added another 1GB memory to that C8000 workstation (it had 2GB 
before) and it works. But knowing that there may be memory limits in the 
firmware too, I'm just scared how much can I buy and add before hitting 
some of them :-( The leaflet says that the maximum is 32GB, but we know 
that it doesn't tell the truth about the number of CPUs.

Mikulas
