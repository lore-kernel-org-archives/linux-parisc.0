From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: can't compile kernel for parisc
Date: Wed, 18 Mar 2009 10:00:26 -0400 (EDT)
Message-ID: <20090318140026.7F06C4FA9@hiauly1.hia.nrc.ca>
References: <a4423d670903180455u20ead146k919426a1fb7276c6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: a.beregalov@gmail.com (Alexander Beregalov)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <a4423d670903180455u20ead146k919426a1fb7276c6@mail.gmail.com> from "Alexander Beregalov" at Mar 18, 2009 02:55:13 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> but I still can not build kernel.
> 
>    ld    -r -o init/built-in.o init/main.o init/version.o
> init/mounts.o init/noinitramfs.o init/calibrate.o
>   ld  --build-id -o .tmp_vmlinux1 -T arch/parisc/kernel/vmlinux.lds
> arch/parisc/kernel/head.o   init/built-in.o --start-group
> usr/built-in.o  arch/parisc/mm/built-in.o
> arch/parisc/kernel/built-in.o  arch/parisc/math-emu/built-in.o
> arch/parisc/kernel/init_task.o  kernel/built-in.o  mm/built-in.o
> fs/built-in.o  ipc/built-in.o  security/built-in.o  crypto/built-in.o
> block/built-in.o  lib/lib.a  arch/parisc/lib/lib.a `gcc
> -print-libgcc-file-name`  lib/built-in.o  arch/parisc/lib/built-in.o
> `gcc -print-libgcc-file-name`  drivers/built-in.o  sound/built-in.o
> firmware/built-in.o  net/built-in.o --end-group
> ld: arch/parisc/kernel/built-in.o(.text+0xc84): cannot reach
> 000000b2_b2:46+4068, recompile with -ffunction-sections
> ld: arch/parisc/kernel/built-in.o(.text+0xc84): cannot handle
> R_PARISC_PCREL12F for .text
> 
> I have recompiled kernel with -ffunction-sections, but still the same problem.

The branch target is out of range.  The message "recompile with
-ffunction-sections" is somewhat misleading in this case.

-ffunction-sections won't work because GCC doesn't generate calls
with instructions that would use a R_PARISC_PCREL12F relocation.
This is some kind of conditional branch.  Probably, it's in some
kernel assembly code.

You need to use nm, objdump and/or readelf to determine which file
contributing to built-in.o contains the branch.  I looked in one of
my builds and didn't see this relocation.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
