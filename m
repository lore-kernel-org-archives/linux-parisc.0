Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id B9AB948AC
	for <parisc-linux@parisc-linux.org>; Tue, 16 Jul 2002 07:56:35 -0600 (MDT)
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] parisc -linux: Cluster tools availability?
Message-ID: <1026827735.3d3425d7c1e1d@webmail.tiscalinet.be>
Date: Tue, 16 Jul 2002 15:55:35 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@parisc-linux.org
References: <1026824527.3d34194f9be6d@webmail.tiscalinet.be> <20020716134800.GB32471@systemhalted>
In-Reply-To: <20020716134800.GB32471@systemhalted>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Quoting Carlos O'Donell <carlos@baldric.uwo.ca>:

> > Hi all,
> > I running a b180 with md and I could recover a second b180.
> > It would be nice to build a cluster 'a la MC/SG'.
> > I found well openmosix but only i386 afaik (and there is too much asm
> code for
> > me to tempt a portage).
> > There is also beowulf but the only HOWTO I found concern kernel 2.0 ?
> (more over
> > my network connection are limited (10Mb) and it does not seems to
> cover my
> > whishes (HA cluster)).
> > 
> > Any other advise?
> > Thanks a lot,
> >     Joel
> >
> 
> Linux Virtual Server Project?
> http://www.linuxvirtualserver.org/
> 
> You definately don't want MOSIX for HA. If the system that spawned
> the process dies, then so does the process. The MOSIX stubs just
> marshall data, and in most cases for simple things call directly
> to the kernel that the process has migrated towards.
> 
> I would really like to see a port of bproc to parisc :)
> (I figure on ~100 lines of assembly to get process state information).
> I spoke to Donald Becker at OLS about this, and it's on my todo
> list... might get done in September.
> 
> c.
> 
Great, I will awaiting so.

Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
