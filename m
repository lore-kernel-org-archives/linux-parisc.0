Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA21224
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Aug 2000 11:52:29 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 11 Aug 2000 11:52:40 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id VAA16176;
	Fri, 11 Aug 2000 21:51:35 +1000
Date: Fri, 11 Aug 2000 21:51:35 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matthew Wilcox <matthew@wil.cx>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 64-bit binutils problem
In-Reply-To: <20000810180624.J10843@vodka.thepuffingroup.com>
Message-ID: <Pine.LNX.4.21.0008112139580.29780-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 10 Aug 2000, Matthew Wilcox wrote:

> p.p.s.  anyone know why my piece of debug code:
> 
>         ldil            0xdecf0000, %r9
> 
> is getting assembled as:
> 
>     c0100000:   21 20 0f 00     ldil 78000000,r9

You've told the assembler to plug in the constant 0xdecf0000 to a ldil
instruction.  ldil has a 21 bit field so you only get the bottom 21 bits
of your constant.  The number they represent is the constant shifted
left by 11 bits.  Just happens to be 78000000  :-)

Try "ldil L%0xdecf000,%r9"

'twould be a lot nicer if "objdump -d" produced output that could be fed
back into the assembler, in which case you'd see the L%.  I may even fix
it one day when I find I have nothing to do...

Alan
-- 
Linuxcare.  Support for the Revolution.
