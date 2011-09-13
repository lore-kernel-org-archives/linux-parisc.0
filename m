From: "Rolf Eike Beer" <eike-kernel@sf-tec.de>
Subject: Re: failure to link kernel 3.0.3 with cross
 binutils-2.21.1/gcc-4.6.1
Date: Tue, 13 Sep 2011 09:48:55 +0200
Message-ID: <19867f38b905e3efcd5cb2d254dc5aa6.squirrel@webmail.sf-mail.de>
References: <CAFk90B8F17-o3HqRGygu8OUb-Ncurqi-Ui+_u9kfaqmQG5nK4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: "Graham Gower" <graham.gower@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAFk90B8F17-o3HqRGygu8OUb-Ncurqi-Ui+_u9kfaqmQG5nK4Q@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> grg@eye7:/mnt/1T/hppa/linux-3.0$ make vmlinux ARCH=parisc
> CROSS_COMPILE=/tmp/hppa64/bin/hppa64-linux-
>   CHK     include/linux/version.h
>   CHK     include/generated/utsrelease.h
>   CALL    scripts/checksyscalls.sh
>   CHK     include/generated/compile.h
>   LD      vmlinux.o
>   MODPOST vmlinux.o
>   GEN     .version
>   CHK     include/generated/compile.h
>   UPD     include/generated/compile.h
>   CC      init/version.o
>   LD      init/built-in.o
>   LD      .tmp_vmlinux1
>   KSYM    .tmp_kallsyms1.S
>   AS      .tmp_kallsyms1.o
>   LD      .tmp_vmlinux2
> /tmp/hppa64/bin/hppa64-linux-ld:
> arch/parisc/mm/built-in.o(.init.text+0xed0): cannot reach
> flush_tlb_all_local
> /tmp/hppa64/bin/hppa64-linux-ld: BFD (GNU Binutils) 2.21.1 internal
> error, aborting at ../../binutils-2.21.1/bfd/elf64-hppa.c line 3956 in
> elf64_hppa_relocate_section
>
> /tmp/hppa64/bin/hppa64-linux-ld: Please report this bug.
>
> make: *** [.tmp_vmlinux2] Error 1
>
> Any clues?

Maybe related to this:

http://sourceware.org/bugzilla/show_bug.cgi?id=13168

Eike
