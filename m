Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA15356
	for <parisc-linux@puffin.external.hp.com>; Wed, 12 Apr 2000 14:31:57 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 0C867244
	for <parisc-linux@thepuffingroup.com>; Wed, 12 Apr 2000 13:31:55 -0700 (PDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id NAA16864 for <parisc-linux@thepuffingroup.com>; Wed, 12 Apr 2000 13:31:58 -0700 (PDT)
Message-Id: <200004122031.NAA16864@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] tulip on parisc-linux 
In-reply-to: Your message of "Wed, 12 Apr 2000 10:13:21 PDT."
             <852568BF.004E1032.00@tormta3.tor.cel.com>
Date: Wed, 12 Apr 2000 13:31:57 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


George,
Thanks for the long reply. I badly needed new ideas on what the
problem might be and you provided several.

davisg@Celestica.com wrote:
...
> But things don't appear to be too bad since the data in the TDs looks good at
> this point.

In hp100bt4.txt PCI trace, the TX descriptor data is not good.
See comments at the top of that file.


> My money is on a timing problem in the CSR register writes. Read on...

Me too. But I don't know what since it "works" on other boxes.

> Grant Grundler wrote:
> > Couple of questions:
> > 1) Anyone know if drivers/net/tulip/* (pre3 or later) work on
> >    an architecture with 64-byte cachelines?
> >    (21143 doc says it supports 8/16/32 byte cachlines)
> >
> 
> Actually, the units are "longwords", i.e. 32, 64; 128 Byte
> cache line sizes.

Yes. Thank you. I did infact mis-interpret that for both the PBL
and CAL fields of CSR0.


> > 2) The tulip fetches way more data than it needs for the setup frame
> >    TX descriptor. (See lines -215 to -4 of the cogent PCI trace).
> >    Anyone know why?
> >    (I can arrange a free 712/80 for who ever can explain that to me)
> 
> No, but can I guess?

Certainly. That's all I've been doing. :^)


> My guess is that you haven't (actually the tulip driver hasn't) set the
> TER bit in TDES1 of the last TD in the ring (which points back to 0x200).


"4.3.6.1 Frame Processing" discusses the TER bit.
I'm going try that out after trying to set PBL.

The TDES0<31> (ownership) bit is discussed in the next section.
But lack of ownership doesn't seem to stop the 21143 from *reading*
the entire list of TX descriptors.

> Under the assumption that the DMA engine in the 21143 performs prefetch
> of descriptors (although admittedly 52 +/- entries is a bit much.

It seems to only prefetch RX descriptors *before* a frame starts to come in.
hp100bt3.txt PCI trace seems to confirm that's how it behaves under HPUX.

> Particularly in consideration of the fact that only the first entry
> has the OWN bit set and all entries thereafter are owned by the host)

Under HP-UX, the DMA engine only reads the first TX descriptor, then
the next TX descriptor, and then stops. The host writes CSR1 once
the second Tx descriptor is initialized for outbound data. The card then
re-reads the second TX descriptor and corresponding data buffer.

> and PBL in CSR0 is cleared, i.e. the free space in the xmit FIFO prior
...
> Hmmm, I think I'm liking the PBL theory - assuming that the 21143 PCI master
> interface prefetch engine isn't tightly integrated with the DMA descritor
> prefetch logic, this long prefetch of descriptors may be merely an
> artifact of the 21143 PCI master interface design. Now I'm really
> full-of-****.

I think setting PBL is a good idea. HP-UX sets it to 32-bytes...but
HP-UX also "lies" about the cacheline size. See hp100bt3.txt.

> How deep is the Xmit FIFO anyway?

PBL description (page 3-28) says:
	"If reset, the 21143 burst is limited only by the amount of
	 data stored in the receive FIFO (at least 16 longwords), or
	 by the amount of free space in the transmit FIFO (at least 16
	 longwords)"

This unfortunately doesn't clearly put an upper bound on the FIFO size.

BTW, "4.3.5.2 Frame Processing" talks about how the RX FIFO is used
and mentions prefetch of descriptors.


...
> Try changing the PBL to something other than 0 and observe the
> results (length of TD prefetch)...

Will do.


> Another thought: maybe the Configuration Latency Timer setting is related
> to what you're seeing? Oooh, I just imported your trace into a spread
> sheet and come up with a 21143 DMA memory read duration of about 271 PCI
> clock ticks assuming 30ns clock period. Sounds suspicously close to a
> max latency of 255 ticks give or take assuming bus grant was revoked?

Could be what's limiting the burst since neither PBL, TER, or anything else.
Note that cogent1.txt PCI traces and hp100bt?.txt traces sometimes
have slightly longer/short number of dwords read. This could be explained
by slight variations in host latency and thus the latency timer expires
after a different number of transactions.


> HERE BE DRAGONS (or at least I hope so I can get  a free 712/80):
> =========================================================
> Wait a minute... why are you writing to CSR5 immediately after setting
> CSR6 start/stop xmit?  The HRM says the last thing you should do when
> setting up is to write to CSR6.

Agreed. Writing CSR5 (to clear interrupt status bits) should be done
*before* starting the SIA TX engine (write to CSR6). I have no clue
why it's done this way. Certainly leaves us open to race conditions...

only in the cogent1.txt trace does one see that CSR7 is written *after*
the first TX descriptor has been read. This actually enables the interrupts.
That might be why we don't see any interrupts (even for error conditions).

hp100bt3.txt: HP-UX writes CSR7 immediately after starting the
   RX and TX engines.  This probably isn't a good thing either.
   But note that CSR5 is written *before* starting RX/TX.

> The device gets pretty picky about what you can get away with thereafter.
> Maybe the fact that the tulip driver is writing to CSR5 immediately
> after setting the xmit start/stop bit is causing confusion in device's
> state. Since the Status Register bits are Read/Clear,
> shouldn't they be cleaned up prior to starting the transmit and/or receive
> engines?

I think so too. We should at least see the interrupts for error conditions.

> Seems like trouble may be possible otherwise, e.g. clearing an event in
> progress?

yes.

> I'm looking at the tulip driver source contained in the 2.3.28 release

The parisc-linux source is from 2.3.99-pre3 code and is quite different.
You can view parisc-linux code either through the web links from
	http://puffin.external.hp.com/bonsai/rview.cgi
 OR
	http://puffin.external.hp.com/cgi-bin/cvsview/linux-2.3/

> and I'm having trouble understanding how the chip is assured that it
> can complete what it's doing before getting clobbered by some of the
> later CSR writes. There is no pause after starting the load of the
> setup frame prior to writing to CSR5, CSR7, CSR6 and then
> starting the receive engine in quick succession.

Luck. It happens to work most of the time on most platforms.
That's all.

...
> Now that I've completely embarrassed myself, why not try simply inserting a
> delay immediately after you start the transmit engine for the setup frame to
> see if there is indeed some problem in writing to CSR5 so quickly after
> launching the setup frame.

I'll add something similar to my TODO list:
o move the CSR5 and CSR7 writes to precede the CSR6 write which starts
  the TX/RX engine.

> Although, I haven't given you a concrete  answer, do I still qualify for the
> free 712/80 if I'm on the mark?

Certainly. I'm open for shotgun approach too....besides anyone who wants
a 712/80 that badly should get one (given current availability).


> Way too much time on this... Maybe I should resolve to be a silent bystander!

naah....that's boring. Big thanks for you help!

> P.S. I have another theory - have you performed a hard reset of the
> device to assure that no residual state lingers from the IODC's use
> of same during boot. Assuming you booted via this devce.

I didn't boot from this device.  But a SW reset is performed which should
reset all CSRs and SIA state but not Configuration Space registers.

George, again big thanks for the ideas...I'm reading "new" sections
of the HRM (HW Ref Manual I've assumed) now because of this.

grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
