Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA29501
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 04:26:07 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 21 Nov 2000 11:28:19 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id WAA02144;
	Tue, 21 Nov 2000 22:26:14 +1100
Date: Tue, 21 Nov 2000 22:26:14 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Richard Hirst <rhirst@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] signal handling problems (32 bit kernel)
In-Reply-To: <20001121093442.U32715@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0011212057160.15623-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 21 Nov 2000, Richard Hirst wrote:

> Time to try and work out what signal.c is really trying to do, I guess.

Maybe you should start by considering all the possible states a task can
be in when a signal is delivered, in regards to saved registers and stack
layout.  It would be a _very_ good idea to formalize this once you've
sorted it out by splitting up struct pt_regs appropriately.  ie. as other
architectures do, into struct pt_regs and struct switch_stack.  Actually,
parisc could go one further and have three structures, one corresponding
to registers saved on syscall entry (new pt_regs), one corresponding to
macro callee_save (switch_stack), and one corresponding more or less to
macro save_specials.  Quite a bit of work, but IMO well worth doing.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
