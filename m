Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.snowman.net (ns.snowman.net [63.80.4.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 890054832
	for <parisc-linux@lists.parisc-linux.org>; Sun,  6 Jan 2002 17:05:33 -0700 (MST)
Date: Sun, 6 Jan 2002 19:04:38 -0500 (EST)
From: <nick@snowman.net>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Christian Suder <csuder@cisco.com>, sven.cronenberg@web.de,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PALinux on HP9000/735-125
In-Reply-To: <20020106232908.B19425@solo.franken.de>
Message-ID: <Pine.LNX.4.21.0201061903240.9630-100000@ns>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Just as a mostly offtopic note you may well be able to get some help with
this (or loan out some help) to the mips port.  Some SGI systems (SGI I2
comes to mind) have EISA slots, and I suspect suffer from the same
problem, it's also possible that SGI has come up with a workaround for it,
so you'd have to get in touch with someone in the know.
	Nick

On Sun, 6 Jan 2002, Thomas Bogendoerfer wrote:

> On Sun, Jan 06, 2002 at 01:34:32PM -0800, Christian Suder wrote:
> > I think it should work to boot HPUX, get the correct EISA .cfg file and
> > use the eisa_config utility. The configuration is actually stored in an
> 
> but that's not enough. I did that and setup the card with HPUX, but it's
> still unconfigured, when Linux finds it. The .cfg describes how to
> configure the different card parameters, eisa_config puts the selected
> params to a nvram, and some other part does the real card poking
> during kernel startup. Other platforms have that card poking stuff
> included into the firmware.
> 
> It isn't a big deal to do the card setup itself, because .cfg includes
> everything needed. It's more a problem of getting that information
> during the kernel startup. If we know the nvram setup and how stuff
> gets put there, we could read that and do the card setup from within
> the Linux kernel. But I haven't found anything about that, yet.
> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessary a
> good idea.                                 [ Alexander Viro on linux-kernel ]
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
