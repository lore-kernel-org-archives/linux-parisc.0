Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id F0DF9482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Apr 2002 05:50:14 -0600 (MDT)
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] GCC support for dwarf2
Message-ID: <1018612168.3cb6c9c8a9afc@webmail.tiscalinet.be>
Date: Fri, 12 Apr 2002 13:49:28 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <200204111531.g3BFV5Fv000173@hiauly1.hia.nrc.ca> <1018542948.3cb5bb6a4053a@webmail.tiscalinet.be>
In-Reply-To: <1018542948.3cb5bb6a4053a@webmail.tiscalinet.be>
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

Hi Dave,

Here am I with something confusing me about glibc building.

In the Carlos O'Donell recipe
(http://www.parisc-linux.org/toolchain/PA-Linux-XC-HOWTO-04.html)

It is set "export PATH=$PATH:$DEST/bin"
So at configure step it was selected gcc-3.0.4 (the last release for hppa-linux box)

Naturally if I put "export PATH=$DEST/bin:$PATH", the configure of glibc select
(for me well) gcc-3.2.

What is the right way? (for me the second)

Thanks for more help,
    Joel

Quoting joel.soete@freebel.net:

> Quoting John David Anglin <dave@hiauly1.hia.nrc.ca>:
> 
> > > Well I finished to co gcc-3.2 and gcc3.1 cvs (that is long with
> small
> > 33800 baud
> > > modem but that all I can get for cvs)
> > > 
> > > And I am already back with a problem:
> > > 
> > > Quoting John David Anglin <dave@hiauly1.hia.nrc.ca>:
> > > 
> > > > You would need to install the cvs binutils and cvs gcc versions
> in
> > some
> > > > convenient location for the testing. 
> > > 
> > > Well I just figure out that there is no configure file in cvs of
> > binutils.
> > 
> > Remove "configure" and do another checkout.  Use checkout rather than
> > update since sometimes update has problems in the toplevel directory.
> 
> I just do another co and effectively configure is there now?
> (I also notice the problem of update :_( )
> 
> > 
> > > So, in the sources directory (/GNU-Dev/parisc-linux/src/binutils) I
> > try autoconf
> > > but it just creates an empty configure?
> > > What do I wrong?
> > 
> > There are two types of "configure" files.  The toplevel configure
> > script
> > in binutils (and also gcc) are currently manually maintained.  The
> > binutils "configure" file isn't autoconf generated.
> 
> Ok.
> 
> Dave thanks a lot for info,
>     Joel
> 
> -------------------------------------------------
> This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
> 
> 


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
