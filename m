Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9B5F048A5
	for <parisc-linux@parisc-linux.org>; Tue, 16 Jul 2002 10:39:17 -0600 (MDT)
To: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] gcc-3.2 bootstrap?
Message-ID: <1026837553.3d344c317f66f@webmail.tiscalinet.be>
Date: Tue, 16 Jul 2002 18:39:13 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@parisc-linux.org
References: <1026831840.3d3435e0d908a@webmail.tiscalinet.be> <20020716161335.GL8724@tausq.org>
In-Reply-To: <20020716161335.GL8724@tausq.org>
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

Quoting Randolph Chung <randolph@tausq.org>:

> > I just modify to match my develop env and mainly I added
> --host=hppa-linux (I am
> > building gcc-3.2 on a b2000) in the configure:
> > '$GCC_SRC/gcc/configure --prefix=$TOOLS --enable-languages=c
> --host=hppa-linux'
> 
> fwiw i use something like this:
> 
> ~/src/gcc-3.2/configure --prefix=/home/tausq/opt/gnu --host=hppa-linux
> --build=hppa-linux --target=hppa-linux --enable-shared --disable-nls
> --enable-languages=c

A yes (I see)

> 
> if building hppa64-linux compilers, use --target=hppa64-linux instead.
> 
> then i do 'make bootstrap-lean' and then 'make install', set my PATH to
> include /home/tausq/opt/gnu/bin, run 'gcc -v' to make sure i have the 
> right version in my path, and then build the kernel.

The PATH was well set (gcc --version shows me well 3.2 20020711 ...)

> 
> alternatively, if i were building a cross-compiler (say
> hppa-linux->hppa64-linux), i would just do 'make' instead of 'make
> bootstrap-lean'

That make me the idea clear.
Many thanks,
   Joel

PS: humm I found something: mulU stand well in pa.c and pa.o well knows mulU but
is not in libgcc.a but well in libbackend.a?

-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
