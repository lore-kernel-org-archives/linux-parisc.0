Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA13092
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Oct 1999 18:00:46 -0600
Message-Id: <199910270001.RAA04300@milano.cup.hp.com>
To: Alex deVries <adevries@thepuffingroup.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] B132L console output 
In-reply-to: Your message of "Tue, 26 Oct 1999 18:54:24 PDT."
             <Pine.LNX.4.10.9910261851210.30574-100000@vodka.thepuffingroup.com>
Date: Tue, 26 Oct 1999 17:01:48 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> 
> On Tue, 26 Oct 1999, Grant Grundler wrote:
> > This B132L I took this output from is unique.
> > It has a DEC PCI-PCI bridge stuck in it and our buswalk handles it fine.
> 
> I have a couple of questions about this machine:
> 
> > Lastly, the "lasi serial #1 at 0xffe02000" not getting claimed
> > is becaused it's trying to talk to Dino's RS-232. lasi_alloc_irq()
> > handles it correctly by failing and this failure correctly results
> > in not claiming the device.
> 
> We need to fix it so that it doesn't attempt to load the Lasi serial
> driver when it's really a Dino RS 232.  That should be pretty easy to fix.

Ok.

> 
> > Found devices:
> > 1. Phantom PseudoBC GSC+ Port (7) at 0xffc00000, versions 0x504, 0x0, 0x0, 
>   0x0, 0x0
> > 2. Unknown device (4) at 0xfff8c000, versions 0x3c, 0x0, 0x89, 0x0, 0x80
> 
> Do you have any idea what that unknown device might be?

Address map says "Zalon". That's the GSC front end for NCR c720 board.
I think from ioscan.B132L its:
ext_bus     1  8/12  c720 CLAIMED     INTERFACE    GSC Fast/Wide SCSI Interface

iodc data for 8/12 device is:
	3 192 0 132 0 0 137 128 153 0 1 0 197 233 0 2

You'll have to figure out if that matches...I'm not up to it right now.
C720 driver normally says "Built-in" if some PDC call says it's a built-in.
So I don't really know what to make of it.

> > 6. Merlin 132 Core RS-232 (10) at 0xffd05000, versions 0x3c, 0x0, 0x8c, 0x0
>   , 0x0
> > 16. Merlin+ Wax RS-232 (10) at 0xffe02000, versions 0x3a, 0x0, 0x8c, 0x0, 0
>   x0
> 
> Which of those is actually connected?

I would think both.
But I was wrong about dino exporting it's RS-232 on this box.
The B180 does export Dino's RS-232 from 8/0/63.
But I was right in that Lasi only exports one of them.


> > 11. Merlin 132 Core PC Keyboard (10) at 0xffd08000, versions 0x3c, 0x0, 0x8
>   4, 0x0, 0x0
> > 12. Merlin 132 Core PC Keyboard (10) at 0xffd08100, versions 0x3c, 0x0, 0x8
>   4, 0x0, 0x0
> > 15. Merlin+ Wax HIL (10) at 0xffe01000, versions 0x3a, 0x0, 0x73, 0x0, 0x0
> 
> How about those?

Again, based on the HPA, I'd say 11 and 12 are the PS/2 ports off Lasi.
15 is most likely off the WAX chip (EISA bus adapter.)
I don't know if B132L has EISA slots (haven't looked inside one in
a long time), but HP-UX reports "EISA Bus Adapter" at 8/20/5.
So I would assume it does.
Note that the B180 does NOT. And thus doubt the A180 would either.

cheers,
grant

> 
> - Alex
> 

Grant Grundler
Unix Developement Lab
+1.408.447.7253
