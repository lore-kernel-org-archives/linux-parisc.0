Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4F31B482B
	for <parisc-linux@parisc-linux.org>; Wed,  7 Nov 2001 05:42:04 -0700 (MST)
Date: Wed, 7 Nov 2001 13:41:36 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: Daniel Engstrom <5116@telia.com>
Cc: Matthew Wilcox <willy@debian.org>,
	<parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] EISA interrupts
In-Reply-To: <20011104004109.D2303@zaphod.halden.lillfab.se>
Message-ID: <Pine.NEB.4.33.0111071327500.9287-100000@www2.scram.de>
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

Hi Daniel,

> In order to use an ISA card you will have to specify the IRQ as edge triggerd
> on the kernel command line options  eisa_irq_edge.
> Use eisa_irq_edge=9,10 to set IRQ 9 and 10 to edge mode.

Cool stuff !

I just merged it into the current CVS version and tested it on my 720...

I *sometimes* works. Somehow, maybe every 3 boot, my token ring card
starts up OK and interrupts are generated. The rest of the cases, the card
is detected, but fails to open and no interrupt is recorded in
/proc/interrupts. Is there anything special about the 720, like an
additional register which might have a random state at bootup time?

However, when trying to send IP traffic to the adapter, Linux immediately
crashes in csum_partial(). Looks like some more work is required to fix
the token ring driver.

Cheers,
Jochen
