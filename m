Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3DFB4852
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 21 Feb 2004 12:01:23 -0700 (MST)
Message-ID: <4037AB13.3050908@tiscali.be>
Date: Sat, 21 Feb 2004 19:01:39 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Carlos O'Donell <carlos@baldric.uwo.ca>
References: <402A42A1000052A9@ocpmta1.freegates.net>
	<Pine.GSO.4.44.0402180830260.14838-100000@keymaster>
	<20040218163927.GC9497@baldric.uwo.ca>
In-Reply-To: <20040218163927.GC9497@baldric.uwo.ca>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb: followup
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Carlos,

Carlos O'Donell wrote:
>>>But now I need more to try to complete job because:
>>>make[2]: *** [/Develop/parisc-linux/build/glibc/sunrpc/xbootparam_prot.stmp]
> 
> 
> This is the first time that the loader you built is used. If the loader
> is in anyway broke, it will *always* die here first. Just remember this
> glibc haiku when you are coding:
> 
> 	Loader code is bad.
> 	Dying in sunrpc.
> 	Blame relocations.
> 
> :)
> 
It takes me some more time because I would test patch by patch with gcc-3.3 if nothing was broken.
But all those patch seems ok with gcc-3.3 (just have to revert it and re-run with make -k check ;) )

That said, I so have on a system (a n4k runing a 64bit 2.6) a ld.so and libc.so build with gcc-3.5 (let me suffix with (3.5) ie: 
ld.so(3.5) and libc.so(3.5)). On another system (a b2k the same 64bit 2.6), I build with gcc-3.3.3 a ld.so(3.3) and libc.so(3.3).

The cmd:
CPP='/Develop/parisc-linux/xc/bin/hppa-linux-gcc -E -x c-header'  /Develop/parisc-linux/build/glibc/elf/ld.so.1
--library-path 
/Develop/parisc-linux/build/glibc:/Develop/parisc-linux/build/glibc/math:/Develop/parisc-linux/build/glibc/elf:/Develop/parisc-linux/build/glibc/dlfcn:/Develop/parisc-linux/build/glibc/nss:/Develop/parisc-linux/build/glibc/nis:/Develop/p
arisc-linux/build/glibc/rt:/Develop/parisc-linux/build/glibc/resolv:/Develop/parisc-linux/build/glibc/crypt:/Develop/parisc-linux/build/glibc/linuxthreads
/Develop/parisc-linux/build/glibc/sunrpc/rpcgen -Y ../scripts -c rpcsvc/bootparam_prot.x
-o /Develop/parisc-linux/build/glibc/sunrpc/xbootparam_prot.T

failled with gcc-3.5
otc ok with gcc-3.3

Now if on the N I replace libc.so(3.5) by libc.so(3.3) the cmd (ie using ld.so(3.5)) always failled
OTC if on the B I replace libc.so(3.3) by libc.so(3.5) the cmd (ie using ld.so(3.3)) works fine.
so it confirms that the loader is broken :(

So I have to figure out what goes wrong in "relocation". Can you help me by pointing out some files and may functions to specialy 
analyse :).

Thanks in advance,
	Joel

BTW: The previous mentioned patch are (afaik) of general interest (not hppa specific) but would you like that I submit you first 
so that you could submit it to glibc maintainers or do you prefer that i manage that myself?
