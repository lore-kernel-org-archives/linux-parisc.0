Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id C39104846
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Oct 2001 08:06:44 -0600 (MDT)
To: joel.soete@freebel.net
Message-ID: <1002636400.3bc30470260b3@webmail.tiscalinet.be>
Date: Tue, 09 Oct 2001 16:06:40 +0200 (CEST)
From: joel.soete@freebel.net
Cc: Matthew Wilcox <willy@debian.org>, joel.soete@freebel.net,
	Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
References: <1002553729.3bc1c18187924@webmail.tiscalinet.be> <20011008162234.D28880@parcelfarce.linux.theplanet.co.uk> <1002556397.3bc1cbed99e0b@webmail.tiscalinet.be> <20011008173620.I3745@parcelfarce.linux.theplanet.co.uk> <1002618541.3bc2bead27af0@webmail.tiscalinet.be>
In-Reply-To: <1002618541.3bc2bead27af0@webmail.tiscalinet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] Re: LVM 1.0.1-rc4 on hppa
List-ID: <linux-parisc.vger.kernel.org>

Quoting joel.soete@freebel.net:

> Quoting Matthew Wilcox <willy@debian.org>:
> 
> > On Mon, Oct 08, 2001 at 06:39:17PM +0200,
> hgrothe@mathematik.tu-darmstadt.de 
> wrote:
> > > I guess :-) that you compiled the lvm-tools with optimization. Since
> 
> > > there seems to be a general problem with the lvm-tools and gcc3
> (appears 
> > > also on other architectures (see lvm mailing list)) recompile the 
> > > lvm-tools without optimisation or "weak" optimisation (-O0).
> 
> The all LVM-HOWTO test seems to works fine if change -O2 to -O0 into
> make.tmpl.
> 
> > -O0 is no optimisation, -O1 is weak optimisation and -O2 is most
> > optimisations.  This is normally a bug in the code, not the
> compiler...
> 
> I thinks so too.
> I will try now to recompile with -O2 and -ggdb to try to have a better
> idea.

ddd (as well gdb) failed on message:
0x4015dc88 in mocount () from /lib/libc.so.6

into call lvm_dont_interrupt (0);

which is a "simple loop on s" calling 'signal(s,SIG_IGN)' if s is not SIGKILL.

What could be broken?


Thanks again for help,
        joel


-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
