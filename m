Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id EAA28441
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 04:32:27 -0700
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 16 Nov 1999 11:34:00 -0000
Subject: Re: [parisc-linux] depi?
To: phi@hpfrcu03.france.hp.com (Philippe Benard)
Date: Tue, 16 Nov 1999 12:20:32 +0000 (GMT)
Cc: frowand@cup.hp.com, Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        parisc-linux@thepuffingroup.com, adevries@thepuffingroup.com
In-Reply-To: <38311538.30826FC7@hpfrcu03.france.hp.com> from "Philippe Benard" at Nov 16, 99 09:26:32 am
Content-Type: text
Message-Id: <E11nhb8-0002Zh-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> If I understood correctly, the kernel is located there because it is where it
> is on PC.

Thats why someone pulled that number out of a hat. You can pull any other
page aligned number out of a hat and that will be fine too.

> Sounds like linux is not more portable than any other propriaitary OS since
> confined to PC architecture, a port beeing a mimic of PC if the target arch
> can do it.

Check the mm code. We don't care where you put the kernel. The rules we go
by are simple

1.	The kernel must be able to access all of the current tasks user space
	efficiently. This is done via macros/functions/inlines

2.	The kernel must be able to access all physical ram and also
	mappings of MMIO space. The mappings can be 1:1 - for example on the
	ultrasparc we use the override bits for this. I/O space maps are
	accessed via macros/functions. If those functions resolve to no
	actual extra code this is good.

3.	Access to other tasks virtual address space has to be possible. It can
	be slow and suck however as its main use is ptrace().

The mappings we use vary. M68K for example maps the kernel about 3.5Gig up
and uses space registers to access user space. The x86 because of the weak
page table flipping facilities keeps both user and kernel in a single map. That
makes for nice fast x86 code. That is x86 specific.

Alan
