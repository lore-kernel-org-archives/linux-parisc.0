From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: can't compile kernel for parisc
Date: Tue, 3 Mar 2009 15:57:21 +0300
Message-ID: <a4423d670903030457k20f2e975ya567e9d3b1a5a3ab@mail.gmail.com>
References: <a4423d670903021001y2ebdfc41md4f5007144ac8ec9@mail.gmail.com>
	 <20090302181719.8CB8F4ED1@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090302181719.8CB8F4ED1@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

>> bfd/elf32-hppa.c:
>> 3568 =C2=A0 /* Make sure we can reach the stub. =C2=A0*/
>> 3569 =C2=A0 if (max_branch_offset !=3D3D 0
>> 3570 =C2=A0 =C2=A0 =C2=A0 && value + addend + max_branch_offset >=3D=
3D 2*max_branch_offset)
>> 3571 =C2=A0 =C2=A0 {
>> 3572 =C2=A0 =C2=A0 =C2=A0 (*_bfd_error_handler)
>> 3573 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (_("%B(%A+0x%lx): cannot reach %s, =
recompile with
>> -ffunction-sections"),
>> 3574 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input_bfd,
>> 3575 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input_section,
>> 3576 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset,
>> 3577 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hsh->bh_root.string);
>> 3578 =C2=A0 =C2=A0 =C2=A0 bfd_set_error (bfd_error_bad_value);
>> 3579 =C2=A0 =C2=A0 =C2=A0 return bfd_reloc_notsupported;
>> 3580 =C2=A0 =C2=A0 }
>>
> As soon as you step into the error handler, you change the function
> context. =C2=A0So, there is no local symbol hsh there. =C2=A0It's als=
o possible
> the symbol hsh is optimized away, particularly because of the way it'=
s
> derived fro the argument bh.

Ok, I have recompiled binutils with -O0:

Breakpoint 1, final_link_relocate (input_section=3D0x105770,
contents=3D0x43661008 "cows can fly", rela=3D0x13fae8,
value=3D18446744073709532028,
    htab=3D0x8df70, sym_sec=3D0x105770, hh=3D0x0, info=3D0x7b890)
    at /var/tmp/portage/sys-devel/binutils-2.19.51.0.2/work/binutils-2.=
19.51.0.2/bfd/elf32-hppa.c:3572
3572          (*_bfd_error_handler)
(gdb) info locals
insn =3D -2021646334
r_type =3D 8
orig_r_type =3D 8
howto =3D (const struct reloc_howto_struct *) 0x403fb128
r_format =3D 12
r_field =3D e_fsel
-> input_bfd =3D (bfd *) 0xc3460
-> offset =3D 3204
max_branch_offset =3D 8192
hit_data =3D (bfd_byte *) 0x43661c8c "\207\200 \002\b\017\002B\b\020\00=
2^=C3=A8@=C3=80"
addend =3D -8
location =3D 269536388
-> hsh =3D (struct elf32_hppa_stub_hash_entry *) 0x933b8
val =3D 0

(gdb) print hsh->bh_root.string
$1 =3D 0x13919a8 "000000b2_b2:46+4068"

(gdb) print input_section
$2 =3D (asection *) 0x105770

Hm, they are not NULL.

ld segfaults on the next line again.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
