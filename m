Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id DE7244838
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Jun 2002 12:26:03 -0600 (MDT)
To: Jeremy Drake <jeremyd@apptechsys.com>
Subject: Re: [parisc-linux] gcc-3.2 failed to compile kernel
Message-ID: <1025201506.3d1b5563048ad@webmail.tiscalinet.be>
Date: Thu, 27 Jun 2002 20:11:47 +0200 (CEST)
From: joel.soete@freebel.net
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	joel.soete@freebel.net, grundler@dsl2.external.hp.com,
	parisc-linux@lists.parisc-linux.org
References: <Pine.LNX.4.44.0206270808500.17764-100000@garibaldi.apptechsys.com>
In-Reply-To: <Pine.LNX.4.44.0206270808500.17764-100000@garibaldi.apptechsys.com>
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

This answer concern well your CVS Kernel?

Nice so :)

Joel

Quoting Jeremy Drake <jeremyd@apptechsys.com>:

> It is perfectly all right now.  Just a messed up cvs tree.  An rm -rf
> and 
> a cvs co took care of it.
> 
> On Thu, 27 Jun 2002, John David Anglin wrote:
> 
> > > Oops,  gcc -E ... works well and give the expect results (if I do a
> link
> > > 1->linux) but gcc -dM -E ... SegFault :((
> > > 
> > > # gcc -dM -E -D__ASSEMBLY__ -traditional -D__KERNEL__
> > > -I/Develop/parisc-linux/src/linux/include  -c -o pacache.CPP
> pacache.S
> > > In file included from
> /Develop/parisc-linux/src/linux/include/asm/assembly.h:31,
> > >                  from pacache.S:44:
> > > /Develop/parisc-linux/src/linux/include/asm/offset.h:3: unterminated
> #ifndef
> > > cc1: internal compiler error: internal error: Segmentation fault
> > 
> > The '-c' shouldn't be there but cc1 shouldn't ICE on an unterminated
> #ifdef.
> > Is the #ifdef actually unterminated?  Would you file a PR on this one
> as
> > well?
> > 
> > I'm also seeing a problem with the preprocessor on the vax :(
> > 
> > Dave
> > 
> 
> -- 
> "Cable is not a luxury, since many areas have poor TV reception."
> 		-- The mayor of Tucson, Arizona, 1989
> 
> 
> 


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
