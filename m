Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA14195
	for <parisc-linux@puffin.external.hp.com>; Wed, 8 Dec 1999 22:03:11 -0700
Date: Thu, 9 Dec 1999 06:03:38 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: frowand@cup.hp.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] bad news, good news, unkown (Temp CR used as permanent storage)
Message-Id: <19991209060338.F21512@mathe.stud.uni-erlangen.de>
References: <199912032052.MAA02894@xsvr4.cup.hp.com> <19991204212623.B19280@mathe.stud.uni-erlangen.de> <384C0585.9F444390@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <384C0585.9F444390@hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> However, there is a chance that existing PDC does not modify the
> Temporary Control Registers, based on conversations with some
> relevent engineers, and some theorizing.
>
> (Of course, the obvious exception is that the Temporary Control
> Registers are undefined when the kernel's HPMC handler is called.)

In this context I interpreted the last paragraph as saying that even if
firmware is nice and doesn't modify the temporary registers during PDC
calls, there is no chance whatsoever that the temporary registers contain
useful values after every HPMC on a certain firmware implementation.
(Now I don't see how HPMC's are an exception to the more general rule
that some firmware implementations might preserve the temporary registers).

> Ahhh, obvious if one had read the comments at the beginning of the basic
> hpmc handler that I submitted.
> Or read p. 1-16 of pdce.pdf, "PA-RISC 2.0
> Formware Architecture Reference Specification: Processor Dependent Code
> (PDC) Procedures (Part 2/2)" at
> http://thepuffingroup.com/parisc/documentation.html

Which contradict each other wrt the PSW W and E bits (E isn't going to
concern us but W might), btw.

	Philipp Rumpf
