From: Grant Grundler <grantgrundler@gmail.com>
Subject: Re: E Class and SCSI (53c700 driver)
Date: Thu, 2 Apr 2015 10:41:17 -0700
Message-ID: <CAP6odji4Yrj+ZqiY-UFpbde_j=YBEJtQaMKrAVXuq+y2Sb_1Ng@mail.gmail.com>
References: <5519CA2B.9060407@gmail.com>
	<551CF8D9.3020506@gmx.de>
	<1427965174.3559.110.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Helge Deller <deller@gmx.de>,
	Dmitry the Zuryanovich <dreadbit@gmail.com>,
	debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1427965174.3559.110.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Apr 2, 2015 at 1:59 AM, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
....
> Probably all that's needed is a tiny wrapper driver for whatever bus
> it's on (what bus is this?).  If you look at lasi, it basically pulls
> the parameters out of firmware, translates the lasi specific IRQ setting
> and enables the GSC interrupt (plus some LED stuff specific to lasi).
...
>> In  arch/parisc/kernel/hardware.c I see:
>>          {HPHW_A_DMA, 0x044, 0x00039, 0x80, "Sahp Baat Kiuh SCSI"},
>
> That tells us it's on the Precision bus, doesn't it?

Yes. "E-class" was one of the "alphabet soup" servers with HP-PB
(IIRC, not HP-IB) slots. Since the system uses PA-7100LC, the "system
interconnect" is GSC and an HP-PB bus converter provided access to the
HP-PB slots.

I don't believe the 53c710 was connected on E-class servers based on this table:
    http://www.parisc-linux.org/documentation/hp9000_models.html


                                      CPU    BUILT-IN      ADD-ON SCSI I/O
MODEL STRING     PROJECT NAME        TYPE    SE, FWD/TYPE  SE, FWD, GSC-FWD
------------     ------------------  -----   ------------  ----------------
...
806/E25          WB Orville (48 Mhz) 7100LC  NIO, None     NIO(1),NIO(2),NA

("BUILT-IN" and "ADD-ON" SCSI both are NIO - aka HP-PB)

...
> The best docs we have:
> https://parisc.wiki.kernel.org/images-parisc/5/52/E-class_hpjournal.pdf

Also check on:
    http://www.openpa.net/systems/index.html

or more specifically:
   http://www.openpa.net/systems/hp-9000_e25_e35_e45_e55.html

> Say the SCSI controller here is precision attached not lasi attached
> (the ethernet is on the lasi, though).  Unfortunately, we don't have any
> documents at all in the archive for the precision bus that I can find.

I don't recall any HP-PB specific docs being released.  What I can say
is the HP-PB devices used transaction based interrupt routing similar
to how Dino and other PCI host controllers generated interrupts. So no
IRQ lines are used for HP-PB. And IIRC, there is also no IOMMU in
D/E/F/H/I series servers (meaning they are NOT DMA/Cache coherent
systems).

Lastly, the HP-PB SCSI adapters used a proprietary HP designed (not
Symbios designed) SCSI controller. No docs were ever published for
those either. The "fast-narrow SE" controller (28655A) was directly
controlled by the host computer and was not particularly efficient
(IIRC: 3 interrupts per transaction). The "fast-Wide HVD" (28696A) had
an i960 on board to manage the "version 4" chip. SCSI bus control was
handed to the host computer if anything happened that the i960
couldn't handle.

cheers,
grant

ps. I also found the manual for 28655A:
   http://pdfs.icecat.biz/pdf/22940335-3766.pdf
