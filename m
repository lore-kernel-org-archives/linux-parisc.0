Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA06455
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 01:11:20 -0700
Received: from alcatel.at (atusel33.aut.alcatel.at [146.112.129.215])
	by  mail.alcatel.at (8.9.3/8.9.3/1.20 01/12/01 22:50:08) with ESMTP id JAA11408
	for <parisc-linux@thepuffingroup.com>; Wed, 24 Jan 2001 09:14:50 +0100 (MET)
Sender: christoph.plattner@alcatel.at
Message-ID: <3A6E8EFA.8D04A5F@alcatel.at>
Date: Wed, 24 Jan 2001 09:14:50 +0100
From: Christoph Plattner <christoph.plattner@alcatel.at>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] One more step: Interruption (trap) 18 on 9000/720
List-ID: <linux-parisc.vger.kernel.org>

Hallo PA RISC hackers !

I mentioned before, that I have problems using my Apollo 700 (9000/720)
with the Linux here. I build a new cross tool chain and a new
kernel + palo (all from 13.Jan 2001) but I always have the problem
of that always repeated error:

handler_interruption() pid=1 command='init'

or whatever my first process is. I have instrumented the kernel code
and added the output of the code number (a good idea to have this
fix in the kernel !) and I saw:

        code=18

So I have the code 18 (decimal). In the PA RISC 1.1 manual (your link)
I saw following description:

        18  Data memory protection trap / Unaligned data reference trap

So what does this mean here. An alignment problem ?
Why is this code not handled in the switch/case ?

I always use (I think the 32bit code). Have I set to a parisc64 ?
How can I influence this ?
Which kind of CPU is this in the 720 model ? (I know a 50MHz PA RISC ..)

I hope anybody can help here

        Christoph




-------------------------------------------------------------------
private:        christoph.plattner@dot.at
company:        christoph.plattner@alcatel.at
