Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 99B3D482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Dec 2001 09:04:54 -0700 (MST)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1008173091.3c178024025f9@webmail.tiscalinet.be>
Date: Wed, 12 Dec 2001 17:04:52 +0100 (CET)
From: joel.soete@freebel.net
Cc: Matthew Wilcox <willy@debian.org>
References: <1002553729.3bc1c18187924@webmail.tiscalinet.be> <20011008162234.D28880@parcelfarce.linux.theplanet.co.uk> <1002556397.3bc1cbed99e0b@webmail.tiscalinet.be> <20011008173620.I3745@parcelfarce.linux.theplanet.co.uk> <1002618541.3bc2bead27af0@webmail.tiscalinet.be>
In-Reply-To: <1002618541.3bc2bead27af0@webmail.tiscalinet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] LVM-1.0.1 with kernel 2.4.16-pa16 (was: LVM 1.0.1-rc4 on hppa)
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

Hi all,

Just for information that this release compiles (now with -O0) fine with kernel
2.4.16-pa16 and also seems to works fine (at least on my b180.

Joel


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
> 
> Thanks again for help,
>         joel



-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
