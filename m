Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id B91D34837
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Jun 2002 09:10:41 -0600 (MDT)
Date: Thu, 27 Jun 2002 08:10:40 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: joel.soete@freebel.net, <grundler@dsl2.external.hp.com>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] gcc-3.2 failed to compile kernel
In-Reply-To: <200206271458.g5REw9Tr015373@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.44.0206270808500.17764-100000@garibaldi.apptechsys.com>
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

It is perfectly all right now.  Just a messed up cvs tree.  An rm -rf and 
a cvs co took care of it.

On Thu, 27 Jun 2002, John David Anglin wrote:

> > Oops,  gcc -E ... works well and give the expect results (if I do a link
> > 1->linux) but gcc -dM -E ... SegFault :((
> > 
> > # gcc -dM -E -D__ASSEMBLY__ -traditional -D__KERNEL__
> > -I/Develop/parisc-linux/src/linux/include  -c -o pacache.CPP pacache.S
> > In file included from /Develop/parisc-linux/src/linux/include/asm/assembly.h:31,
> >                  from pacache.S:44:
> > /Develop/parisc-linux/src/linux/include/asm/offset.h:3: unterminated #ifndef
> > cc1: internal compiler error: internal error: Segmentation fault
> 
> The '-c' shouldn't be there but cc1 shouldn't ICE on an unterminated #ifdef.
> Is the #ifdef actually unterminated?  Would you file a PR on this one as
> well?
> 
> I'm also seeing a problem with the preprocessor on the vax :(
> 
> Dave
> 

-- 
"Cable is not a luxury, since many areas have poor TV reception."
		-- The mayor of Tucson, Arizona, 1989
