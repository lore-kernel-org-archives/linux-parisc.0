Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 20E5F482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Apr 2002 10:14:27 -0600 (MDT)
Message-Id: <200204121614.g3CGENMn003726@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] GCC support for dwarf2
To: joel.soete@freebel.net
Date: Fri, 12 Apr 2002 12:14:23 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <1018612168.3cb6c9c8a9afc@webmail.tiscalinet.be> from "joel.soete@freebel.net" at Apr 12, 2002 01:49:28 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Here is the script that I use to build glibc.  This installs to the same
prefix that I use for gcc and binutils.

#!/bin/sh
# /bin/sh must be bash!
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games:/home/dave/opt/
gnu/bin
unset LD_RUN_PATH
unset LD_LIBRARY_PATH
export CC=/home/dave/opt/gnu/bin/gcc
export CFLAGS="-O2 -g"
../glibc/configure --build=hppa-linux --host=hppa-linux --target=hppa-linux --pr
efix=/home/dave/opt/gnu --disable-profile --without-cvs --enable-add-ons --enabl
e-hacker-mode &&
make &&
make install

I tried to ensure that I am using the system tools for the build and install
except for the compiler which I specify with CC.  The compiler was built with
--with-gnu-as and --with-gnu-ld, so it knows where to find its tools
independent of the PATH setting.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
