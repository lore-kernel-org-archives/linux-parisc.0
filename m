Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1A1944829
	for <parisc-linux@parisc-linux.org>; Mon,  2 Jun 2003 15:10:53 -0600 (MDT)
Message-Id: <200306022110.h52LAdt3024082@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [hppa] binutils will not build shared libraries with external deps?
To: amodra@bigpond.net.au
Date: Mon, 2 Jun 2003 17:10:38 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: tausq@debian.org, bug-binutils@gnu.org,
	binutils@sources.redhat.com, parisc-linux@parisc-linux.org,
	debian-gcc@lists.debian.org
In-Reply-To: <20030528190706.GC21904@bubble.sa.bigpond.net.au> from "amodra@bigpond.net.au" at May 29, 2003 04:37:06 am
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

> On Mon, May 26, 2003 at 10:22:51PM -0700, Randolph Chung wrote:
> > tausq@ios:~$ gcc -shared -fPIC -o blah.so blah.c
> > /tmp/ccC3fZeH.o(.text+0x1c): In function `call_foo':
> > : undefined reference to `foo'
> 
> This should fix it.  Would someone mind applying it for me?  I'm in
> transit at the moment and internet access is slow and flaky.  2.14
> branch too, I guess.
> 
> 	* elf32-hppa.c (elf32_hppa_relocate_section): Delete bogus
> 	undefined_symbol call.

I'm not fully up to speed on this but there still appear to be problems
with undefined symbols in shared libraries:

gcc -L/home/dave/binutils-2.14.90/objdir/ld -g -g -O2  -DHIDDEN_TEST -fpic -B/ho
me/dave/binutils-2.14.90/objdir/ld/tmpdir/gas/ -I/home/dave/binutils-2.14.90/src
/ld/testsuite/ld-elfvsb -g -O2  -c /home/dave/binutils-2.14.90/src/ld/testsuite/
ld-elfvsb/sh1.c -o tmpdir/sh1p.o
gcc -L/home/dave/binutils-2.14.90/objdir/ld -g -g -O2  -DHIDDEN_TEST -fpic -B/ho
me/dave/binutils-2.14.90/objdir/ld/tmpdir/gas/ -I/home/dave/binutils-2.14.90/src
/ld/testsuite/ld-elfvsb -g -O2  -c /home/dave/binutils-2.14.90/src/ld/testsuite/
ld-elfvsb/sh2.c -o tmpdir/sh2p.o
gcc -L/home/dave/binutils-2.14.90/objdir/ld -B/home/dave/binutils-2.14.90/objdir
/ld/tmpdir/ld/ -L/home/dave/opt/gnu/hppa-linux/lib -L/home/dave/opt/gnu/lib -L/u
sr/local/lib -L/lib -L/usr/lib  -o tmpdir/vp.so -shared  tmpdir/sh1p.o tmpdir/sh
2p.o
tmpdir/sh1p.o(.text+0x0): In function `shlib_mainvar':
/home/dave/binutils-2.14.90/src/ld/testsuite/ld-elfvsb/sh1.c:32: undefined refer
ence to `mainvar'
...
FAIL: visibility (hidden)

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
