Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep15-int.chello.at (viefep15-int.chello.at [213.46.255.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id 02D41482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Jun 2002 14:41:47 -0600 (MDT)
Message-ID: <3CFE7787.796C7F33@gmx.at>
Date: Wed, 05 Jun 2002 22:41:43 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Damian Boune <dboune@marmot.com>
Cc: Stan Sieler <sieler@allegro.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: E55 Kernel Support and question for Christoph  (used to be RE:
 [parisc-linux] Greetings!)
References: <7FD5D52DC7BFB94A867A01CE23C2C3B2021DC8@echelon.mml.marmot.com>
Content-Type: text/plain; charset=us-ascii
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hello, welcome to the PA-RISC hacker group

(I hope you are a new hacker ....)


We E55 users have to work and fight very hard !!!
We cannot accept to read a sentence like `not supported' !!!

Ok, let us come to the facts.
The E55 is a nice server, but it includes many proprietary parts.
These are the I/O bus system, and the following devices:
	MUX 8/16-way serial interface (also affected is the serial
					console)
	Parallel port (not so important in the first run)
	Complete SCSI system

The CPU (core systemw with RAM/Cache) and the ethernet is working
well and quite with a good performace.

It was very important for me to boot this machine. The image booting
via ethernet (BOOTP/TFTP) works very well. The first step was to get
an running console (serial).

For this I started with a hack, using the ROM PDC console via a
polling driver, and so I could start the machine June 2001.

End of 2001 I rewrote this driver as clean one, and Ryan added the
config stuff. So you can use the default linux PA-RISC kernel to
boot the E55 as "diskless server" via NFS-ROOT and a serial ROM
console.

What to do:
-----------

Checkout a kernel, and enable the PDC ROM console in the "Character
Devices" under the "Non-standard serial support". Further follow the
<HELP> instructions for this driver (Creating a /dev/ttyB0, and use
this device as login device).

With this driver we have a chance to do further development on the
device driver programming. I am waiting on documentation to help
developing drivers, but I have to wait.

HELLO ot the others. What is the status on the docu or drivers ?

Good luck in starting up the E55 (it is quite straignt and no real
hacks or patches are needed !).

Christoph P.


Damian Boune wrote:
> 
> > From what I recall, the HP 9000/E55 (and the other Ex5 models) is
> > not supported by Linux, and it won't run.
> 
> Yes, this is the general case AFAIK, other than the below.
> 
> > OTOH, IIRC, Christoph Plattner did manage to get some form of Linux
> running on it,
> > possibly by making major changes to the I/O system...
> >
> http://lists.parisc-linux.org/pipermail/parisc-linux/2001-November/01461
> 5.html
> 
> I reviewed this message during my initial research, and this seems to
> point to what I need to get started. I'll have to dig around CVS and see
> what I can find.
> 
> Christoph, is there anything specific I should look at? Have you had any
> further trials?
> 
> Many Thanks!!!
> Damian Boune
> Marmot Mountain Ltd.
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
