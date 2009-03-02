From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: can't compile kernel for parisc
Date: Mon, 2 Mar 2009 21:01:02 +0300
Message-ID: <a4423d670903021001y2ebdfc41md4f5007144ac8ec9@mail.gmail.com>
References: <a4423d670903020813k5c67749du7070ce31d44ab3e7@mail.gmail.com>
	 <20090302172005.A0B8E4ED1@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090302172005.A0B8E4ED1@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Either hsh->target_section->owner or hsh->bh_root.string is NULL. =C2=
=A0Could
> you put a break on this line and print the struct hsh in gdb?

bfd/elf32-hppa.c:
3568   /* Make sure we can reach the stub.  */
3569   if (max_branch_offset !=3D 0
3570       && value + addend + max_branch_offset >=3D 2*max_branch_offs=
et)
3571     {
3572       (*_bfd_error_handler)
3573         (_("%B(%A+0x%lx): cannot reach %s, recompile with
-ffunction-sections"),
3574          input_bfd,
3575          input_section,
3576          offset,
3577          hsh->bh_root.string);
3578       bfd_set_error (bfd_error_bad_value);
3579       return bfd_reloc_notsupported;
3580     }

(gdb) step
3572          (*_bfd_error_handler)

(gdb) info locals
howto =3D <value optimized out>
sym =3D (Elf_Internal_Sym *) 0x189ed40
sym_name =3D <value optimized out>
warned_undef =3D 0
r_symndx =3D <value optimized out>
hh =3D (struct elf32_hppa_link_hash_entry *) 0x0
sym_sec =3D (asection *) 0xf0870
relocation =3D 18446744073709532028
plabel =3D <value optimized out>
r_type =3D 8
rstatus =3D bfd_reloc_notsupported
local_got_offsets =3D (bfd_vma *) 0x137018
htab =3D (struct elf32_hppa_link_hash_table *) 0x78f70
rela =3D (Elf_Internal_Rela *) 0x12abd0
relend =3D (Elf_Internal_Rela *) 0x12b128
__PRETTY_FUNCTION__ =3D "elf32_hppa_relocate_section"

(gdb) print input_bfd
$4 =3D (bfd *) 0xae460

(gdb) print input_section
$5 =3D (asection *) 0xf0870

(gdb) print offset
No symbol "offset" in current context.

(gdb) print hsh->bh_root.string
No symbol "hsh" in current context.

(gdb) step
/usr/bin/ld:
Program received signal SIGSEGV, Segmentation fault.

I do not understand why there is no such symbols.
>
>> Should I really recompile glibc with -ffunction-sections ?
>
> It probably will help. =C2=A0If you are building for a PA 2.0 machine=
,
> -mpa-risc-2-0 may also help as the branch the branch distance for
> pc-relative calls is much bigger.
>
> I thought -ffunction-sections was always used for kernel builds.
>
> It's a bit of a puzzle as to why this error is triggered. =C2=A0I thi=
nk
> this is coming from ./arch/parisc/kernel/traps.c. =C2=A0I wouldn't ha=
ve
> thought the text in this file is large enough to trigger this error.
>
> Dave
> --
> J. David Anglin =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dave.ang=
lin@nrc-cnrc.gc.ca
> National Research Council of Canada =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0(613) 990-0752 (FAX: 952-6602)
>
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
