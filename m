Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA01683
	for <parisc-linux@puffin.external.hp.com>; Wed, 3 May 2000 08:32:00 -0600
Date: Wed, 3 May 2000 10:18:54 -0400 (EDT)
From: Sam Creasey <sammy@sammy.net>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] crti.S Nested procedures error
In-Reply-To: <200005011841.LAA11187@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0005031016340.6083-100000@sammyville.sammy.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>



On Mon, 1 May 2000, Grant Grundler wrote:

> Sammy,
> 
> I tried the "glibc" recipe on my x86 box (running Debian potato release).
> (http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/04-Apr/0059.html)
> 
> "make" died with the following error:
> 
> ...
> hppa1.1-linux-gcc /linux/grundler/glibc/hppa1.1-linux/csu/crti.S -c  -I../include -I. -I/linux/grundler/glibc/hppa1.1-linux/csu -I.. -I../libio  -I/linux/grundler/glibc/hppa1.1-linux -I../sysdeps/hppa/elf -I../sysdeps/unix/sysv/linux/hppa -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../sysdeps/unix/sysv -I../sysdeps/unix -I../sysdeps/posix -I../sysdeps/hppa/hppa1.1 -I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/dbl-64 -I../sysdeps/ieee754/ldbl-128 -I../sysdeps/hppa/fpu -I../sysdeps/hppa -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic  -nostdinc -isystem /opt/puffin/lib/gcc-lib/hppa1.1-linux/2.9-hppa-991112/include -isystem /opt/puffin/include  -include ../include/libc-symbols.h     -DHAVE_INITFINI -DASSEMBLER  -I/linux/grundler/glibc/hppa1.1-linux/csu/.  -g0  -o /linux/grundler/glibc/hppa1.1-linux/csu/crti.o
> 
> bc-symbols.h     -DHAVE_INITFINI -DASSEMBLER  -I/linux/grundler/glibc/hppa1.1-linux/csu/.  -g0  -o /linux/grundler/glibc/hppa1.1-linux/csu/crti.o
> /linux/grundler/glibc/hppa1.1-linux/csu/crti.S: Assembler messages:
> /linux/grundler/glibc/hppa1.1-linux/csu/crti.S:42: Fatal error: Nested procedures
> make[2]: *** [/linux/grundler/glibc/hppa1.1-linux/csu/crti.o] Error 1
> make[2]: Leaving directory `/linux/grundler/glibc/csu'
> make[1]: *** [csu/subdir_lib] Error 2
> 
> 
> Sure enough, two .PROC's have no .PROCEND in between.
> glibc/csu/Makefile builds crti.S with:
> 
> $(objpfx)crti.S: $(objpfx)initfini.s
>         sed -n -e '1,/@HEADER_ENDS/p' \
>                -e '/@_.*_PROLOG_BEGINS/,/@_.*_PROLOG_ENDS/p' \
>                -e '/@TRAILER_BEGINS/,$$p' $< > $@ 
> 
> 
> It seems either the initfini.s contents are wrong or the "sed" hack
> above is removing too much.  Which is it?
> Or should there only be one .PROC?
> 
> We get two .PROC's because initfini.s has both @_init_PROLOG_BEGINS/ENDS
> and @_fini_PROLOG_BEGINS/ENDS. 
> 
> Appended "diff -u initfini.s crti.S" shows what sed is doing.
> 
> thanks,
> grant

ok, for a while I was dealing with this by simply hacking up initfini.s by
hand, but that wasn't necessary last time I built.  I think this is
related to the fact that somebody had taken out .proc/.procend from the
assembler entirely (well, ignored them  on ELF targets).  I think this was
a bad idea (if I remember tc-hppa.c from gas, it depends on these to build
some of the global symbol information?  It did something even on an elf
target).

We might need our own magic sed script for parisc.

Lemme think about this properly, I just woke up and am expected at work.

-- Sam
