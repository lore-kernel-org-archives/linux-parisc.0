Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 76E024837
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 Jul 2003 10:02:35 -0600 (MDT)
Date: Thu, 17 Jul 2003 09:05:52 -0700
From: Randolph Chung <tausq@debian.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: Joel Soete <jsoe0708@tiscali.be>,
	Carlos O'Donell <carlos@baldric.uwo.ca>,
	PARISC list <parisc-linux@lists.parisc-linux.org>,
	Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] 2.6.0-test1-pa1, fails, to, boot, on, rp2430
Message-ID: <20030717160551.GP30257@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030717001528.GA20610@systemhalted> <3F0BEA8300002113@ocpmta1.freegates.net> <20030717155203.GO30257@tausq.org> <1058457224.2646.60.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1058457224.2646.60.camel@mulgrave>
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

> > looks like a userspace address....
> 
> Actually, I think it's an address in a module.  If it were from
> userspace, it would have the bottom two bits set.
> 
> Unfortunately, I don't seem to have the email you're replying to, so I
> can't tell if that's true or not.  If we could get the 64 bit compile to
> do kallsyms, that would tell you definitively.

you can't really do that here because he's getting the address from TOC
output from PDC...

but to rule this out, joel, can you recompile your kernel without
modules (everything builtin) and see what happens?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
