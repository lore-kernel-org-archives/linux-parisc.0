Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA02186
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 Jan 2001 16:17:31 -0700
Sender: plattner@dns2.dot.at
Message-ID: <3A6E11F0.F87DC2E1@dot.at>
Date: Wed, 24 Jan 2001 00:21:20 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
CC: christoph.plattner@alcatel.at
References: <200101232308.SAA05005@hiauly1.hia.nrc.ca>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Step by step .... 9000/720 and interruption (trap) 18
List-ID: <linux-parisc.vger.kernel.org>

Hallo PA RISC hackers !

I mentioned before, that I have problems using my Apollo 700 (9000/720)
with the Linux here. I build a new cross tool chain and a new
kernel + palo (all from 13.Jan 2001) but I always have the problem of
looping error code:

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




-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
