Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 664594952
	for <parisc-linux@parisc-linux.org>; Wed, 10 Oct 2001 01:46:21 -0600 (MDT)
Message-Id: <200110100743.BAA12218@puffin.external.hp.com>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: "parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Final version of Configure.help 
In-Reply-To: Message from Thomas Marteau <marteaut@esiee.fr>
   of "Tue, 09 Oct 2001 23:36:16 +0200." <3BC36DD0.42636C7@esiee.fr>
Date: Wed, 10 Oct 2001 01:43:10 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Thomas Marteau wrote:
> 	Here is the patch to update the help for make config. It is the result
> of many advices given by a lot of people. 

thomas,
overall, it looks pretty good...thanks for pulling this together!

> PS: Any comment is STILL possible :-)

ok :^)

In general, I'd rather not see comments in this document about
what options are or are not working. That's changing still and we don't
feed stuff back upstream very often.  Better to point folks to
a web page(s) (perhaps both www.parisc-linux.org and esiee pages)
for current status.

I'd also like to note that most options which enable HW support
are safe to enable even if the platform doesn't have that HW.
The goal is to be able to enable everything and have the kernel
just DTRT at boot time. In short, I'd like to see something like
"Safe to say 'y' if in doubt" on most of the "new" options.

> +GSCtoPCI/DINO PCI support
> +CONFIG_GSC_DINO
> +  By selecting this item, you add PCI support for Dino PCI Host Bus bridge.
> +  PCI devices are sometimes embedded in GSC add-on cards (aka "card-mode 
> +  Dino"). Note that only recent systems need it like B132L, C200. For more
> +  information, go to http://hwdb.parisc-linux.org.

"EISA Form Factor" Card-mode dino can be found in anything as old as 715's.
"3x5 Form Factor" GSC cards fit (and should work) in all K-class.

Anyway, it's safe to enable.

> +LBA/Elroy PCI support
> +CONFIG_PCI_LBA
> +  Elroy is a bridge between Ropes bus and PCI on several machines. It can
> +  be found on A500 and B/C/J/L/N-XXXX models.

Also found in A400 and Superdome.
Might be simpler to say "newer workstations and servers which have 4X-PCI".


>   ...It allows the system to 
> +  communicate with PCI cards. Thus, you should leave it on especially
> +  if you have one of the listed HP machines. By default, say Y.
> +
> +SuperIO support
> +CONFIG_SUPERIO
> +  SuperIO is a chip that integrates a good part of I/O for the newest 
> +  B/C/J-XXXX workstations. Serial, USB, IDE and Floppy are built in that

*controllers* - not the devices are built-in.

> +  chip. That's why you must select it, if your box is corresponding to
> +  those series. Please note that only the seriel support is working
> +  at the moment.

typo: serial

thanks again!
grant
