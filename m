Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (A630f.pppool.de [213.6.99.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D014496A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Oct 2001 09:19:42 -0600 (MDT)
Date: Thu, 4 Oct 2001 17:17:33 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sti broken in pa32 on B180
Message-ID: <20011004171733.A5324@solo.franken.de>
References: <1002191096.3bbc38f8c42ed@webmail.tiscalinet.be> <20011004071350.A27483@beavis.ybsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011004071350.A27483@beavis.ybsoft.com>; from rbradetich@uswest.net on Thu, Oct 04, 2001 at 07:13:50AM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Oct 04, 2001 at 07:13:50AM -0600, Ryan Bradetich wrote:
> On Thu, Oct 04, 2001 at 12:24:56PM +0200, joel.soete@freebel.net wrote:
> > Hi all,
> > 
> > I just come back to my hppa boxes (a 712/80 and a b180) and just co the last cvs 
> > kernel (-pa32).
> > I do usual make oldconfig; make dep ; make vmlinux (on the 712).
> 
> Try the following patch ... Thomas said this is what fixed STI on the
> B-class machines for him.  If it works, I'll commit it.

	for (i = 1; i <= num_addrs; i++) {

is what works for me without changing sticore.c.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
