Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id PAA00559
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Mar 2000 15:23:27 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel2.hp.com (Postfix) with ESMTP id 0A6CE19C9
	for <parisc-linux@puffin.external.hp.com>; Thu,  2 Mar 2000 16:25:03 -0500 (EST)
Message-Id: <200003022119.NAA11506@milano.cup.hp.com>
To: "Gyula Matics" <gyula_matics@hp.com>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] lasi scsi driver 
In-reply-to: Your message of "Thu, 02 Mar 2000 21:42:50 PST."
             <006601bf8487$e057e010$a94abc0f@hungary.hp.com>
Date: Thu, 02 Mar 2000 13:19:40 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Gyula Matics" wrote:
> It's only half working. It can list the devices on the bus, but that's all.
> 
> It is not working because it needs a horrible amount of cache flushing
> and I still didn't get it right. (the committed code only contains enough
> flushing to pass the two debugging tests)

Aside from the mailbox problems, have you added code to flush/purge
entries for payload data?

I was just talking about that with someone and thinking we could
put that in a "common" I/O path. I found "wakeup_bdflush()" but have
no clue what that does.

The goal here is to enable *all* SCSI disk drivers WRT to the payload data.
We are interested in getting PCI SCSI drivers working too and I know
this is going to be a problem. At least it's a problem until the
"Dynamic DMA mapping" interfaces are implemented for parisc-linux
and actually used by the drivers parisc-linux folks care about.


> The scsi card is running code that is in the main memory and the driver
> is heavily patching that. The bigger problem is that the communication
> with the card is done via a mailbox also residing in the main memory
> and the driver is assuming that this mailbox is on a non-cacheable page.
> 
> I know that the architecture supports setting a page non-cacheable.
> My question is if it is possible / good idea to set the mailbox page
> to non-cacheable?

Philipp Rumpf mentioned a possible implementation to me in a private
e-mail (make_page_uncached()). He's open to other ideas and/or
interfaces if another architecture has already solved this problem.
I started looking into this but I'm way outta my depth here.

Like the payload data, this is a kluge only needed until the
drivers use the new "Dynamic DMA mapping" interfaces described
in Documentation/DMA-mapping.txt. (I reccomend version 2.3.47
or newer). We should be able to hide the "(make_page_uncached()"
call in those interfaces from the drivers.

thanks,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
