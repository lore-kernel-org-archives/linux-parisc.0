Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA14246
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Sep 1999 22:26:00 -0600
Message-Id: <199909220426.VAA27105@milano.cup.hp.com>
To: Ryan Bradetich <rbradetich@uswest.net>
cc: Parisc Linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Questions understanding exec_kernel 
In-reply-to: Your message of "Tue, 21 Sep 1999 19:12:06 PDT."
             <37E82CE6.3A5DFFB0@uswest.net>
Date: Tue, 21 Sep 1999 21:26:50 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Ryan Bradetich wrote:
>  [Question: Page 5-149 from the PA-RISC 1.1 Architecture and Instruction
> Set Reference Manual states: "Level 0:  If the target control register
> is CR 8, 9, 12, 13, 17, or 20, this instructin executes as a null
> instruction."  I am assuming we are running at level 0 since the rfi
> command required running at level 0, so what is the difference between a
> null instruction and a nop?]

That's an easy one:
Nullfied instructions are simple ignored - output discarded.
Branch  instructions have a "nullify" flag - the PA1.1 book
probably talks more about details here.

NOP is an instruction which is executed but does nothing useful.
(eg OR  R0, R0, R0) Often used to get precise timing in a loop
or patch out unwanted instructions for self modifing code.

Someone else will have to tackle the RFI question....

grant
