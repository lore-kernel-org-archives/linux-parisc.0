Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA09557
	for <parisc-linux@puffin.external.hp.com>; Mon, 8 Nov 1999 00:52:42 -0700
Date: Mon, 8 Nov 1999 08:55:13 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Andi <der_fisch@fischlustig.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] cant use rbootd
Message-ID: <19991108085513.P25252@mencheca.ch.genedata.com>
References: <199911030250.TAA16563@puffin.external.hp.com> <19991107125314.N25252@mencheca.ch.genedata.com> <99110713214800.00507@beavis> <99110719083800.00319@beavis>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <99110719083800.00319@beavis>; from Andi on Sun, Nov 07, 1999 at 07:04:46PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Nov 07, 1999 at 07:04:46PM +0100, Andi wrote:
> OK, forget what I wrote, I used rbootd instead of bootp... oops. Booting over
> the network works now. I tried the latest snapshot of the PARISC-Linux Kernel.
> But it doenst seem to get far...
> 
> after 
> 
> "transferring control to kernel (...)"
> 
> nothing happens.

See

http://puffin.external.hp.com/mailing-lists/parisc-linux/1068.html

The information contained therein is essential for anyone not using a
serial console.

P.S.  I've managed to find a machine to act as an rboot server now,
so I've started hacking on the HIL driver to make it work on the 7xx
series as well as the 300.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
