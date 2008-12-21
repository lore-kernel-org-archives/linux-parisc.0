From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: HPMC bus timeout on C3600
Date: Sun, 21 Dec 2008 01:10:21 -0700
Message-ID: <20081221081021.GB2047@colo.lackof.org>
References: <20081220133915.4c167e09@bleh.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081220133915.4c167e09@bleh.bxl.tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Dec 20, 2008 at 01:39:15PM +0100, Guy Martin wrote:
> I'm recently running into HPMC bus timeout problem. While this never
> caused any problem before, I've noticed a few strange things. I've
> attached the output I get from "pim hpmc" in the PDC.
> 
> This BUS timeout occurs after one or two days of idling when I plug a
> specific card reader in the USB PCI card I plugged in. I think this
> card reader causes problems because it's being polled every 2-3 seconds.
> 
> Nevertheless, looking at the pdc output, it seems that the OS HPMC
> handler is not kicking off according to the chassis code CBF2 and CBFC.
> CBF2 : bas OS HPMC len
> CBFC : OS HPMC br err
> 
> I've check GR02 and it points to inw() which makes sens. Nothing
> interesting there.
> 
> The failing device appears to be the built-in NIC according the path
> provided in the output (10/0/12/0) and the C3600 service manual (figure
> 5-2).

It's likely the NIC (tulip driver) is just more active than the other
USB controller and thus becomes the "victim" of the USB misbehavior.
This is very common for DMA programming bugs.

"word2" from this bit of the HPMC  needs to be decoded:

I/O Module Error Log Information:

Timestamp =
  Tue Dec  16 21:23:47 GMT 2008    (20:08:12:16:21:23:47)


'9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:

 Rope     Word1        Word2            Word3
------ ------------ ------------
   0    0x00000000   0x0e0cc2a9   0x00000000fed30048
...

Both the USB controller and NIC are on Rope 0. If the USB controller
falls over, it will take all devices on that bus with it.

We've seen "0x0e0cc2a9" before but it wasn't decoded then either.


> Even if this look HW pb, I've had a few reports recently about HPMC PCI
> timeout issues and I have a few doubts.
> 
> Now my questions are :
>  - does this look like an HW or SW problems ?

More likely SW.

>  - why isn't the HPMC handler kicked off ?

No Idea. Probably not hooked in correctly.
But this might also explain why you haven't seen many HPMC bug reports.

>  - could the HPMC handler recover this ?

No.

>  - what debug can I enable to get more info about this if applicable ?

I'd look carefully at USB DMA streams. This will likely require
adding debug code to USB drivers. Mostly to dump when a USB buffer is
mapped and when it's unmap.

hth,
grant
