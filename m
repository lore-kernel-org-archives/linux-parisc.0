Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A62D482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Apr 2002 00:32:02 -0600 (MDT)
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] GCC support for dwarf2
Message-ID: <1018852256.3cba73a0993ad@webmail.tiscalinet.be>
Date: Mon, 15 Apr 2002 08:30:56 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <200204111531.g3BFV5Fv000173@hiauly1.hia.nrc.ca> <1018542948.3cb5bb6a4053a@webmail.tiscalinet.be> <1018612168.3cb6c9c8a9afc@webmail.tiscalinet.be> <20020412174440.A5919@systemhalted>
In-Reply-To: <20020412174440.A5919@systemhalted>
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

Quoting "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>:

> > Hi Dave,
> > 
> > Here am I with something confusing me about glibc building.
> > 
> > In the Carlos O'Donell recipe
> > (http://www.parisc-linux.org/toolchain/PA-Linux-XC-HOWTO-04.html)
> > 
> > It is set "export PATH=$PATH:$DEST/bin"
> > So at configure step it was selected gcc-3.0.4 (the last release for
> hppa-linux box)
> > 
> > Naturally if I put "export PATH=$DEST/bin:$PATH", the configure of
> glibc select
> > (for me well) gcc-3.2.
> > 
> > What is the right way? (for me the second)
> > 
> > Thanks for more help,
> >     Joel
> >
> 
> The document describes building a cross-compiler for non-hppa->hppa. 
> Where gcc would be prefaced with 'hppa-linux' and might be
> the only such executable on the system. Obviously if you have multiple
> toolchains on your path the order should be '$DEST/bin:$PATH'.

Ok it is clear.

> 
> Happily this document also serves as a 'build the toolchain' document
> :)
> 
> I'll update that bit, make some spelling mistakes and email Grant.
> 

I just also notice that the glibc release is now 2.2.5 which is extracted as
glibc-2.2.5.orig (so just after "Now onto glibc:" 
    cd glibc-2.2.4
would be:
    cd glibc-2.2.5.orig)

    
Thanks for your attention and your great job,
    Joel

-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
