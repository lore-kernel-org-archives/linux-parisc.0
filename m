Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA26168
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Nov 2000 11:01:47 -0700
Message-Id: <200011271757.JAA25357@milano.cup.hp.com>
To: marteau <marteaut@esiee.fr>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: 
In-reply-to: Your message of "Mon, 27 Nov 2000 18:11:36 PST."
             <20001127171136.B02CFD15BD@mail.esiee.fr>
Date: Mon, 27 Nov 2000 09:57:39 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

marteau wrote:
> 	We have tried to compile the new linux source today and vmlinux      
> always needs pci.o to link. It works if you delete pci.o from the     
> objects list in the kernel Makefile. But, we don't know why it was    
> needed because we did not ask for in our "make config"...

Hi Thomas,
The problem is in arch/parisc/kernel/Makefile.
It doesn't use CONFIG_PCI to decide if pci.o is needed.
I'll fix that now - should be simple.

thanks,
grant
