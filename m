Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF58A482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Apr 2002 10:38:43 -0600 (MDT)
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] GCC support for dwarf2
Message-ID: <1018629476.3cb70d64cc27e@webmail.tiscalinet.be>
Date: Fri, 12 Apr 2002 18:37:56 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <200204121614.g3CGENMn003726@hiauly1.hia.nrc.ca>
In-Reply-To: <200204121614.g3CGENMn003726@hiauly1.hia.nrc.ca>
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

Dave,

It confirms my first idea. (I also just find back:
http://mkhppa1.esiee.fr/archive/script_toolchain).

Thanks a lot,
    Joel

PS: I will send a mail to Carlos to report him this small bug and some update

Quoting John David Anglin <dave@hiauly1.hia.nrc.ca>:

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
> 
> Here is the script that I use to build glibc.  This installs to the
> same
> prefix that I use for gcc and binutils.
> 
> #!/bin/sh
> # /bin/sh must be bash!
> export
> PATH=/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games:/home/dave/opt/
> gnu/bin
> unset LD_RUN_PATH
> unset LD_LIBRARY_PATH
> export CC=/home/dave/opt/gnu/bin/gcc
> export CFLAGS="-O2 -g"
> ../glibc/configure --build=hppa-linux --host=hppa-linux
> --target=hppa-linux --pr
> efix=/home/dave/opt/gnu --disable-profile --without-cvs --enable-add-ons
> --enabl
> e-hacker-mode &&
> make &&
> make install
> 
> I tried to ensure that I am using the system tools for the build and
> install
> except for the compiler which I specify with CC.  The compiler was built
> with
> --with-gnu-as and --with-gnu-ld, so it knows where to find its tools
> independent of the PATH setting.
> 
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc.ca
> National Research Council of Canada              (613) 990-0752 (FAX:
> 952-6605)
> 
> 


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
