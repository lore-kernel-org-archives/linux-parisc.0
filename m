From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: unaligned accesses in apply_relocate_add
Date: Fri, 28 Aug 2009 12:42:01 -0600
Message-ID: <20090828184201.GA14548@lackof.org>
References: <4A94F439.6010301@stromasys.com> <20090826131749.GE19494@bombadil.infradead.org> <4A954990.7070007@stromasys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: Artem Alimarine <artem.alimarine@stromasys.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A954990.7070007@stromasys.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Aug 26, 2009 at 04:41:20PM +0200, Artem Alimarine wrote:
> One point is that in the function apply_relocate_add a 4-byte aligned  
> address is created:
>
> 627                dot = (Elf64_Addr)loc & ~0x03;
> 628                loc64 = (Elf64_Xword *)loc;
>
> and used as a 64-bit location
>
> 711                case R_PARISC_DIR64:
> 712                        /* 64-bit effective address */
> 713                        *loc64 = val + addend;
> 714                        break;
>
> So, 8-byte word is read with a 4-byte alignment.

Perhaps this is expected to be an 8byte address pointing at a 4-byte word?
(and it's a bug that ist's not)

> I am busy building a parisc hardware emulator. It boots Linux, but it is  
> unstable yet. There are unaligned accesses in the emulation trace. I was  
> wandering whether it is normal behavior or caused by a bug in the  
> emulation.

HP has such an emulator. I've even tried to boot parisc-linux on it (failed)
~8 years ago.  Any chance someone from HP could publish it?

You might also look at Aries PA-RISC emulator (on ia64):
    http://www.princeton.edu/~rblee/ELE572Papers/PARISCtoIA64.htm

> The emulation trace gives a lot of accesses like this:
> 0-4011f968: translate_virtual_write unaligned_trap, va=0:416a20c  
> pa=1db1820c
> 0-4011f968: translate_virtual_write unaligned_trap, va=0:416a21c  
> pa=1db1821c
> 0-4011f968: translate_virtual_write unaligned_trap, va=0:416a224  
> pa=1db18224
>
> They are indeed 4-byte aligned. The PC address matches  
> apply_relocate_add in the kernel map.

*nod*

thanks,
grant
