Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: j.steindlberger@gmx.de
Cc: moritz@freesources.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ide controller 
In-Reply-To: Message from j.steindlberger@gmx.de
   of "Thu, 19 Sep 2002 10:41:14 +0200." <28859.1032424874@www2.gmx.net>
References: <20020916043004.B27754829@dsl2.external.hp.com>  <28859.1032424874@www2.gmx.net> 
Date: Thu, 19 Sep 2002 16:33:16 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020919223316.13D0E4829@dsl2.external.hp.com>
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

j.steindlberger@gmx.de wrote:
> drivers. We disabled the following:
> [ ]     Generic PCI bus-master DMA support

hmm....ok.

> After compiling wie had these three modules:
> ide-mod.o
> ide-probe-mod.o
> ide-disk.o

No pdc202xx.o?

> An insmod ide-mod.o was possible. But after insmod ide-probe-mod the kernel
> crashes. In some cases we got an output with about 50 pages of memory
> addresses. At the beginning we got some messages told about the SYM-SCSI-devi
>   ce.
> Could that be a conflict?

I don't think so.

> We did not succeed to reproduce that and log it.
> 
> Here my questions:
> Did You here about anyone to succeed in using an IDE-controller in a
> HP-RISC-architecture?

Yes. My C3000 has IDE CD-ROM hanging off the "SuckyIO" chip.
That works using PIO mode thanks to Randolph Chung/Thomas Bogendoerfer.

> Do You see a chance to use IDE-disks in future (with some none
> HP-controller)

yes - but I don't expect it to "just work".
IDE is a PoS with lots of buggy HW.
PARISC isn't very tolerant of many things the x86 PCs tolerate.
(eg access to disabled devices, PCI parity errors)

> Do You know about more people who are interrested in what we tried to do?

I don't offhand. If someone is, I ask they contact you directly.
Please continue to post status here and I'll offer advice when I can.

> That would be an argument for me to continue experimenting.

If you get it working, I'd be happy to help put any changes back
into our source tree and ultimately back to Alan Cox/Linus.

...
> > #define PDC202XX_DEBUG_DRIVE_INFO               0
> > #define PDC202XX_DECODE_REGISTER_INFO           0
> > 
> >   and rebuild the module with that.
> > 
> > 3) post the console log and "ser pim" output at PDC prompt.

Using a serial console makes it easier to grab console logs in
the case were the machine is crashing.

Generally, I can help decode HPMCs and explain what might be wrong.
That's what the "ser pim" output is for.

I really need both to debug most IO problems.


grant
