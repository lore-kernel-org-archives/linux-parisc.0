Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spoolm2.tiscalinet.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id EBFBC48BD
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Oct 2001 02:26:47 -0600 (MDT)
Sender: jso@dsl2.external.hp.com
Message-ID: <3BC5592A.A34A2AB5@freebel.net>
Date: Thu, 11 Oct 2001 08:32:42 +0000
From: Soete Joel <joel.soete@freebel.net>
MIME-Version: 1.0
To: joel.soete@freebel.net, Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
References: <1002553729.3bc1c18187924@webmail.tiscalinet.be> <20011008162234.D28880@parcelfarce.linux.theplanet.co.uk> <1002556397.3bc1cbed99e0b@webmail.tiscalinet.be> <20011008173620.I3745@parcelfarce.linux.theplanet.co.uk> <1002618541.3bc2bead27af0@webmail.tiscalinet.be> <1002636400.3bc30470260b3@webmail.tiscalinet.be>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: LVM 1.0.1-rc4 on hppa
List-ID: <linux-parisc.vger.kernel.org>

I also try to work with gdb and efence but it does not seems to work:
I re-link LVM (with -O2) tools with libefence then launch gdb.
At gdb prompt I type in "set environment LD_PRELOAD=libefence.so.0.0"
then "run".
But the message of the load of efence does not appears?
And run failled on Segmentation fault without any diagnostic of efence.
I think it is not the right way to work: if in command line I do "export
LD_PRELOAD=libefence.so.0.0" then launch "mkdir toto" the message of
efence load appears well?

Does it exist some where some HOWTO explaining the actual way to use
efence?

Joel


joel.soete@freebel.net wrote:
> 
> Quoting joel.soete@freebel.net:
> 
> > Quoting Matthew Wilcox <willy@debian.org>:
> >
> > > On Mon, Oct 08, 2001 at 06:39:17PM +0200,
> > hgrothe@mathematik.tu-darmstadt.de
> > wrote:
> > > > I guess :-) that you compiled the lvm-tools with optimization. Since
> >
> > > > there seems to be a general problem with the lvm-tools and gcc3
> > (appears
> > > > also on other architectures (see lvm mailing list)) recompile the
> > > > lvm-tools without optimisation or "weak" optimisation (-O0).
> >
> > The all LVM-HOWTO test seems to works fine if change -O2 to -O0 into
> > make.tmpl.
> >
> > > -O0 is no optimisation, -O1 is weak optimisation and -O2 is most
> > > optimisations.  This is normally a bug in the code, not the
> > compiler...
> >
> > I thinks so too.
> > I will try now to recompile with -O2 and -ggdb to try to have a better
> > idea.
> 
> ddd (as well gdb) failed on message:
> 0x4015dc88 in mocount () from /lib/libc.so.6
> 
> into call lvm_dont_interrupt (0);
> 
> which is a "simple loop on s" calling 'signal(s,SIG_IGN)' if s is not SIGKILL.
> 
> What could be broken?
> 
> Thanks again for help,
>         joel
> 
> -------------------------------------------------
> This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
