From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] FATAL: kernel too old
Date: Wed, 4 Dec 2002 17:13:07 -0500 (EST)
Message-ID: <200212042213.gB4MD83F000234__49752.9459455565$1416621994$gmane$org@hiauly1.hia.nrc.ca>
References: <20021203024358.GA5487@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: libc-alpha@sources.redhat.com, debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20021203024358.GA5487@systemhalted> from "Carlos O'Donell" at Dec 2, 2002 09:43:58 pm
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

I'm getting the following error building glibc-2.3.1-5:

CPP='/home/dave/opt/gnu/bin/gcc -E -x c-header'  /home/dave/glibc-2.3.1-5/glibc-
2.3.1/objdir/elf/ld.so.1 --library-path /home/dave/glibc-2.3.1-5/glibc-2.3.1/obj
dir:/home/dave/glibc-2.3.1-5/glibc-2.3.1/objdir/math:/home/dave/glibc-2.3.1-5/gl
ibc-2.3.1/objdir/elf:/home/dave/glibc-2.3.1-5/glibc-2.3.1/objdir/dlfcn:/home/dav
e/glibc-2.3.1-5/glibc-2.3.1/objdir/nss:/home/dave/glibc-2.3.1-5/glibc-2.3.1/objd
ir/nis:/home/dave/glibc-2.3.1-5/glibc-2.3.1/objdir/rt:/home/dave/glibc-2.3.1-5/g
libc-2.3.1/objdir/resolv:/home/dave/glibc-2.3.1-5/glibc-2.3.1/objdir/crypt:/home
/dave/glibc-2.3.1-5/glibc-2.3.1/objdir/linuxthreads /home/dave/glibc-2.3.1-5/gli
bc-2.3.1/objdir/sunrpc/rpcgen -Y ../scripts -c rpcsvc/bootparam_prot.x -o /home/
dave/glibc-2.3.1-5/glibc-2.3.1/objdir/sunrpc/xbootparam_prot.T
FATAL: kernel too old
make[2]: *** [/home/dave/glibc-2.3.1-5/glibc-2.3.1/objdir/sunrpc/xbootparam_prot
.stmp] Error 1

Is 2.4.18-pa52 really too old?

I configured with

../glibc/configure --build=hppa-linux --host=hppa-linux --target=hppa-linux --prefix=/home/dave/opt/gnu --disable-profile --without-cvs --enable-add-ons --enable-hacker-mode --enable-kernel=2.4.8

Oh, I noticed that hppa-linux is not listed in INSTALL or README.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
