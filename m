From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: parisc: flush pages through tmpalias space
Date: Wed, 5 Jan 2011 13:51:04 -0500
Message-ID: <20110105185104.GA7244@hiauly1.hia.nrc.ca>
References: <1293034931.3019.8.camel@mulgrave.site> <20101229042346.GA973@hiauly1.hia.nrc.ca> <1293634281.2803.4.camel@fuzzy> <20101230155640.GA7058@hiauly1.hia.nrc.ca> <20101230160944.GA7360@hiauly1.hia.nrc.ca> <20110101183108.GA19035@hiauly1.hia.nrc.ca> <20110105034922.GA4120@hiauly1.hia.nrc.ca> <AANLkTikC_1OGzzUkFpiCGx+F=29E9BZnyzU8xL0V-JU0@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTikC_1OGzzUkFpiCGx+F=29E9BZnyzU8xL0V-JU0@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 05 Jan 2011, Carlos O'Donell wrote:

> >> With the above, I get the following INEQUIVALENT ALIASES messages:
> >>
> >> Jan =A01 10:23:19 gsyprf11 kernel: [135942.140000] INEQUIVALENT AL=
IASES 0x406b1000 and 0x406b0000 in file libc-2.11.2.so
> >> Jan =A01 10:23:19 gsyprf11 kernel: [135942.224000] INEQUIVALENT AL=
IASES 0x406b1000 and 0x406b0000 in file libc-2.11.2.so
> >
> > This is what I see in the tasks maps file in /proc:
> >
> > 00010000-00011000 r-xp 00000000 08:30 6613687 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/home2/dave/inequiv/xxx1
> > 00011000-00012000 rwxp 00000000 08:30 6613687 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/home2/dave/inequiv/xxx1
> > 40000000-40005000 rw-p 00000000 00:00 0
> > 4002b000-4004b000 r-xp 00000000 08:03 2502157 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/lib/ld-2.11.2.so
> > 4004b000-4004f000 rwxp 0001f000 08:03 2502157 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/lib/ld-2.11.2.so
> > 4004f000-40050000 rwxp 00000000 00:00 0
> > 40138000-40291000 r-xp 00000000 08:03 2502172 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/lib/libc-2.11.2.so
> > 40291000-40298000 rwxp 00158000 08:03 2502172 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/lib/libc-2.11.2.so
> > 40298000-4029a000 rwxp 00000000 00:00 0
> > fe09b000-fe0be000 rwxp 00000000 00:00 0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[stack]
> >
> > As can be seen, there are duplicate maps with different protections=
 for xxx1,
> > etc. =A0So, it's clear why we have the inequivalent aliases. =A0The=
 map can
> > be accessed by the application (probably just for lines in the cach=
e).
> > I have seen some discussions that even a read may lead to cache cor=
ruption.
> >
> > These inequivalent maps are coming from glibc:
> >
> > dave@gsyprf11:~/inequiv$ strace /lib/ld-2.11.2.so ./xxx1
> > execve("/lib/ld-2.11.2.so", ["/lib/ld-2.11.2.so", "./xxx1"], [/* 17=
 vars */]) =3D 0
> > brk(0) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0=3D 0x4119a000
> > open("./xxx1", O_RDONLY) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 3
> > read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\2\0\17\0\0\0\1\0\1\3T\0\=
0\0004"..., 512) =3D 512
> > fstat64(3, {st_mode=3D0, st_size=3D4380866642020, ...}) =3D 0
> > getcwd("/home2/dave/inequiv", 128) =A0 =A0 =A0=3D 20
> > mmap(0x10000, 4096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_=
DENYWRITE, 3, 0) =3D 0x10000
> > mmap(0x11000, 4096, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP=
_FIXED|MAP_DENYWRITE, 3, 0) =3D 0x11000
> > ...
> >
> > Carlos what do you think? =A0arch_get_unmapped_area() accepts MAP_F=
IXED
> > requests even if it would violate cache aliasing constraints. =A0I =
don't
> > understand the purpose of the region at 0x11000.
>=20
> I'm currently on the South Rim of the Grand Canyon with limited acces=
s
> to my systems. I'll be back in touch near the end of January and look
> into this.

Nice!

> What does the application look like e.g. readelf -a?

See below.

> The 0x11000 region looks like .data?

Yes.  However, the 0x11000 region also maps to the same physical
address as the region at 0x10000.  Thus, the inequivalent mapping.
The data starts at 0x11890.  It appears the linker has rounded up
the start of the data by 4KB (one page).

Maybe the fix is to round up the start of the data to the next 4GB
boundary in the linker.  This would make the alias boundaries
equivalent.

Dave
--=20
J. David Anglin                                  dave.anglin@nrc-cnrc.g=
c.ca
National Research Council of Canada              (613) 990-0752 (FAX: 9=
52-6602)

ELF Header:
  Magic:   7f 45 4c 46 01 02 01 03 00 00 00 00 00 00 00 00=20
  Class:                             ELF32
  Data:                              2's complement, big endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - Linux
  ABI Version:                       0
  Type:                              EXEC (Executable file)
  Machine:                           HPPA
  Version:                           0x1
  Entry point address:               0x10354
  Start of program headers:          52 (bytes into file)
  Start of section headers:          2884 (bytes into file)
  Flags:                             0x210, PA-RISC 1.1
  Size of this header:               52 (bytes)
  Size of program headers:           32 (bytes)
  Number of program headers:         7
  Size of section headers:           40 (bytes)
  Number of section headers:         31
  Section header string table index: 28

Section Headers:
  [Nr] Name              Type            Addr     Off    Size   ES Flg =
Lk Inf Al
  [ 0]                   NULL            00000000 000000 000000 00     =
 0   0  0
  [ 1] .interp           PROGBITS        00010114 000114 00000d 00   A =
 0   0  1
  [ 2] .note.ABI-tag     NOTE            00010124 000124 000020 00   A =
 0   0  4
  [ 3] .note.gnu.build-i NOTE            00010144 000144 000000 00   A =
 0   0  4
  [ 4] .hash             HASH            00010144 000144 000034 04   A =
 5   0  4
  [ 5] .dynsym           DYNSYM          00010178 000178 000080 10   A =
 6   1  4
  [ 6] .dynstr           STRTAB          000101f8 0001f8 000080 00   A =
 0   0  1
  [ 7] .gnu.version      VERSYM          00010278 000278 000010 02   A =
 5   0  2
  [ 8] .gnu.version_r    VERNEED         00010288 000288 000020 00   A =
 6   1  4
  [ 9] .rela.dyn         RELA            000102a8 0002a8 00000c 0c   A =
 5   0  4
  [10] .rela.plt         RELA            000102b4 0002b4 000048 0c   A =
 5  23  4
  [11] .init             PROGBITS        000102fc 0002fc 000048 00  AX =
 0   0  4
  [12] .text             PROGBITS        00010344 000344 0003e4 00  AX =
 0   0  4
  [13] .fini             PROGBITS        00010728 000728 000028 00  AX =
 0   0  4
  [14] .rodata           PROGBITS        00010750 000750 000018 00   A =
 0   0  4
  [15] .PARISC.unwind    PROGBITS        00010768 000768 0000e0 04   A =
 0  12  4
  [16] .eh_frame_hdr     PROGBITS        00010848 000848 000014 00   A =
 0   0  4
  [17] .eh_frame         PROGBITS        0001085c 00085c 000034 00   A =
 0   0  4
  [18] .ctors            PROGBITS        00011890 000890 000008 00  WA =
 0   0  4
  [19] .dtors            PROGBITS        00011898 000898 000008 00  WA =
 0   0  4
  [20] .jcr              PROGBITS        000118a0 0008a0 000004 00  WA =
 0   0  4
  [21] .dynamic          DYNAMIC         000118a4 0008a4 0000c8 08  WA =
 6   0  4
  [22] .data             PROGBITS        0001196c 00096c 000008 00  WA =
 0   0  4
  [23] .plt              PROGBITS        00011974 000974 00004c 08 WAX =
 0   0  4
  [24] .got              PROGBITS        000119c0 0009c0 00001c 04  WA =
 0   0  4
  [25] .bss              NOBITS          000119dc 0009dc 000014 00  WA =
 0   0  4
  [26] .note             NOTE            00000000 0009dc 000028 00     =
 0   0  1
  [27] .comment          PROGBITS        00000000 000a04 000038 01  MS =
 0   0  1
  [28] .shstrtab         STRTAB          00000000 000a3c 000106 00     =
 0   0  1
  [29] .symtab           SYMTAB          00000000 00101c 0004c0 10     =
30  56  4
  [30] .strtab           STRTAB          00000000 0014dc 0002b1 00     =
 0   0  1
Key to Flags:
  W (write), A (alloc), X (execute), M (merge), S (strings)
  I (info), L (link order), G (group), T (TLS), E (exclude), x (unknown=
)
  O (extra OS processing required) o (OS specific), p (processor specif=
ic)

There are no section groups in this file.

Program Headers:
  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Ali=
gn
  PHDR           0x000034 0x00010034 0x00010034 0x000e0 0x000e0 R E 0x4
  INTERP         0x000114 0x00010114 0x00010114 0x0000d 0x0000d R   0x1
      [Requesting program interpreter: /lib/ld.so.1]
  LOAD           0x000000 0x00010000 0x00010000 0x00890 0x00890 R E 0x1=
000
  LOAD           0x000890 0x00011890 0x00011890 0x0014c 0x00160 RWE 0x1=
000
  DYNAMIC        0x0008a4 0x000118a4 0x000118a4 0x000c8 0x000c8 RW  0x4
  NOTE           0x000124 0x00010124 0x00010124 0x00020 0x00020 R   0x4
  GNU_EH_FRAME   0x000848 0x00010848 0x00010848 0x00014 0x00014 R   0x4

 Section to Segment mapping:
  Segment Sections...
   00    =20
   01     .interp=20
   02     .interp .note.ABI-tag .note.gnu.build-id .hash .dynsym .dynst=
r .gnu.version .gnu.version_r .rela.dyn .rela.plt .init .text .fini .ro=
data .PARISC.unwind .eh_frame_hdr .eh_frame=20
   03     .ctors .dtors .jcr .dynamic .data .plt .got .bss=20
   04     .dynamic=20
   05     .note.ABI-tag=20
   06     .eh_frame_hdr=20

Dynamic section at offset 0x8a4 contains 20 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]
 0x0000000c (INIT)                       0x1030c
 0x0000000d (FINI)                       0x10728
 0x00000004 (HASH)                       0x10144
 0x00000005 (STRTAB)                     0x101f8
 0x00000006 (SYMTAB)                     0x10178
 0x0000000a (STRSZ)                      128 (bytes)
 0x0000000b (SYMENT)                     16 (bytes)
 0x00000003 (PLTGOT)                     0x1196c
 0x00000015 (DEBUG)                      0x0
 0x00000002 (PLTRELSZ)                   72 (bytes)
 0x00000014 (PLTREL)                     RELA
 0x00000017 (JMPREL)                     0x102b4
 0x00000007 (RELA)                       0x102a8
 0x00000008 (RELASZ)                     12 (bytes)
 0x00000009 (RELAENT)                    12 (bytes)
 0x6ffffffe (VERNEED)                    0x10288
 0x6fffffff (VERNEEDNUM)                 1
 0x6ffffff0 (VERSYM)                     0x10278
 0x00000000 (NULL)                       0x0

Relocation section '.rela.dyn' at offset 0x2a8 contains 1 entries:
 Offset     Info    Type            Sym.Value  Sym. Name + Addend
000119d0  00000401 R_PARISC_DIR32    000119c0   _GLOBAL_OFFSET_TABLE_ +=
 0

Relocation section '.rela.plt' at offset 0x2b4 contains 6 entries:
 Offset     Info    Type            Sym.Value  Sym. Name + Addend
00011974  00000181 R_PARISC_IPLT     000105ec   __libc_csu_fini + 0
0001197c  00000281 R_PARISC_IPLT     00010724   __gmon_start__ + 0
00011984  00000381 R_PARISC_IPLT     00000000   _Jv_RegisterClasses + 0
0001198c  00000581 R_PARISC_IPLT     000105f0   __libc_csu_init + 0
00011994  00000681 R_PARISC_IPLT     00000000   __libc_start_main + 0
0001199c  00000781 R_PARISC_IPLT     000104a0   main + 0

Unwind section '.PARISC.unwind' at offset 0x768 contains 14 entries:

<_init>: [0x1030c-0x10340]
	Entry_GR=3D1 Save_RP Total_frame_size=3D8=20
<__do_global_dtors_aux>: [0x103a8-0x10438]
	Entry_GR=3D4 Save_RP Total_frame_size=3D8=20
<call___do_global_dtors_aux>: [0x1043c-0x1044c]
	Save_RP Total_frame_size=3D8=20
<frame_dummy>: [0x10450-0x10488]
	Save_RP Total_frame_size=3D8=20
<call_frame_dummy>: [0x1048c-0x1049c]
	Save_RP Total_frame_size=3D8=20
<main>: [0x104a0-0x104bc]
	Entry_GR=3D1 Save_SP Total_frame_size=3D8=20
<main+20>: [0x104c0-0x104d4]
	Millicode=20
<__canonicalize_funcptr_for_compare>: [0x104d8-0x105e8]
	Entry_GR=3D2 Save_RP Total_frame_size=3D8=20
<__libc_csu_fini>: [0x105ec-0x105ec]
=09
<__libc_csu_init>: [0x105f0-0x10694]
	Entry_GR=3D7 Save_RP Total_frame_size=3D16=20
<__do_global_ctors_aux>: [0x10698-0x1070c]
	Entry_GR=3D3 Save_RP Total_frame_size=3D16=20
<call___do_global_ctors_aux>: [0x10710-0x10720]
	Save_RP Total_frame_size=3D8=20
<__gmon_start__>: [0x10724-0x10724]
=09
<_fini>: [0x10728-0x1074c]
	Entry_GR=3D1 Save_RP Total_frame_size=3D8=20

Symbol table '.dynsym' contains 8 entries:
   Num:    Value  Size Type    Bind   Vis      Ndx Name
     0: 00000000     0 NOTYPE  LOCAL  DEFAULT  UND=20
     1: 000105ec     4 FUNC    GLOBAL DEFAULT   12 __libc_csu_fini
     2: 00010724     4 FUNC    WEAK   DEFAULT   12 __gmon_start__
     3: 00000000     0 NOTYPE  WEAK   DEFAULT  UND _Jv_RegisterClasses
     4: 000119c0     0 OBJECT  GLOBAL DEFAULT  ABS _GLOBAL_OFFSET_TABLE=
_
     5: 000105f0   168 FUNC    GLOBAL DEFAULT   12 __libc_csu_init
     6: 00000000     0 FUNC    GLOBAL DEFAULT  UND __libc_start_main@GL=
IBC_2.2 (2)
     7: 000104a0    32 FUNC    GLOBAL DEFAULT   12 main

Symbol table '.symtab' contains 76 entries:
   Num:    Value  Size Type    Bind   Vis      Ndx Name
     0: 00000000     0 NOTYPE  LOCAL  DEFAULT  UND=20
     1: 00010114     0 SECTION LOCAL  DEFAULT    1=20
     2: 00010124     0 SECTION LOCAL  DEFAULT    2=20
     3: 00010144     0 SECTION LOCAL  DEFAULT    3=20
     4: 00010144     0 SECTION LOCAL  DEFAULT    4=20
     5: 00010178     0 SECTION LOCAL  DEFAULT    5=20
     6: 000101f8     0 SECTION LOCAL  DEFAULT    6=20
     7: 00010278     0 SECTION LOCAL  DEFAULT    7=20
     8: 00010288     0 SECTION LOCAL  DEFAULT    8=20
     9: 000102a8     0 SECTION LOCAL  DEFAULT    9=20
    10: 000102b4     0 SECTION LOCAL  DEFAULT   10=20
    11: 000102fc     0 SECTION LOCAL  DEFAULT   11=20
    12: 00010344     0 SECTION LOCAL  DEFAULT   12=20
    13: 00010728     0 SECTION LOCAL  DEFAULT   13=20
    14: 00010750     0 SECTION LOCAL  DEFAULT   14=20
    15: 00010768     0 SECTION LOCAL  DEFAULT   15=20
    16: 00010848     0 SECTION LOCAL  DEFAULT   16=20
    17: 0001085c     0 SECTION LOCAL  DEFAULT   17=20
    18: 00011890     0 SECTION LOCAL  DEFAULT   18=20
    19: 00011898     0 SECTION LOCAL  DEFAULT   19=20
    20: 000118a0     0 SECTION LOCAL  DEFAULT   20=20
    21: 000118a4     0 SECTION LOCAL  DEFAULT   21=20
    22: 0001196c     0 SECTION LOCAL  DEFAULT   22=20
    23: 00011974     0 SECTION LOCAL  DEFAULT   23=20
    24: 000119c0     0 SECTION LOCAL  DEFAULT   24=20
    25: 000119dc     0 SECTION LOCAL  DEFAULT   25=20
    26: 00000000     0 SECTION LOCAL  DEFAULT   26=20
    27: 00000000     0 SECTION LOCAL  DEFAULT   27=20
    28: 00010750     0 NOTYPE  LOCAL  DEFAULT   14 .Lpmain
    29: 0001075c     0 NOTYPE  LOCAL  DEFAULT   14 .Lp__libc_csu_init
    30: 00010758     0 NOTYPE  LOCAL  DEFAULT   14 .Lp__libc_csu_fini
    31: 00011890     0 OBJECT  LOCAL  DEFAULT   18 __CTOR_LIST__
    32: 00011898     0 OBJECT  LOCAL  DEFAULT   19 __DTOR_LIST__
    33: 000118a0     0 OBJECT  LOCAL  DEFAULT   20 __JCR_LIST__
    34: 000103a8   148 FUNC    LOCAL  DEFAULT   12 __do_global_dtors_au=
x
    35: 000119dc     1 OBJECT  LOCAL  DEFAULT   25 completed.5625
    36: 000119e0     4 OBJECT  LOCAL  DEFAULT   25 dtor_idx.5627
    37: 0001043c    20 FUNC    LOCAL  DEFAULT   12 call___do_global_dto=
rs_au
    38: 00010450    60 FUNC    LOCAL  DEFAULT   12 frame_dummy
    39: 0001048c    20 FUNC    LOCAL  DEFAULT   12 call_frame_dummy
    40: 00011894     0 OBJECT  LOCAL  DEFAULT   18 __CTOR_END__
    41: 0001088c     0 OBJECT  LOCAL  DEFAULT   17 __FRAME_END__
    42: 000118a0     0 OBJECT  LOCAL  DEFAULT   20 __JCR_END__
    43: 00010698   120 FUNC    LOCAL  DEFAULT   12 __do_global_ctors_au=
x
    44: 00010710    20 FUNC    LOCAL  DEFAULT   12 call___do_global_cto=
rs_au
    45: 00010340     0 NOTYPE  LOCAL  DEFAULT   11 _end_init
    46: 0001074c     0 NOTYPE  LOCAL  DEFAULT   13 _end_fini
    47: ffffffec     0 NOTYPE  LOCAL  DEFAULT  ABS r31_slot
    48: fffffff0     0 NOTYPE  LOCAL  DEFAULT  ABS sr0_slot
    49: ffffffec     0 NOTYPE  LOCAL  DEFAULT  ABS mrp_slot
    50: 000119e4     4 OBJECT  LOCAL  DEFAULT   25 fixup.1200
    51: 000119e8     8 OBJECT  LOCAL  DEFAULT   25 fixup_plabel.1199
    52: 00011890     0 NOTYPE  LOCAL  DEFAULT   18 __init_array_end
    53: 000104c0    24 PARISC_MILLI LOCAL  DEFAULT   12 $$dyncall
    54: 00011890     0 NOTYPE  LOCAL  DEFAULT   18 __init_array_start
    55: 000118a4     0 OBJECT  LOCAL  DEFAULT   21 _DYNAMIC
    56: 0001196c     0 NOTYPE  WEAK   DEFAULT   22 data_start
    57: 000105ec     4 FUNC    GLOBAL DEFAULT   12 __libc_csu_fini
    58: 00010354    80 FUNC    GLOBAL DEFAULT   12 _start
    59: 00010724     4 FUNC    WEAK   DEFAULT   12 __gmon_start__
    60: 00000000     0 NOTYPE  WEAK   DEFAULT  UND _Jv_RegisterClasses
    61: 00010728     0 FUNC    GLOBAL DEFAULT   13 _fini
    62: 000119c0     0 OBJECT  GLOBAL DEFAULT  ABS _GLOBAL_OFFSET_TABLE=
_
    63: 00010760     4 OBJECT  GLOBAL DEFAULT   14 _IO_stdin_used
    64: 0001196c     0 NOTYPE  GLOBAL DEFAULT   22 __data_start
    65: 0001196c     0 OBJECT  GLOBAL DEFAULT   22 $global$
    66: 00011970     0 OBJECT  GLOBAL HIDDEN    22 __dso_handle
    67: 0001189c     0 OBJECT  GLOBAL HIDDEN    19 __DTOR_END__
    68: 000105f0   168 FUNC    GLOBAL DEFAULT   12 __libc_csu_init
    69: 000119dc     0 NOTYPE  GLOBAL DEFAULT  ABS __bss_start
    70: 000104d8   276 FUNC    GLOBAL HIDDEN    12 __canonicalize_funcp=
tr_fo
    71: 00000000     0 FUNC    GLOBAL DEFAULT  UND __libc_start_main@@G=
LIBC_
    72: 000119f0     0 NOTYPE  GLOBAL DEFAULT  ABS _end
    73: 000119dc     0 NOTYPE  GLOBAL DEFAULT  ABS _edata
    74: 000104a0    32 FUNC    GLOBAL DEFAULT   12 main
    75: 0001030c     0 FUNC    GLOBAL DEFAULT   11 _init

Histogram for bucket list length (total of 3 buckets):
 Length  Number     % of total  Coverage
      0  0          (  0.0%)
      1  1          ( 33.3%)     14.3%
      2  0          (  0.0%)     14.3%
      3  2          ( 66.7%)    100.0%

Version symbols section '.gnu.version' contains 8 entries:
 Addr: 0000000000010278  Offset: 0x000278  Link: 5 (.dynsym)
  000:   0 (*local*)       1 (*global*)      1 (*global*)      0 (*loca=
l*)   =20
  004:   1 (*global*)      1 (*global*)      2 (GLIBC_2.2)     1 (*glob=
al*)  =20

Version needs section '.gnu.version_r' contains 1 entries:
 Addr: 0x0000000000010288  Offset: 0x000288  Link: 6 (.dynstr)
  000000: Version: 1  File: libc.so.6  Cnt: 1
  0x0010:   Name: GLIBC_2.2  Flags: none  Version: 2

Notes at offset 0x00000124 with length 0x00000020:
  Owner		Data size	Description
  GNU		0x00000010	NT_GNU_ABI_TAG (ABI version tag)

Notes at offset 0x000009dc with length 0x00000028:
  Owner		Data size	Description
  01.01		0x00000000	NT_VERSION (version)
  01.01		0x00000000	NT_VERSION (version)
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
