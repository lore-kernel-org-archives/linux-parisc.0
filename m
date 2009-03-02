From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: can't compile kernel for parisc
Date: Mon, 2 Mar 2009 19:13:29 +0300
Message-ID: <a4423d670903020813k5c67749du7070ce31d44ab3e7@mail.gmail.com>
References: <a4423d670902270955j5562dd4bkce8142e0a89750f9@mail.gmail.com>
	 <20090228161719.40D0D4E9A@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090228161719.40D0D4E9A@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

2009/2/28 John David Anglin <dave@hiauly1.hia.nrc.ca>:
>> (no debugging symbols found)
>> /usr/bin/ld:
>> Program received signal SIGSEGV, Segmentation fault.
>> 0x4080f404 in strlen () from /lib/libc.so.6
>> (gdb) backtrace
>> #0 =C2=A00x4080f404 in strlen () from /lib/libc.so.6
>> #1 =C2=A00x407d5428 in vfprintf () from /lib/libc.so.6
>> #2 =C2=A00x407d1304 in ?? () from /lib/libc.so.6
>> #3 =C2=A00x407d18b0 in vfprintf () from /lib/libc.so.6
>> #4 =C2=A00x4088359c in __vfprintf_chk () from /lib/libc.so.6
>> #5 =C2=A00x4040cdc8 in _bfd_default_error_handler () from
>> /usr/lib/binutils/hppa2.0-unknown-linux-gnu/2.18/libbfd-2.18.so
>> #6 =C2=A00x40432034 in ?? () from
>> /usr/lib/binutils/hppa2.0-unknown-linux-gnu/2.18/libbfd-2.18.so
>> #7 =C2=A00x40452f58 in bfd_elf_final_link () from
>> /usr/lib/binutils/hppa2.0-unknown-linux-gnu/2.18/libbfd-2.18.so
>> #8 =C2=A00x4042e764 in ?? () from
>> /usr/lib/binutils/hppa2.0-unknown-linux-gnu/2.18/libbfd-2.18.so
>> #9 =C2=A00x00029f3c in ?? ()
>> #10 0x000295c8 in main ()
>>
>> Glibc is =C2=A02.9_p20081201, I will try older version.
>
> Assuming you have the glibc debug libraries, try the same backtrace
> with LD_LIBRARY_PATH set to /usr/lib/debug. =C2=A0Try to determine
> if a bad pointer has been passed from _bfd_default_error_handler.
> This seems likely.
Hi John,

Thanks for you help
Is it more clear?

binutils-2.19.1, glibc-2.9_p20081201, gcc-4.3.3

/usr/bin/ld:
Program received signal SIGSEGV, Segmentation fault.
*__GI_strlen (str=3D0xc84 <Address 0xc84 out of bounds>) at strlen.c:64
64      strlen.c: No such file or directory.
        in strlen.c
(gdb) bt
#0  *__GI_strlen (str=3D0xc84 <Address 0xc84 out of bounds>) at strlen.=
c:64
#1  0x40542530 in _IO_vfprintf_internal (s=3D0xfb0d3520,
    format=3D0xfb0d2a0c "arch/parisc/kernel/built-in.o(.text.8+0x%lx):
cannot reach %s, recompile with -ffunction-sections", ap=3D0xfb0d29cc)
    at vfprintf.c:1581
#2  0x40543284 in buffered_vfprintf (s=3D0x4064ab98, format=3D0xfb0d2a3=
7
"): cannot reach %s, recompile with -ffunction-sections",
    args=3D0xfb0d55d0) at vfprintf.c:2188
#3  0x4053f2e0 in _IO_vfprintf_internal (s=3D0x4064ab98,
    format=3D0xfb0d2a0c "arch/parisc/kernel/built-in.o(.text.8+0x%lx):
cannot reach %s, recompile with -ffunction-sections", ap=3D0xfb0d29d4)
    at vfprintf.c:1288
#4  0x405eddb4 in ___vfprintf_chk (fp=3D0x4064ab98, flag=3D1,
    format=3D0xfb0d2a0c "arch/parisc/kernel/built-in.o(.text.8+0x%lx):
cannot reach %s, recompile with -ffunction-sections", ap=3D0xfb0d29d4)
    at vfprintf_chk.c:35
#5  0x4004ec74 in _bfd_default_error_handler (fmt=3D0x400c1089 "+0x%lx)=
:
cannot reach %s, recompile with -ffunction-sections")
    at /usr/include/bits/stdio2.h:128
#6  0x40074c94 in elf32_hppa_relocate_section (output_bfd=3D0x78d28,
info=3D0x68c00, input_bfd=3D0xd9060, input_section=3D0xf21c0,
    contents=3D0x43571008 "cows can fly", relocs=3D0x12b520,
local_syms=3D0x1891808, local_sections=3D0x1b350d8)
    at /var/tmp/portage/sys-devel/binutils-2.19.1/work/binutils-2.19.1/=
bfd/elf32-hppa.c:3599
#7  0x40099480 in bfd_elf_final_link (abfd=3D0x78d28, info=3D0x68c00)
    at /var/tmp/portage/sys-devel/binutils-2.19.1/work/binutils-2.19.1/=
bfd/elflink.c:9269
#8  0x40071374 in elf32_hppa_final_link (abfd=3D0xc84, info=3D0xfb0d2a3=
7)
    at /var/tmp/portage/sys-devel/binutils-2.19.1/work/binutils-2.19.1/=
bfd/elf32-hppa.c:3266
#9  0x0002a1e8 in ?? ()
#10 0x00029904 in main ()

Should I really recompile glibc with -ffunction-sections ?

bt full:

#5  0x4004ec74 in _bfd_default_error_handler (fmt=3D0x400c1089 "+0x%lx)=
:
cannot reach %s, recompile with -ffunction-sections")
    at /usr/include/bits/stdio2.h:128
        ap =3D (va_list) 0xfb3229d4
        bufp =3D 0xfb322a31 "+0x%lx): cannot reach %s, recompile with
-ffunction-sections"
        new_fmt =3D 0xfb322a0c
"arch/parisc/kernel/built-in.o(.text.8+0x%lx): cannot reach %s,
recompile with -ffunction-sections"
        p =3D 0x400c10a1 ", recompile with -ffunction-sections"
        avail =3D 902
        buf =3D "arch/parisc/kernel/built-in.o(.text.8+0x%lx): cannot
reach %s, recompile with
-ffunction-sections\000=C3=B2=C3=B7\000\000\000\006\000\000\000\001\000=
\000\000\000\000\000\000\001=C3=BF=C3=BF=C3=B3|=C3=BF=C3=BF=C3=BF=C3=BF=
\000\000\000\001\000\000\000\000\000\000\000\000@\r0\230\000\b\003\230\=
000\000\000\000\000\000\200\000\000\000\000\000@\r0\230\000\v\v
\000\000\000\000\000\000\000\n\000\000\000\b\000\000\000\004\000\000@h\=
000\000\000F\000\000\000=C2=B1\000\000\000=C2=B1@\f\017\000"...
        __PRETTY_FUNCTION__ =3D "_bfd_default_error_handler"
#6  0x40074c94 in elf32_hppa_relocate_section (output_bfd=3D0x78d28,
info=3D0x68c00, input_bfd=3D0xd9060, input_section=3D0xf21c0,
    contents=3D0x43571008 "cows can fly", relocs=3D0x12b520,
local_syms=3D0x1891808, local_sections=3D0x1b350d8)
    at /var/tmp/portage/sys-devel/binutils-2.19.1/work/binutils-2.19.1/=
bfd/elf32-hppa.c:3599
        howto =3D <value optimized out>
        sym =3D (Elf_Internal_Sym *) 0x18920c8
        sym_name =3D <value optimized out>
        warned_undef =3D 0
        r_symndx =3D <value optimized out>
        hh =3D (struct elf32_hppa_link_hash_entry *) 0x0
        sym_sec =3D (asection *) 0xf21c0
        relocation =3D 18446744073709532028
        plabel =3D <value optimized out>
        r_type =3D 8
        rstatus =3D bfd_reloc_notsupported
        local_got_offsets =3D (bfd_vma *) 0x1384b8
        htab =3D (struct elf32_hppa_link_hash_table *) 0x7af50
        rela =3D (Elf_Internal_Rela *) 0x12bac0
        relend =3D (Elf_Internal_Rela *) 0x12c018
        __PRETTY_FUNCTION__ =3D "elf32_hppa_relocate_section"


>
> binutils has likely been miscompiled, or your kernel build has
> exposed a problem in binutils. =C2=A0We may be not handling a relocat=
ion
> correctly during the final link.
>
> If you can, would you build CVS binutils with debugging. =C2=A0Disabl=
e
> building shared libraries so we don't use libbfd-2.18.so. =C2=A0Insta=
ll
> it somewhere. =C2=A0Replace your current versions of as and ld. =C2=A0=
Then
> redo the kernel build. =C2=A0If the same error occurs, we will have a
> version that can be debugged.

I will try it some time later.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
