Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA17374
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Aug 2000 21:10:20 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 19 Aug 2000 03:10:03 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 19 Aug 2000 03:09:34 -0000
Date: Fri, 18 Aug 2000 22:04:56 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Richard Hirst <rhirst@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] test6 merge
Message-ID: <20000818220456.A32273@vodka.thepuffingroup.com>
References: <20000818124944.A13870@linuxcare.com> <200008182207.PAA07370@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200008182207.PAA07370@milano.cup.hp.com>; from Grant Grundler on Fri, Aug 18, 2000 at 03:07:51PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 18, 2000 at 03:07:51PM -0700, Grant Grundler wrote:
> The bit 16 and up is the PCI bus number. The parisc PCI services use
> the bus number to index into the corresponding bus services.
> 
> The driver should be using 0x0001ff00 when talking to I/O port
> space services (ie inb/outb).

ok, the problem was that we were modifying .start but not .end so length()
was negative.  see my cvs commit message for more detail.  grant, i'd
appreciate you looking that over, it is untested since i did it on the
aeroplane and i hadn't lugged an a180 with me :-)

> > My 53c720 driver doesn't work any more either :-(
> 
> bummer...we'll get em working...

this _may_ have fixed it.  richard, could you take out the tulip hack you
put in and let me know whether the 720 works now?

however, there is still at least one nasty bug.  on the c3k i was testing
with earlier today, it would hpmc while starting init.  this might be
cured now the pci resources are being mangled properly -- could have
been to do with init trying to open /dev/console perhaps?  this was an
elf sash init, fwiw.

i'm in toronto until sunday evening with no access to parisc hardware, so
don't check out a version of the tree after the LINUS_240_TEST6_PREMERGE
tag unless you want to play hunt-the-bug.  clearly i'd love it if i
checked my email on monday morning and found cvs checkins which fixed
the bugs, but i'm a dreamer :-)

-- 
Revolutions do not require corporate support.
