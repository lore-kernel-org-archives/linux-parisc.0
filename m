Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from amanda.ybsoft.com (unknown [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id C1269482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Aug 2001 08:54:51 -0600 (MDT)
Date: Fri, 10 Aug 2001 08:54:49 -0600
To: Jurriaan Kalkman <Jurriaan.Kalkman@zrt.nl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Is a C200+ currently supported?
Message-ID: <20010810085449.A22779@beavis.ybsoft.com>
Reply-To: rbradetich@uswest.net
References: <sb73b3e0.043@ms-zrt1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <sb73b3e0.043@ms-zrt1>
From: rbrad@beavis.ybsoft.com (Ryan Bradetich)
List-ID: <linux-parisc.vger.kernel.org>

Jurriaan,

I use a C200+ as my development machine for the parisc-linux port. So
yes, I try to keep the C200+ supported.  Be forwarned that I am newbie
kernel hacker, and sometimes it takes me a long time to find/fix the 
problems on these machines (ie. the ccio cpio cdrom -> disk HPMC).  I
have only been using the serial console interface from the C200+ so I'm
not sure how well (or if the STI works on this machine).  Now that I 
found/fixed the HPMC I was looking for, I will see if I can give it a 
whirl with the 0.9.2 installer tonight.

The machine will run fine with 512 MB memory / 9 GB disk.  I started
using the C200 with 256 MB memory / 4GB disk and it worked great for
what I was doing.

Hope this helps!

- Ryan

On Fri, Aug 10, 2001 at 10:10:31AM +0200, Jurriaan Kalkman wrote:
> I'm tempted to buy a HP C200+ (PA8200/512 Mb/9 Gb/Visualize fx-4).
> 
> From the website, it would seem that it is, except for the graphics-card
> (Visualize FX-4) for which there is no framebuffer support.
> 
> Does this mean I only get the console (80x25) or is there also X?
> 
> In general, does such a machine run linux acceptable (with 512 Mb memory / 9 Gb disk) ?
> 
> All (off-list) experiences are very welcome!
> 
> Thanks,
> Jurriaan
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 

-- 
