Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C995482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Apr 2002 15:43:36 -0600 (MDT)
Date: Fri, 12 Apr 2002 17:44:40 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] GCC support for dwarf2
Message-ID: <20020412174440.A5919@systemhalted>
References: <200204111531.g3BFV5Fv000173@hiauly1.hia.nrc.ca> <1018542948.3cb5bb6a4053a@webmail.tiscalinet.be> <1018612168.3cb6c9c8a9afc@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1018612168.3cb6c9c8a9afc@webmail.tiscalinet.be>; from joel.soete@freebel.net on Fri, Apr 12, 2002 at 01:49:28PM +0200
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

> Hi Dave,
> 
> Here am I with something confusing me about glibc building.
> 
> In the Carlos O'Donell recipe
> (http://www.parisc-linux.org/toolchain/PA-Linux-XC-HOWTO-04.html)
> 
> It is set "export PATH=$PATH:$DEST/bin"
> So at configure step it was selected gcc-3.0.4 (the last release for hppa-linux box)
> 
> Naturally if I put "export PATH=$DEST/bin:$PATH", the configure of glibc select
> (for me well) gcc-3.2.
> 
> What is the right way? (for me the second)
> 
> Thanks for more help,
>     Joel
>

The document describes building a cross-compiler for non-hppa->hppa. 
Where gcc would be prefaced with 'hppa-linux' and might be
the only such executable on the system. Obviously if you have multiple
toolchains on your path the order should be '$DEST/bin:$PATH'.

Happily this document also serves as a 'build the toolchain' document :)

I'll update that bit, make some spelling mistakes and email Grant.

Thank Joel!

Cheers,
Carlos.
