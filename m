Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA07444
	for <parisc-linux@puffin.external.hp.com>; Sun, 7 Nov 1999 11:15:20 -0700
From: Andi <der_fisch@fischlustig.de>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] cant use rbootd
Date: Sun, 7 Nov 1999 19:04:46 +0100
Content-Type: text/plain
References: <199911030250.TAA16563@puffin.external.hp.com> <19991107125314.N25252@mencheca.ch.genedata.com> <99110713214800.00507@beavis>
In-Reply-To: <99110713214800.00507@beavis>
MIME-Version: 1.0
Message-Id: <99110719083800.00319@beavis>
List-ID: <linux-parisc.vger.kernel.org>

On Son, 07 Nov 1999, Andi wrote:
> Hi,
> 
> I am using an rbootd running on Debian 2.1 , but my HP 712/60 cant find it, I
> put the correct ethernet adress in the /etc/rbootd.conf
> 
> but nothing happens if i type
> 
> BOOT_ADMIN> search lan

OK, forget what I wrote, I used rbootd instead of bootp... oops. Booting over
the network works now. I tried the latest snapshot of the PARISC-Linux Kernel.
But it doenst seem to get far...

after 

"transferring control to kernel (...)"

nothing happens.

-- 
bye
  Andi
