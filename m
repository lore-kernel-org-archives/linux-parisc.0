Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA14789
	for <parisc-linux@puffin.external.hp.com>; Mon, 6 Mar 2000 00:24:12 -0700
Message-Id: <200003060626.WAA04127@milano.cup.hp.com>
To: willy@thepuffingroup.com
Cc: huck@cup.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: uncacheable memory 
In-reply-to: Your message of "Sun, 05 Mar 2000 09:29:01 PST."
             <20000305092901.E9944@thepuffingroup.com>
Date: Sun, 05 Mar 2000 22:26:55 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Mar 04, 2000 at 09:49:49PM -0800, Grant Grundler wrote:
> HP systems have three I/O MMU's which are I/O coherent: U2/Uturn,
> Astro/Ike, and Epic/SAGA.  AFAIK, all systems using one on them have
> the processor(s) connected to a "Runway" bus.  This limits what
> processor model those systems can have: PA-7200, -8000, -8200, or -8500.
> 
> (Caveats:
>  - T-class has something similar to U2 which is NOT I/O coherent

Apologies. I should have been clearer about several things.

"T-class" should have been "T600".
I don't think T5xx series have any sort of I/O TLB in them.

willy@thepuffingroup.com wrote:
> According to the hwdb, the T600 has two `Java BC Summit Port (IOA)'.
> And you're the only one in possession of a T-class :-).

Actually, I'm neither in possession of one nor the only person who
might be. I couldn't believe it, but AFAIK HP sold thousands of them.
(The ioscan output is left over from my previous job.)
FTW, the URL is still valid but no longer linked from the
main "servers" web page:

	http://www.unixsolutions.hp.com/products/servers/tclass/

I suggest interested parties "snarf" what they can from those web pages
before the pages go away....375kg...sheesh.

> All the devices in the T600 seem to be special devices so the
> drivers would have to be freshly written anyway.  I don't see
> a PCI adapter in the T-class, can one be fitted?

First, T5xx only supports HP-PB devices. Basically same devices
as "Nova" (EFGHI-) class boxes and K-class. However, like K-class,
T600 also supports GSC cards in a "daughter board" form factor.
(but the "header" sheet metal is slightly different.... *SIGH*)

And HP does make/ship card-mode Dino 100BT cards for both T600
and K-class. Making card-mode Dino work on T600 is quite impossible
without looking at HP-UX source (or reverse engineering the binary).
I helped do it once. Java really doesn't like to play with Dino.

> I assume Summit is the name of a bus, like Runway only different?

Yes. AFIAK, Summit is the "memory" bus for T-5xx series.
On T600, same bus protocol but it's twice as "wide".


Someone else asked what's wrong with the memory controllers:

AFAIK, subcacheline accesses are a different type of transaction 
which many HP memory controllers don't *need* to support. I'm guessing
systems where I/O devices sit on the same bus as the memory controller
(eg 712, PA-7100LC), the memory controller supports all types of
transactions in order for DMA to work. So if the U-bit is also
supported by the processor, it'll all work.


hope this is better,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
