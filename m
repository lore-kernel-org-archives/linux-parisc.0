Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0159D483C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Jun 2002 08:27:29 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] gcc-3.2 failed to compile kernel
Message-ID: <1025274437.3d1c7245c4a8c@webmail.tiscalinet.be>
Date: Fri, 28 Jun 2002 16:27:17 +0200 (CEST)
From: joel.soete@freebel.net
Cc: Jeremy Drake <jeremyd@apptechsys.com>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	grundler@dsl2.external.hp.com, INVALID_ADDRESS@.SYNTAX-ERROR
References: <Pine.LNX.4.44.0206270808500.17764-100000@garibaldi.apptechsys.com> <1025201506.3d1b5563048ad@webmail.tiscalinet.be>
In-Reply-To: <1025201506.3d1b5563048ad@webmail.tiscalinet.be>
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

Hi,

Neil seems to have fixed this problem but another one appears at the same place.

Here is the continue of story:

Quoting neil@gcc.gnu.org:

> Synopsis: gcc-3.2 failed to compile kernel
> > State-Changed-From-To: analyzed->closed
> State-Changed-By: neil
> State-Changed-When: Thu Jun 27 23:31:44 2002
> State-Changed-Why:
> Fixed.  Please let me know if it doesn't work for you (unlikely).
> >
http://gcc.gnu.org/cgi-bin/gnatsweb.pl?cmd=view%20audit-trail&database=gcc&pr=7138
> > Hi Neil,

This seems to be fixed but (just for info) another problem at the same place:

gcc -D__KERNEL__ -I/Develop/parisc-linux/src/linux-2.4.18-pa40/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing
-fno-common -D__linux__ -pipe -fno-strength-reduce -mno-space-regs
-mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=1.1
-mschedule=7100   -DKBUILD_BASENAME=cache  -c -o cache.o cache.c
gcc -D__ASSEMBLY__ -traditional -D__KERNEL__
-I/Develop/parisc-linux/src/linux-2.4.18-pa40/include  -c -o pacache.o pacache.S
/Develop/parisc-linux/src/linux-2.4.18-pa40/include/asm/pgtable.h: Assembler
messages:
/Develop/parisc-linux/src/linux-2.4.18-pa40/include/asm/pgtable.h:45: Fatal
error: Unknown opcode: `printk("%s:%d: bad pte %08lx.\n",
"/Develop/parisc-linux/src/linux-2.4.18-pa40/include/asm/pgtable.h",45,pte_val(e))'
make[1]: *** [pacache.o] Error 1
make[1]: Leaving directory
`/Develop/parisc-linux/src/linux-2.4.18-pa40/arch/parisc/kernel'
make: *** [_dir_arch/parisc/kernel] Error 2


But that will be another story (next 2 weeks i will be on hollidays :))

Many thanks Neil for your attention,
    Joel


Quoting joel.soete@freebel.net:

> This answer concern well your CVS Kernel?
> 
> Nice so :)
> 
> Joel
> 
> Quoting Jeremy Drake <jeremyd@apptechsys.com>:
> 
> > It is perfectly all right now.  Just a messed up cvs tree.  An rm -rf
> > and 
> > a cvs co took care of it.
> > 
> > On Thu, 27 Jun 2002, John David Anglin wrote:
> > 
> > > > Oops,  gcc -E ... works well and give the expect results (if I do
> a
> > link
> > > > 1->linux) but gcc -dM -E ... SegFault :((
> > > > 
> > > > # gcc -dM -E -D__ASSEMBLY__ -traditional -D__KERNEL__
> > > > -I/Develop/parisc-linux/src/linux/include  -c -o pacache.CPP
> > pacache.S
> > > > In file included from
> > /Develop/parisc-linux/src/linux/include/asm/assembly.h:31,
> > > >                  from pacache.S:44:
> > > > /Develop/parisc-linux/src/linux/include/asm/offset.h:3:
> unterminated
> > #ifndef
> > > > cc1: internal compiler error: internal error: Segmentation fault
> > > 
> > > The '-c' shouldn't be there but cc1 shouldn't ICE on an
> unterminated
> > #ifdef.
> > > Is the #ifdef actually unterminated?  Would you file a PR on this
> one
> > as
> > > well?
> > > 
> > > I'm also seeing a problem with the preprocessor on the vax :(
> > > 
> > > Dave
> > > 
> > 
> > -- 
> > "Cable is not a luxury, since many areas have poor TV reception."
> > 		-- The mayor of Tucson, Arizona, 1989
> > 
> > 
> > 
> 
> 
> -------------------------------------------------
> This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
