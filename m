Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA05615
	for <parisc-linux@puffin.external.hp.com>; Wed, 13 Sep 2000 18:34:19 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 14 Sep 2000 00:34:43 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA32163;
	Thu, 14 Sep 2000 11:32:38 +1100
Date: Thu, 14 Sep 2000 11:32:37 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Cary Coutant <cary@cup.hp.com>
cc: David Huggins-Daines <dhd@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] userspace function pointers in the kernel
In-Reply-To: <200009131711.KAA21176@adlmail.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0009141123500.30310-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 13 Sep 2000, Cary Coutant wrote:

> allocate PLT entries for all exported symbols). This means that you might 
> be asked to dlclose a library that contains the PLT entry that is 
> currently in use as the official function pointer for a function in 
> another load module. If you go ahead and deallocate the library, you're 
> hosed.

Yup, another reason, this one really solid, to use David's dynamically
allocated fptrs.

Note to David:  Make sure dl-fptr.c:_dl_unmap doesn't have this same
problem, if this function is called on a dlcose.

Alan
-- 
Linuxcare.  Support for the Revolution.
