Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6D2EB4832
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Dec 2002 15:26:13 -0700 (MST)
Date: Wed, 4 Dec 2002 22:25:57 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	<libc-alpha@sources.redhat.com>, <debian-glibc@lists.debian.org>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] FATAL: kernel too old
In-Reply-To: <200212042213.gB4MD83F000234@hiauly1.hia.nrc.ca>
Message-ID: <Pine.LNX.4.44.0212042223110.18467-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 4 Dec 2002, John David Anglin wrote:

> I'm getting the following error building glibc-2.3.1-5:
>
> CPP='/home/dave/opt/gnu/bin/gcc -E -x c-header'  /home/dave/glibc-2.3.1-5/glibc-
> 2.3.1/objdir/elf/ld.so.1 --library-path /home/dave/glibc-2.3.1-5/glibc-2.3.1/obj
> dir:/home/dave/glibc-2.3.1-5/glibc-2.3.1/objdir/math:/home/dave/glibc-2.3.1-5/gl
> ibc-2.3.1/objdir/elf:/home/dave/glibc-2.3.1-5/glibc-2.3.1/objdir/dlfcn:/home/dav
> e/glibc-2.3.1-5/glibc-2.3.1/objdir/nss:/home/dave/glibc-2.3.1-5/glibc-2.3.1/objd
> ir/nis:/home/dave/glibc-2.3.1-5/glibc-2.3.1/objdir/rt:/home/dave/glibc-2.3.1-5/g
> libc-2.3.1/objdir/resolv:/home/dave/glibc-2.3.1-5/glibc-2.3.1/objdir/crypt:/home
> /dave/glibc-2.3.1-5/glibc-2.3.1/objdir/linuxthreads /home/dave/glibc-2.3.1-5/gli
> bc-2.3.1/objdir/sunrpc/rpcgen -Y ../scripts -c rpcsvc/bootparam_prot.x -o /home/
> dave/glibc-2.3.1-5/glibc-2.3.1/objdir/sunrpc/xbootparam_prot.T
> FATAL: kernel too old
> make[2]: *** [/home/dave/glibc-2.3.1-5/glibc-2.3.1/objdir/sunrpc/xbootparam_prot
> .stmp] Error 1
>
> Is 2.4.18-pa52 really too old?
>
> I configured with
>
> ../glibc/configure --build=hppa-linux --host=hppa-linux --target=hppa-linux
> --prefix=/home/dave/opt/gnu --disable-profile --without-cvs
> --enable-add-ons --enable-hacker-mode --enable-kernel=2.4.8
                                                        ^^^^^

2.4.8 ? Not 2.4.18? But I don't know whether this make a difference!?

BTW, wasn't there a option for --with-kernel-headers= ?
Perhaps the kernel headers weren't picked up properly ...

greetings max
