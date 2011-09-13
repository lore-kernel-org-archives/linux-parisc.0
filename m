From: John David Anglin <dave.anglin@bell.net>
Subject: Re: failure to link kernel 3.0.3 with cross binutils-2.21.1/gcc-4.6.1
Date: Tue, 13 Sep 2011 09:55:37 -0400
Message-ID: <4E6F60D9.5030203@bell.net>
References: <CAFk90B8F17-o3HqRGygu8OUb-Ncurqi-Ui+_u9kfaqmQG5nK4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Graham Gower <graham.gower@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAFk90B8F17-o3HqRGygu8OUb-Ncurqi-Ui+_u9kfaqmQG5nK4Q@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 9/13/2011 3:20 AM, Graham Gower wrote:
> /tmp/hppa64/bin/hppa64-linux-ld:
> arch/parisc/mm/built-in.o(.init.text+0xed0): cannot reach
> flush_tlb_all_local
> /tmp/hppa64/bin/hppa64-linux-ld: BFD (GNU Binutils) 2.21.1 internal
> error, aborting at ../../binutils-2.21.1/bfd/elf64-hppa.c line 3956 in
> elf64_hppa_relocate_section
>
> Any clues?
Check the relocation at arch/parisc/mm/built-in.o(.init.text+0xed0) with 
readelf
or objdump.  It should be R_PARISC_PCREL22F.  If this isn't a 22-bit branch,
then the call needs changing (e.g., change a bl to b,l).

If this is a 22-bit call, then you will have to remove some stuff from 
your .config.
Maybe use more modules.

The hppa64 linker doesn't have stub support  for long calls.  The maximum
branch distance (R_PARISC_PCREL22F) is 8388608 bytes.

Stub support could be added to hppa64 in a manner similar to that for 
hppa32,
but there isn't a 64-bit userspace except on HP-UX.  On HP-UX, the HP linker
is better.  I made a number of changes a few years ago to make this possible
but there's still quite a bit of work involved.

Dave

-- 
John David Anglin    dave.anglin@bell.net

