Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id GAA15682
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Sep 1999 06:44:13 -0600
From: Hai Vo-Ba <hai@fc.hp.com>
Message-Id: <199909221246.GAA29606@hpeshai.fc.hp.com>
Subject: Re: [parisc-linux] Questions understanding exec_kernel
To: rbradetich@uswest.net
Date: Wed, 22 Sep 1999 06:46:31 -0600 (MDT)
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <37E82CE6.3A5DFFB0@uswest.net> from Ryan Bradetich at Sep "21," 1999 "07:12:06" pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


>  .EXIT
>  rfi    ; begin execution of kernel.
>  nop
>  [Question: Page 5-139 from the PA-RISC 1.1 Architecture and Instruction
> Set Reference Manual states: "Execution of an RFI instruction when any
> of the PSW !, I, or R bits are ones is an undefined operation."  We are
> explicitly setting the Q & I bits before calling the rfi command.  I
> don't understand how this works ... ]
>  .PROCEND

    If I remember right, RFI followed by a NOP is an idiom to tell the CPU
  to start fetching instructions from an absolute address pointed to by the
  IVA so we usually want to that with interrupts enabled (Q & I bits set).

  --Hai 
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
