Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id CFA5D482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 30 Oct 2001 13:19:09 -0700 (MST)
Message-Id: <200110302014.NAA15070@puffin.external.hp.com>
To: joel.soete@freebel.net
Cc: aungho <aungho@sina.com>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] RE: RE: about linux for PA_RISC 
In-Reply-To: Message from joel.soete@freebel.net
   of "Tue, 30 Oct 2001 09:44:29 +0100." <1004431469.3bde686db73fb@webmail.tiscalinet.be>
Date: Tue, 30 Oct 2001 13:14:47 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

joel.soete@freebel.net wrote:
> Quoting aungho <aungho@sina.com>:
> > But other problems:
> 
> > 1.can HP_UX 11.11 for pa_risc 2.0 on L2000 gcc complier,we find gcc for
> > HP_ux 11.00 for pa_risc 1.x and HP_UX 10.0 and they work normally,how to
> > get  gcc complier for hp_ux 11.11.

I'm pretty sure you can use the same toolchain as on 11.00.
HP has released a CD (and ISO image) with PA20 gcc/binutils
toolchain for HPUX 11. The one I have in front of me is labeled:
	"HP-UX 11.0 PA-RISC Open Source Developer Toolkit, Release 000310"

I think I found it's replacement on www.software.hp.com at:
http://www.software.hp.com/cgi-bin/swdepot_parser.cgi/cgi/displayProductInfo.pl?productNumber=B9891AA


> > 2.Linux for pa_risc is only a test version.
> 
> You have right. But it seems quiet stable now.

I agree the kernel is stable but:
o not everything on every platform works
o most older servers still not support at all (eg EFGHI/K/T/V-class)
o toolchain and kernel changes aren't fully merged upstream.

It's definitely not a "mature product". But lots of cool
things (eg XF86, iptables, apache, tcpdump, apt-get) do work
on many parisc boxes.

grant
