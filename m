Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 224E54840
	for <parisc-linux@lists.parisc-linux.org>; Sat, 22 Nov 2003 15:09:21 -0700 (MST)
Date: Sat, 22 Nov 2003 15:09:19 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] strace locks up 2.4.22-pa14
Message-ID: <20031122220919.GA6732@colo.lackof.org>
References: <20031121005003.GB13007@colo.lackof.org> <3FB265250000556F@ocpmta2.freegates.net> <20031122052915.GB29917@colo.lackof.org> <3FBF4F65.70502@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FBF4F65.70502@tiscali.be>
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

On Sat, Nov 22, 2003 at 11:58:29AM +0000, Joel Soete wrote:
> I don't know but seems to hang like boot hang when I include the pdc 
> support into the kernel: green led stay lightning. (and toc seems to 
> failed because of a time out IO; i don't remember but I think i do have 
> to read it on lcd)

What do you mean by "PDC support"?
You mean CONFIG_PDC_CHASSIS?
AFAIK, this only enables chassis codes to be displayed on either
the "front panel" LCD or LEDs.

It looks like my box HPMCs after the TOC. The TOC performs
a reset and then seltests run. Then next thing on the LCD
display is "OS HPMC" even though the gfx card hasn't been
initialized yet.

> Well, I don't realy need that system hang to toc it?

Right. TOC is just convenient to use when the system is hung.

> So when I have some time, I will re-try a toc when system is running and 
> see what hapen ;)

You'll get state info about cpu_idle() or whatever it happens to
be doing.

> >bummer. Makes me wonder if this is CPU cache related too. 
> I am curious to see the result of your test ?)

2.4.22-pa17 on c3k, "strace -f -o /tmp/dcop.out dcopserver" hung at home. 

GR02 0x10389567	
20-23	0x32  0x0e 0x10 0x00
24-27   0x00  0x10 0xcc 0x102d2010

CR0-3 0x00 0x1822 0x00 0x1824

IOAQ 0x102a1188	number+170
CPU State 0x9e000001

Looks like the PIM dump is garbage. (gr02 is not a kernel address)
I've cleared the PIM and will retry later...gotta run.


> what I don't understand is that lpr works fine on my b180 runing a 
> k-2.4.21 (for lvm2 support) otc the b2k is running a k-2.4.23-rc2-pa7 (a 
> merge of mine); so my doubt is that I could break something :(.

Is this via parallel port or network printer?
If network, then I would guess your merge (or the 2.4.23-rc2 base) has a bug.
If parallel port, likely a bug in suckyio support for parallel port.

But it's not exactly "apples to apples" comparison since the IO subsystem
between B180 and B2k is completely different.

grant
