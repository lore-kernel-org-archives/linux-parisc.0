Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA16217
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Jan 2001 12:57:33 -0700
Received: from dot.at (IDENT:plattner@dot-tc01-044.dot.at [212.9.128.84])
	by dns2.dot.at (8.9.3/8.9.2) with ESMTP id VAA19346
	for <parisc-linux@thepuffingroup.com>; Mon, 22 Jan 2001 21:08:52 +0100
Sender: plattner@dns2.dot.at
Message-ID: <3A6C918B.A6287A24@dot.at>
Date: Mon, 22 Jan 2001 21:01:15 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
References: <200101221502.f0MF2kO05633@openbsd1.buttafuoco.net> <20010122151515.N3571@linuxcare.com> <3A6C7686.1FC5F754@dot.at>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] strace ??? - is there any ???
List-ID: <linux-parisc.vger.kernel.org>

I often use strace to analyse the problems I have with
applications. Espacially I had success in analysing problems
around a bash which is directly called by the kernel
by editing the kernel (init/main.c) to directly start a 
statically linked strace to start the bash.

To analyse the problem on the 720 (handler_interrupt)
I want to repeat this sucessful step, but I miss the
strace. 

Is ther any instrumented for HP PA-RISC ??

With friendly regards

	Christoph



-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
