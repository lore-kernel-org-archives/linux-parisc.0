Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA11391
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Jun 1999 11:10:07 -0600
Message-Id: <199906281709.KAA03215@milano.cup.hp.com>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Anyone got a few moments? 
In-reply-to: Your message of "Mon, 28 Jun 1999 17:21:41 PDT."
             <19990628172141.G30362@mencheca.ch.genedata.com>
Date: Mon, 28 Jun 1999 10:09:16 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> Which of the people involved in this project know PA-RISC assembler?
> 
> We need xchg() written (in include/asm-parisc/system.h) before the
> networking will compile.  We're going to need other stuff written too of
> course; I know ARM assembler, so I guess I could probably learn PA-RISC
> asm if no-one else wants to.

What does xchg() do?

If it's a byte swapper, look at "PA-RISC 2.0 Architecture", by Gerry Kane
from HP Professionl books, page I-6. That's "Programming Notes" section.
Gives examples for "Endian byte swapping" for 32 and 64-bit quantities.
They work - HP-UX is using them.

grant


Grant Grundler
Enterprise Systems Technology Lab
+1.408.447.7253
