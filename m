Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA01662
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Sep 2000 18:52:24 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 6 Sep 2000 00:52:21 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA24019;
	Wed, 6 Sep 2000 11:46:40 +1100
Date: Wed, 6 Sep 2000 11:46:40 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] entry.S Invalid operands
In-Reply-To: <200009052132.OAA23661@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0009061137540.22521-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 5 Sep 2000, Grant Grundler wrote:

> Hi all,
> my parisc-linux kernel builds now get:
> hppa-linux-gcc -I/linux/test6/linux-2.3/include   -D__KERNEL__ -I/linux/test6/linux-2.3/include  -c -o entry.o entry.S
> entry.S: Assembler messages:
> entry.S:828: Error: Invalid operands 
> entry.S:829: Error: Invalid operands 
> entry.S:830: Error: Invalid operands 

My guess is that you need to update your assembler.  The lines in question
use register aliases instead of %r<num>:
        depd            pte,8,7,prot

pehc CVS before 2000-08-23 won't accept register aliases on all
instructions.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
