Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6F1754845
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Apr 2003 10:47:24 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 195Tac-0006sS-2g; Tue, 15 Apr 2003 17:47:22 +0100
Date: Tue, 15 Apr 2003 17:47:22 +0100
From: Matthew Wilcox <willy@debian.org>
To: Randolph Chung <randolph@tausq.org>
Cc: Joel Soete <jsoe0708@tiscali.be>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>,
	Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] parisc-linux.org kernel
Message-ID: <20030415164722.GF30643@parcelfarce.linux.theplanet.co.uk>
References: <1050320386.25353.11.camel@dhcp22.swansea.linux.org.uk> <3E9BA3670000071C@ocpmta1.freegates.net> <20030415164139.GJ25257@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030415164139.GJ25257@tausq.org>
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

On Tue, Apr 15, 2003 at 09:41:39AM -0700, Randolph Chung wrote:
> > By the way, in drivers/char/serial.c, also related to 'superio', i noticed:
> > 
> > #ifdef CONFIG_SUPERIO
> >     superio_serial_init();
> > #endif
> 
> this probably should not go upstream.. it's a hack so we can get early
> console (and is stlil broken on 2.5 :-( )

agreed.  the drivers/ stuff is much less interesting than getting
arch/parisc and include/asm-parisc more uptodate in marcelo's tree.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
