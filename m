Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.web.de (smtp02.web.de [217.72.192.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B49D4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 11:20:12 -0700 (MST)
Message-ID: <3E7761F6.403DC5@web.de>
Date: Tue, 18 Mar 2003 19:14:14 +0100
From: "b.gunreben" <b.gunreben@web.de>
MIME-Version: 1.0
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Matthew Wilcox <willy@debian.org>,
	Randolph Chung <tausq@debian.org>,
	Matthias Klose <doko@cs.tu-berlin.de>, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org, parisc-linux@lists.parisc-linux.org,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, linux-net@vger.kernel.org
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
References: <3E68A12A0000231A@ocpmta3.freegates.net>
Content-Type: text/plain; charset=us-ascii
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

Joel Soete wrote:
> >gcc 3.3 decides to not believe you want this function inlined.  probably
> >the right fix for this is to make this function static inline (you can
> >drop the `__' around inline, it's not necessary).  This is also the case
> >for linux 2.5.
> >
> Right Willy that allow to compile :)
> 
> Unfortunately it failled to boot :_( with following dump:
> Freeing unused kernel memory: 246k freed
> ......
> Submitted to dump_analyser.sh, I obtain:
> 
> IAOQ = 10351b7c
> Func: __canonicalize_funcptr_for_compare, Off: 38, Addr: 0x10351b7c
> 10351b70:       2a 6b 50 00     addil 56800,r19,%r1
> 10351b74:       48 21 0c a8     ldw 654(r1),r1
> 10351b78:       d4 60 1c 1e     depwi 0,31,2,r3
> 10351b7c:       0c 60 10 94     ldw 0(sr0,r3),r20
> 
> GR0 = 00000000
> 
> GR1 = 103eee50
> Func: _GLOBAL_OFFSET_TABLE_, Off: 0, Addr: 0x103eee50
> 
> GR2 = 101342f8
> Func: do_sigaction, Off: a8, Addr: 0x101342f8

I have the same problem with a gcc 3.3 compiled kernel. The kernel itself
completely comes up, and I even can call a static shell (something like
init=/bin/sash), but as soon as glibc is involved, the mentioned crash
occurs. Just to make it clear: I am able to use the builtin functions of
that shell (like ls) and this works.

This is independend from the kernel version (2.4 and 2.5 behave all the
same). The function __canonicalize_funcptr_for_compare seems to be newly
introduced in libgcc with gcc 3.3, and seems to be the cause of this error.


Berthold
