Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2794F482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 11:29:20 -0700 (MST)
Subject: Re: [parisc-linux] Re: E55 status
From: Ryan Bradetich <ryan_bradetich@uswest.net>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <3BF71BEC.5D032CE6@gmx.at>
References: <3B4396D8.9A33414F@gmx.at> <3BF4E38C.D59603FE@esiee.fr>
	<3BF71BEC.5D032CE6@gmx.at>
Content-Type: text/plain
Date: 19 Nov 2001 11:29:15 -0700
Message-Id: <1006194555.4898.9.camel@beavis>
Mime-Version: 1.0
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

On Sat, 2001-11-17 at 19:24, Christoph Plattner wrote:
> Hi Thomas !
> 
> Here are the current status of the E55:
> 
> I have rewritten my whole stuff on the current CVS snapshot from the end
> of this week (2.4.14-pa6).

Dang, you have been busy!  Nice work!

> (1) TTY driver for the PDC console, used in polling mode (30ms) as
> device
> 	/dev/ttyB0:
> 	- only tested via serial line !
> 	- is configured together with CONFIG_SERIAL_CONSOLE, if ARCH is
> 		parisc (XXX: TODO a config via menu for PDC CONSOLE DRIVER)
> 	- a node (/dev/ttyB0 c 30 0) must be created
> 	- /etc/inittab should have a login on /dev/ttyB0
> 	- the kernel line parameter `console=ttyB0' must be set
> 
> 	Driver works for complete Linux stuff, including `login' and editing
> 	on the `bash'.

I am very interested in this patch.  I am currently working on the
K-Class machines, and I have the same problem you did, where you have a
MUX instead of a inturrupt driven console port.  With this patch, I
think I could get K-Class to install from the upcoming 0.9.3 iso image
:) Are you planning on committing soon? Or could I get a patch from you?

> (2) LED support for the "RUN" and "ATTENTION" LED (cuppled to the
> heartbeat of
> 	700er machines. If the heartbeart is active, E55 shows "RUN", otherwise
> 	the machine indicates "ATTENTION"). So the status can be influenced
> 	by the `/proc/pdc/led' entry.
> 	This LED driver is activated by the model name "9000/856" (E55), so
> 	for further machines of similar types, the model names have to be
> 	added.
> 
> In general, the CONFIG stuff has to be adapted. On that stuff, my
> experience 
> is not that what other LINUX hacker's expect ...
> 
> Further, is there a developer ChangeLog file to do entries per file ?
> 
> So the E55 server can be booted diskless by BOOTP(DHCP)/TFTP and boots
> up. Ethernet is full functioning, the console works on port 0 of the
> 8-port multiplexer. No SCSI controller is deteced, not the parallel
> interface,
> and the mulitplexer board. For these three componets, drivers are
> needed,
> and the DOCUMENTATION !!!

I assume you are refering to the HP-PB bus cards.  We should probably
coordinate our efforts on this since I plan on cutting my teeth at
driver writing on some of these cards.

Nice to see all the hardwork you have done!  Good Job.

-  Ryan


> I hope, parts of my stuff (or all plus improvments concerning
> configuration)
> will come into the kernel main stream to have this "start" of E55 server
> in the kernel.
> 
> I will add my current CVS diffings of my extensions very soon, at the
> moment
> the CVS server seems to be down ! (Please contact me, if you have
> interest !)
> 
> With friendly regards
> Christoph P.
> 
> 
> 
> Thomas Marteau wrote:
> > 
> > Hi Christoph,
> > 
> >         I am updating our list of working hardware. Could you tell me if you
> > know something about the status of PA/Linux on E55?
> > 
> > Thanks for your answer, Thomas.
> > ESIEE Team
> 
> -- 
> -------------------------------------------------------
> private:	christoph.plattner@gmx.at
> company:	christoph.plattner@alcatel.at
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
