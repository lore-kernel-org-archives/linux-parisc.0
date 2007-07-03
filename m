From: =?ISO-8859-1?Q?S=E9bastien_Bernard?= <seb@frankengul.org>
Subject: Re: [parisc-linux] glibc is broken because of gcc
Date: Wed, 04 Jul 2007 00:36:15 +0200
Message-ID: <468ACF5F.5060903__32745.2357429594$1416624408$gmane$org@frankengul.org>
References: <200707030158.l631wkrg003150@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------070304040203050209060201"
Cc: parisc-linux@lists.parisc-linux.org,
 aurelien@aurel32.net,
 debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200707030158.l631wkrg003150@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a multi-part message in MIME format.
--------------070304040203050209060201
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

John David Anglin a écrit :
>> Here is the readelf of the broken build :
>> seb@hpnux:~/glibc-2.5/build-tree/hppa-libc/rt$ readelf -a ./libc.so 
>> |grep multiple_threads
>>    1230: 0013e328     4 OBJECT  GLOBAL DEFAULT   32
>> __librt_multiple_threads@@GLIBC_PRIVATE
>>    2737: 0013e328     4 OBJECT  LOCAL  HIDDEN   32 __libc_multiple_threads
>>    3961: 0013e328     4 OBJECT  GLOBAL DEFAULT   32 __librt_multiple_threads
>>
>> seb@hpnux:~/dev/glibc/glibc-2.5/build-tree/hppa-libc/rt$ readelf -a
>> librt_pic.a |grep multiple_threads
>>      18: 00000000     0 NOTYPE  GLOBAL HIDDEN  UND __librt_multiple_threads
>>       6: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __librt_multiple_threads
>>       6: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __librt_multiple_threads
>>
>> I don't see anything wrong. Moreover, the readelf on the correct library 
>> gives exactly the same result.
> 
> The error in bug 428509 is:
> 
> ...
> /home/seb/dev/glibc-2.5/build-tree/hppa-libc/rt/librt_pic.a(mq_timedreceive.os):(.text+0x20): more undefined references to `__librt_multiple_threads' follow
> /usr/bin/ld: /home/seb/dev/glibc-2.5/build-tree/hppa-libc/rt/librt.so: hidden symbol `__librt_multiple_threads' isn't defined
> /usr/bin/ld: final link failed: Nonrepresentable section on output
> 
> Looking at gcc PR 20218, it's clear that there are some very subtle
> issues here.  So, it's not clear to me where the problem lies.  It
> could be in glibc (hppa sysdep-cancel.h), binutils or gcc.  The handling
> of the visibility attribute was broken prior to HJL's change, so it
> could have exposed bugs in other packages.
> 
> Because of this, it was a mistake for Debian to backport this change.
> The change is only in the unreleased gcc trunk.
> 
> Since the problem was introduced by a gcc change, I'd start with
> a gcc PR and mention the patch that introduced the regression.
> 
> Could you do glibc builds with the gcc trunk before and after the change?
> It's best to base the PR on an unmodified version of gcc.
> 
> It would help to know the exact details of the linker command that
> fails, the assembler code generated for mq_timedreceive, and the
> __librt_multiple_threads symbols in __librt_multiple_threads librt.so.
> 
> Dave
Here is the detail of the link command done with gcc-4.1-4.1.2-13.

It's not clear want do you want exactly.

I join the result of :
   objdump -d mq_timedreceive.os
   readelf -a libc-cancellation.os
   readelf -a mq_timedreceive.os

Hope this is what you're asking for.

Seb


--------------070304040203050209060201
Content-Type: text/plain;
 name="dump.objdump_timedreceive"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dump.objdump_timedreceive"


mq_timedreceive.os:     file format elf32-hppa-linux

Disassembly of section .text:

00000000 <__GI_mq_timedreceive>:
   0:	6b c2 3f d9 	stw rp,-14(sp)
   4:	4b d6 3f 99 	ldw -34(sp),r22
   8:	08 03 02 41 	copy r3,r1
   c:	08 1e 02 43 	copy sp,r3
  10:	6f c1 00 80 	stw,ma r1,40(sp)
  14:	6b c2 3f d9 	stw rp,-14(sp)
  18:	0f c3 12 99 	stw r3,-4(sp)
  1c:	2a 60 00 00 	addil L%0,r19,r1
  20:	48 3c 00 00 	ldw 0(r1),ret0
  24:	0f 80 10 9c 	ldw 0(ret0),ret0
  28:	8f 80 20 5a 	cmpib,<>,n 0,ret0,5c <__GI_mq_timedreceive+0x5c>
  2c:	08 13 02 43 	copy r19,r3
  30:	e4 00 82 00 	be,l 100(sr2,r0),sr0,r31
  34:	34 14 01 d0 	ldi e8,r20
  38:	34 01 20 01 	ldi -1000,r1
  3c:	8b 81 81 12 	cmpb,>>=,n r1,ret0,cc <__GI_mq_timedreceive+0xcc>
  40:	08 03 02 53 	copy r3,r19
  44:	e8 40 00 00 	b,l 4c <__GI_mq_timedreceive+0x4c>,rp
  48:	08 1c 02 43 	copy ret0,r3
  4c:	08 60 04 03 	sub r0,r3,r3
  50:	0f 83 12 80 	stw r3,0(ret0)
  54:	e8 00 00 e0 	b,l cc <__GI_mq_timedreceive+0xcc>,r0
  58:	34 1c 3f ff 	ldi -1,ret0
  5c:	6b da 3f b9 	stw r26,-24(sp)
  60:	6b d9 3f b1 	stw r25,-28(sp)
  64:	6b d8 3f a9 	stw r24,-2c(sp)
  68:	6b d7 3f a1 	stw r23,-30(sp)
  6c:	6b d6 3f 99 	stw r22,-34(sp)
  70:	e8 40 00 00 	b,l 78 <__GI_mq_timedreceive+0x78>,rp
  74:	08 13 02 43 	copy r19,r3
  78:	4b da 3f b9 	ldw -24(sp),r26
  7c:	4b d9 3f b1 	ldw -28(sp),r25
  80:	4b d8 3f a9 	ldw -2c(sp),r24
  84:	4b d7 3f a1 	ldw -30(sp),r23
  88:	4b d6 3f 99 	ldw -34(sp),r22
  8c:	6b dc 3f d1 	stw ret0,-18(sp)
  90:	e4 00 82 00 	be,l 100(sr2,r0),sr0,r31
  94:	34 14 01 d0 	ldi e8,r20
  98:	08 03 02 53 	copy r3,r19
  9c:	4b da 3f d1 	ldw -18(sp),r26
  a0:	e8 40 00 00 	b,l a8 <__GI_mq_timedreceive+0xa8>,rp
  a4:	6b dc 3f d1 	stw ret0,-18(sp)
  a8:	4b dc 3f d1 	ldw -18(sp),ret0
  ac:	34 01 20 01 	ldi -1000,r1
  b0:	8b 81 80 2a 	cmpb,>>=,n r1,ret0,cc <__GI_mq_timedreceive+0xcc>
  b4:	08 03 02 53 	copy r3,r19
  b8:	08 1c 02 43 	copy ret0,r3
  bc:	e8 40 00 00 	b,l c4 <__GI_mq_timedreceive+0xc4>,rp
  c0:	08 60 04 03 	sub r0,r3,r3
  c4:	0f 83 12 80 	stw r3,0(ret0)
  c8:	34 1c 3f ff 	ldi -1,ret0
  cc:	4b c2 3f 59 	ldw -54(sp),rp
  d0:	4f c3 3f 81 	ldw,mb -40(sp),r3
  d4:	e8 40 c0 02 	bv,n r0(rp)

--------------070304040203050209060201
Content-Type: text/plain;
 name="dump.readelf_libc-cancel"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dump.readelf_libc-cancel"

ELF Header:
  Magic:   7f 45 4c 46 01 02 01 03 00 00 00 00 00 00 00 00 
  Class:                             ELF32
  Data:                              2's complement, big endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - Linux
  ABI Version:                       0
  Type:                              REL (Relocatable file)
  Machine:                           HPPA
  Version:                           0x1
  Entry point address:               0x0
  Start of program headers:          0 (bytes into file)
  Start of section headers:          18152 (bytes into file)
  Flags:                             0x210, PA-RISC 1.1
  Size of this header:               52 (bytes)
  Size of program headers:           0 (bytes)
  Number of program headers:         0
  Size of section headers:           40 (bytes)
  Number of section headers:         25
  Section header string table index: 22

Section Headers:
  [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
  [ 0]                   NULL            00000000 000000 000000 00      0   0  0
  [ 1] .text             PROGBITS        00000000 000034 000080 00  AX  0   0  4
  [ 2] .rela.text        RELA            00000000 004dac 000024 0c     23   1  4
  [ 3] .data             PROGBITS        00000000 0000b4 000000 00  WA  0   0  1
  [ 4] .bss              NOBITS          00000000 0000b4 000004 00  WA  0   0  4
  [ 5] .note             NOTE            00000000 0000b4 000014 00      0   0  1
  [ 6] .debug_abbrev     PROGBITS        00000000 0000c8 000254 00      0   0  1
  [ 7] .debug_info       PROGBITS        00000000 00031c 00242d 00      0   0  1
  [ 8] .rela.debug_info  RELA            00000000 004dd0 0018fc 0c     23   7  4
  [ 9] .debug_line       PROGBITS        00000000 002749 000402 00      0   0  1
  [10] .rela.debug_line  RELA            00000000 0066cc 00000c 0c     23   9  4
  [11] .PARISC.unwind    PROGBITS        00000000 002b4c 000020 04   A  0   1  4
  [12] .rela.PARISC.unwi RELA            00000000 0066d8 000030 0c     23  11  4
  [13] .debug_frame      PROGBITS        00000000 002b6c 00003c 00      0   0  4
  [14] .rela.debug_frame RELA            00000000 006708 000030 0c     23  13  4
  [15] .debug_loc        PROGBITS        00000000 002ba8 000045 00      0   0  1
  [16] .debug_pubnames   PROGBITS        00000000 002bed 0000ac 00      0   0  1
  [17] .rela.debug_pubna RELA            00000000 006738 00000c 0c     23  16  4
  [18] .debug_aranges    PROGBITS        00000000 002c99 000020 00      0   0  1
  [19] .rela.debug_arang RELA            00000000 006744 000018 0c     23  18  4
  [20] .debug_str        PROGBITS        00000000 002cb9 00191e 01  MS  0   0  1
  [21] .comment          PROGBITS        00000000 0045d7 00003a 00      0   0  1
  [22] .shstrtab         STRTAB          00000000 004611 0000d5 00      0   0  1
  [23] .symtab           SYMTAB          00000000 004ad0 0001c0 10     24  15  4
  [24] .strtab           STRTAB          00000000 004c90 000119 00      0   0  1
Key to Flags:
  W (write), A (alloc), X (execute), M (merge), S (strings)
  I (info), L (link order), G (group), x (unknown)
  O (extra OS processing required) o (OS specific), p (processor specific)

There are no section groups in this file.

There are no program headers in this file.

Relocation section '.rela.text' at offset 0x4dac contains 3 entries:
 Offset     Info    Type            Sym.Value  Sym. Name + Addend
0000004c  00001422 R_PARISC_DLTIND21 00000000   __libc_pthread_functio + 0
00000054  00001426 R_PARISC_DLTIND14 00000000   __libc_pthread_functio + 0
00000064  0000150c R_PARISC_PCREL17F 00000000   $$dyncall + 0

Relocation section '.rela.debug_info' at offset 0x4dd0 contains 533 entries:
 Offset     Info    Type            Sym.Value  Sym. Name + Addend
00000006  00000401 R_PARISC_DIR32    00000000   .debug_abbrev + 0
0000000c  00000601 R_PARISC_DIR32    00000000   .debug_line + 0
00000010  00000101 R_PARISC_DIR32    00000000   .text + 80
00000014  00000101 R_PARISC_DIR32    00000000   .text + 0
00000018  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1814
0000001d  00000b01 R_PARISC_DIR32    00000000   .debug_str + 755
00000021  00000b01 R_PARISC_DIR32    00000000   .debug_str + 7bb
0000002d  00000b01 R_PARISC_DIR32    00000000   .debug_str + 82f
00000038  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1859
0000003f  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1579
0000004a  00000b01 R_PARISC_DIR32    00000000   .debug_str + 5d7
00000051  00000b01 R_PARISC_DIR32    00000000   .debug_str + 67c
0000005c  00000b01 R_PARISC_DIR32    00000000   .debug_str + ca1
00000063  00000b01 R_PARISC_DIR32    00000000   .debug_str + 25d
0000006e  00000b01 R_PARISC_DIR32    00000000   .debug_str + eb8
00000079  00000b01 R_PARISC_DIR32    00000000   .debug_str + ffc
00000080  00000b01 R_PARISC_DIR32    00000000   .debug_str + cca
00000087  00000b01 R_PARISC_DIR32    00000000   .debug_str + 188e
0000008e  00000b01 R_PARISC_DIR32    00000000   .debug_str + 61c
00000095  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1487
0000009c  00000b01 R_PARISC_DIR32    00000000   .debug_str + 18f6
000000a7  00000b01 R_PARISC_DIR32    00000000   .debug_str + 45a
000000b2  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1c3
000000bd  00000b01 R_PARISC_DIR32    00000000   .debug_str + ec1
000000c4  00000b01 R_PARISC_DIR32    00000000   .debug_str + d57
000000cf  00000b01 R_PARISC_DIR32    00000000   .debug_str + 2e6
000000da  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1859
000000e1  00000b01 R_PARISC_DIR32    00000000   .debug_str + 41f
000000ec  00000b01 R_PARISC_DIR32    00000000   .debug_str + 6b8
000000fd  00000b01 R_PARISC_DIR32    00000000   .debug_str + 10c7
00000104  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1506
0000010f  00000b01 R_PARISC_DIR32    00000000   .debug_str + 305
0000011a  00000b01 R_PARISC_DIR32    00000000   .debug_str + 126d
00000125  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1cb
00000130  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1898
0000013b  00000b01 R_PARISC_DIR32    00000000   .debug_str + 666
00000146  00000b01 R_PARISC_DIR32    00000000   .debug_str + 14e8
00000159  00000b01 R_PARISC_DIR32    00000000   .debug_str + ace
00000178  00000b01 R_PARISC_DIR32    00000000   .debug_str + 362
00000183  00000b01 R_PARISC_DIR32    00000000   .debug_str + da7
00000192  00000b01 R_PARISC_DIR32    00000000   .debug_str + a7b
0000019a  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1467
000001a8  00000b01 R_PARISC_DIR32    00000000   .debug_str + 16a3
000001bb  00000b01 R_PARISC_DIR32    00000000   .debug_str + 6fc
000001c3  00000b01 R_PARISC_DIR32    00000000   .debug_str + 14be
000001da  00000b01 R_PARISC_DIR32    00000000   .debug_str + 11eb
00000202  00000b01 R_PARISC_DIR32    00000000   .debug_str + 794
0000020a  00000b01 R_PARISC_DIR32    00000000   .debug_str + a50
00000218  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1915
00000227  00000b01 R_PARISC_DIR32    00000000   .debug_str + fdb
0000023c  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1135
00000245  00000b01 R_PARISC_DIR32    00000000   .debug_str + 150d
00000253  00000b01 R_PARISC_DIR32    00000000   .debug_str + 781
00000261  00000b01 R_PARISC_DIR32    00000000   .debug_str + 14f2
0000026f  00000b01 R_PARISC_DIR32    00000000   .debug_str + 149
0000027d  00000b01 R_PARISC_DIR32    00000000   .debug_str + e37
0000028b  00000b01 R_PARISC_DIR32    00000000   .debug_str + 11e5
00000299  00000b01 R_PARISC_DIR32    00000000   .debug_str + 7fb
000002a7  00000b01 R_PARISC_DIR32    00000000   .debug_str + 163b
000002b5  00000b01 R_PARISC_DIR32    00000000   .debug_str + 22a
000002c3  00000b01 R_PARISC_DIR32    00000000   .debug_str + 138d
000002d1  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1245
000002df  00000b01 R_PARISC_DIR32    00000000   .debug_str + b37
000002ed  00000b01 R_PARISC_DIR32    00000000   .debug_str + d9a
000002fb  00000b01 R_PARISC_DIR32    00000000   .debug_str + 387
00000309  00000b01 R_PARISC_DIR32    00000000   .debug_str + d4e
00000317  00000b01 R_PARISC_DIR32    00000000   .debug_str + e93
00000325  00000b01 R_PARISC_DIR32    00000000   .debug_str + fd1
00000333  00000b01 R_PARISC_DIR32    00000000   .debug_str + e9c
00000341  00000b01 R_PARISC_DIR32    00000000   .debug_str + 13a4
0000034f  00000b01 R_PARISC_DIR32    00000000   .debug_str + 4cb
0000035d  00000b01 R_PARISC_DIR32    00000000   .debug_str + 214
0000036b  00000b01 R_PARISC_DIR32    00000000   .debug_str + b81
00000379  00000b01 R_PARISC_DIR32    00000000   .debug_str + c2c
00000387  00000b01 R_PARISC_DIR32    00000000   .debug_str + 12cc
00000395  00000b01 R_PARISC_DIR32    00000000   .debug_str + 186d
000003a3  00000b01 R_PARISC_DIR32    00000000   .debug_str + e26
000003b2  00000b01 R_PARISC_DIR32    00000000   .debug_str + b0a
000003c1  00000b01 R_PARISC_DIR32    00000000   .debug_str + c64
000003d0  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1159
000003df  00000b01 R_PARISC_DIR32    00000000   .debug_str + 512
000003ee  00000b01 R_PARISC_DIR32    00000000   .debug_str + 6d8
000003fd  00000b01 R_PARISC_DIR32    00000000   .debug_str + 159f
0000040c  00000b01 R_PARISC_DIR32    00000000   .debug_str + 2bb
0000041b  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1f2
0000042a  00000b01 R_PARISC_DIR32    00000000   .debug_str + 16b3
00000439  00000b01 R_PARISC_DIR32    00000000   .debug_str + add
00000448  00000b01 R_PARISC_DIR32    00000000   .debug_str + 284
00000457  00000b01 R_PARISC_DIR32    00000000   .debug_str + 3ab
00000466  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1165
00000475  00000b01 R_PARISC_DIR32    00000000   .debug_str + a5b
00000484  00000b01 R_PARISC_DIR32    00000000   .debug_str + 9e1
00000493  00000b01 R_PARISC_DIR32    00000000   .debug_str + 54c
000004a2  00000b01 R_PARISC_DIR32    00000000   .debug_str + 88b
000004b1  00000b01 R_PARISC_DIR32    00000000   .debug_str + 582
000004c0  00000b01 R_PARISC_DIR32    00000000   .debug_str + 8
000004d4  00000b01 R_PARISC_DIR32    00000000   .debug_str + 162a
000004dc  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1d2
000004ea  00000b01 R_PARISC_DIR32    00000000   .debug_str + 922
000004f8  00000b01 R_PARISC_DIR32    00000000   .debug_str + 134f
00000506  00000b01 R_PARISC_DIR32    00000000   .debug_str + 16d9
00000514  00000b01 R_PARISC_DIR32    00000000   .debug_str + 16ab
00000522  00000b01 R_PARISC_DIR32    00000000   .debug_str + 15ea
00000530  00000b01 R_PARISC_DIR32    00000000   .debug_str + af
0000053e  00000b01 R_PARISC_DIR32    00000000   .debug_str + 592
0000054c  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1299
0000055d  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1590
00000568  00000b01 R_PARISC_DIR32    00000000   .debug_str + 100e
0000057b  00000b01 R_PARISC_DIR32    00000000   .debug_str + 18e4
00000589  00000b01 R_PARISC_DIR32    00000000   .debug_str + 3b7
00000597  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1650
000005a5  00000b01 R_PARISC_DIR32    00000000   .debug_str + 0
000005c4  00000b01 R_PARISC_DIR32    00000000   .debug_str + b28
000005d7  00000b01 R_PARISC_DIR32    00000000   .debug_str + 133a
000005e6  00000b01 R_PARISC_DIR32    00000000   .debug_str + bee
000005f9  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1676
00000607  00000b01 R_PARISC_DIR32    00000000   .debug_str + 45
00000615  00000b01 R_PARISC_DIR32    00000000   .debug_str + 13b6
00000623  00000b01 R_PARISC_DIR32    00000000   .debug_str + 695
00000631  00000b01 R_PARISC_DIR32    00000000   .debug_str + 36d
00000640  00000b01 R_PARISC_DIR32    00000000   .debug_str + 5f9
00000653  00000b01 R_PARISC_DIR32    00000000   .debug_str + 57
00000662  00000b01 R_PARISC_DIR32    00000000   .debug_str + c18
00000671  00000b01 R_PARISC_DIR32    00000000   .debug_str + aa9
00000679  00000b01 R_PARISC_DIR32    00000000   .debug_str + 12ae
00000687  00000b01 R_PARISC_DIR32    00000000   .debug_str + 869
00000695  00000b01 R_PARISC_DIR32    00000000   .debug_str + 670
000006a3  00000b01 R_PARISC_DIR32    00000000   .debug_str + 729
000006b1  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1520
000006bf  00000b01 R_PARISC_DIR32    00000000   .debug_str + 15af
000006cd  00000b01 R_PARISC_DIR32    00000000   .debug_str + 659
000006dc  00000b01 R_PARISC_DIR32    00000000   .debug_str + 231
000006e7  00000b01 R_PARISC_DIR32    00000000   .debug_str + 402
000006f3  00000b01 R_PARISC_DIR32    00000000   .debug_str + a9
000006fa  00000b01 R_PARISC_DIR32    00000000   .debug_str + 851
00000705  00000b01 R_PARISC_DIR32    00000000   .debug_str + 160
00000710  00000b01 R_PARISC_DIR32    00000000   .debug_str + d89
0000071b  00000b01 R_PARISC_DIR32    00000000   .debug_str + a9d
0000072a  00000b01 R_PARISC_DIR32    00000000   .debug_str + 18ff
00000732  00000b01 R_PARISC_DIR32    00000000   .debug_str + 3a0
00000740  00000b01 R_PARISC_DIR32    00000000   .debug_str + 4b0
0000074e  00000b01 R_PARISC_DIR32    00000000   .debug_str + 14a9
0000075c  00000b01 R_PARISC_DIR32    00000000   .debug_str + 18b
00000775  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1709
0000077d  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1426
0000078b  00000b01 R_PARISC_DIR32    00000000   .debug_str + 190b
00000799  00000b01 R_PARISC_DIR32    00000000   .debug_str + 937
000007a7  00000b01 R_PARISC_DIR32    00000000   .debug_str + b1e
000007b5  00000b01 R_PARISC_DIR32    00000000   .debug_str + 10cc
000007d5  00000b01 R_PARISC_DIR32    00000000   .debug_str + 194
000007e0  00000b01 R_PARISC_DIR32    00000000   .debug_str + 118d
000007ef  00000b01 R_PARISC_DIR32    00000000   .debug_str + fa2
000007f7  00000b01 R_PARISC_DIR32    00000000   .debug_str + 329
0000080e  00000b01 R_PARISC_DIR32    00000000   .debug_str + 189e
00000819  00000b01 R_PARISC_DIR32    00000000   .debug_str + f4e
00000824  00000b01 R_PARISC_DIR32    00000000   .debug_str + 10e6
00000864  00000b01 R_PARISC_DIR32    00000000   .debug_str + ad4
0000086c  00000b01 R_PARISC_DIR32    00000000   .debug_str + eb2
000008a3  00000b01 R_PARISC_DIR32    00000000   .debug_str + 110f
000008a9  00000b01 R_PARISC_DIR32    00000000   .debug_str + 80b
000008af  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1238
000008b5  00000b01 R_PARISC_DIR32    00000000   .debug_str + 14fd
000008bb  00000b01 R_PARISC_DIR32    00000000   .debug_str + 8b
000008c2  00000b01 R_PARISC_DIR32    00000000   .debug_str + 2ee
000008cd  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1175
0000092f  00000b01 R_PARISC_DIR32    00000000   .debug_str + 17c
00000971  00000b01 R_PARISC_DIR32    00000000   .debug_str + 8d3
0000097f  00000b01 R_PARISC_DIR32    00000000   .debug_str + 27f
00000996  00000b01 R_PARISC_DIR32    00000000   .debug_str + 78c
000009a4  00000b01 R_PARISC_DIR32    00000000   .debug_str + 11f0
000009b2  00000b01 R_PARISC_DIR32    00000000   .debug_str + cd6
000009c0  00000b01 R_PARISC_DIR32    00000000   .debug_str + 9ad
000009ce  00000b01 R_PARISC_DIR32    00000000   .debug_str + 17c2
000009dc  00000b01 R_PARISC_DIR32    00000000   .debug_str + 13f4
000009ea  00000b01 R_PARISC_DIR32    00000000   .debug_str + d28
00000a3c  00000b01 R_PARISC_DIR32    00000000   .debug_str + 146e
00000a5c  00000b01 R_PARISC_DIR32    00000000   .debug_str + d3b
00000a65  00000b01 R_PARISC_DIR32    00000000   .debug_str + abb
00000a73  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1458
00000a81  00000b01 R_PARISC_DIR32    00000000   .debug_str + 18dc
00000a8f  00000b01 R_PARISC_DIR32    00000000   .debug_str + 78c
00000a9d  00000b01 R_PARISC_DIR32    00000000   .debug_str + 8d8
00000ab8  00000b01 R_PARISC_DIR32    00000000   .debug_str + 15f6
00000ac6  00000b01 R_PARISC_DIR32    00000000   .debug_str + d32
00000ad4  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1866
00000ae3  00000b01 R_PARISC_DIR32    00000000   .debug_str + 488
00000af5  00000b01 R_PARISC_DIR32    00000000   .debug_str + 97c
00000b07  00000b01 R_PARISC_DIR32    00000000   .debug_str + 884
00000b16  00000b01 R_PARISC_DIR32    00000000   .debug_str + 801
00000b25  00000b01 R_PARISC_DIR32    00000000   .debug_str + 103e
00000b34  00000b01 R_PARISC_DIR32    00000000   .debug_str + 945
00000b43  00000b01 R_PARISC_DIR32    00000000   .debug_str + bc3
00000b52  00000b01 R_PARISC_DIR32    00000000   .debug_str + 609
00000b61  00000b01 R_PARISC_DIR32    00000000   .debug_str + 19e
00000bd3  00000b01 R_PARISC_DIR32    00000000   .debug_str + 712
00000bdb  00000b01 R_PARISC_DIR32    00000000   .debug_str + 14be
00000bea  00000b01 R_PARISC_DIR32    00000000   .debug_str + 18a7
00000c05  00000b01 R_PARISC_DIR32    00000000   .debug_str + 12d9
00000c10  00000b01 R_PARISC_DIR32    00000000   .debug_str + 566
00000c19  00000b01 R_PARISC_DIR32    00000000   .debug_str + e8a
00000c27  00000b01 R_PARISC_DIR32    00000000   .debug_str + efd
00000c36  00000b01 R_PARISC_DIR32    00000000   .debug_str + 7e
00000c56  00000b01 R_PARISC_DIR32    00000000   .debug_str + d02
00000c61  00000b01 R_PARISC_DIR32    00000000   .debug_str + c55
00000c82  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1543
00000c8a  00000b01 R_PARISC_DIR32    00000000   .debug_str + 9d7
00000c95  00000b01 R_PARISC_DIR32    00000000   .debug_str + 450
00000ca1  00000b01 R_PARISC_DIR32    00000000   .debug_str + 13eb
00000cb4  00000b01 R_PARISC_DIR32    00000000   .debug_str + d47
00000cc2  00000b01 R_PARISC_DIR32    00000000   .debug_str + bf
00000cd9  00000b01 R_PARISC_DIR32    00000000   .debug_str + c01
00000ce7  00000b01 R_PARISC_DIR32    00000000   .debug_str + 15df
00000cf5  00000b01 R_PARISC_DIR32    00000000   .debug_str + 135c
00000d0c  00000b01 R_PARISC_DIR32    00000000   .debug_str + d47
00000d1a  00000b01 R_PARISC_DIR32    00000000   .debug_str + bf
00000d28  00000b01 R_PARISC_DIR32    00000000   .debug_str + 135c
00000d3f  00000b01 R_PARISC_DIR32    00000000   .debug_str + d47
00000d4d  00000b01 R_PARISC_DIR32    00000000   .debug_str + bf
00000d5b  00000b01 R_PARISC_DIR32    00000000   .debug_str + 105c
00000d69  00000b01 R_PARISC_DIR32    00000000   .debug_str + 145e
00000d77  00000b01 R_PARISC_DIR32    00000000   .debug_str + 462
00000d8e  00000b01 R_PARISC_DIR32    00000000   .debug_str + 95e
00000da5  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1291
00000db3  00000b01 R_PARISC_DIR32    00000000   .debug_str + 14cf
00000dca  00000b01 R_PARISC_DIR32    00000000   .debug_str + 324
00000dd5  00000b01 R_PARISC_DIR32    00000000   .debug_str + 13c8
00000de0  00000b01 R_PARISC_DIR32    00000000   .debug_str + 2fe
00000df6  00000b01 R_PARISC_DIR32    00000000   .debug_str + 23b
00000e01  00000b01 R_PARISC_DIR32    00000000   .debug_str + 144e
00000e0c  00000b01 R_PARISC_DIR32    00000000   .debug_str + 157
00000e2c  00000b01 R_PARISC_DIR32    00000000   .debug_str + 12e0
00000e34  00000b01 R_PARISC_DIR32    00000000   .debug_str + 11f6
00000e42  00000b01 R_PARISC_DIR32    00000000   .debug_str + 221
00000e50  00000b01 R_PARISC_DIR32    00000000   .debug_str + ed7
00000e5e  00000b01 R_PARISC_DIR32    00000000   .debug_str + 11cc
00000e6d  00000b01 R_PARISC_DIR32    00000000   .debug_str + 15fd
00000e80  00000b01 R_PARISC_DIR32    00000000   .debug_str + 149e
00000e8b  00000b01 R_PARISC_DIR32    00000000   .debug_str + eca
00000ebd  00000b01 R_PARISC_DIR32    00000000   .debug_str + 290
00000ec5  00000b01 R_PARISC_DIR32    00000000   .debug_str + f7d
00000ed3  00000b01 R_PARISC_DIR32    00000000   .debug_str + 18ed
00000ee1  00000b01 R_PARISC_DIR32    00000000   .debug_str + 90f
00000ef0  00000b01 R_PARISC_DIR32    00000000   .debug_str + 64b
00000f06  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1793
00000f15  00000b01 R_PARISC_DIR32    00000000   .debug_str + a38
00000f1d  00000b01 R_PARISC_DIR32    00000000   .debug_str + 836
00000f2b  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1197
00000f39  00000b01 R_PARISC_DIR32    00000000   .debug_str + 10a0
00000f47  00000b01 R_PARISC_DIR32    00000000   .debug_str + 9a6
00000f6e  00000b01 R_PARISC_DIR32    00000000   .debug_str + 816
00000f7d  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1662
00000f92  00000b01 R_PARISC_DIR32    00000000   .debug_str + 13c0
00000fa0  00000b01 R_PARISC_DIR32    00000000   .debug_str + f9d
00000fae  00000b01 R_PARISC_DIR32    00000000   .debug_str + 187a
00000fbc  00000b01 R_PARISC_DIR32    00000000   .debug_str + b44
00000fca  00000b01 R_PARISC_DIR32    00000000   .debug_str + c87
00000fd8  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1342
00000fe6  00000b01 R_PARISC_DIR32    00000000   .debug_str + 769
00000ff4  00000b01 R_PARISC_DIR32    00000000   .debug_str + 982
00001002  00000b01 R_PARISC_DIR32    00000000   .debug_str + e12
0000101b  00000b01 R_PARISC_DIR32    00000000   .debug_str + 114b
00001023  00000b01 R_PARISC_DIR32    00000000   .debug_str + 71e
00001042  00000b01 R_PARISC_DIR32    00000000   .debug_str + 140f
00001055  00000b01 R_PARISC_DIR32    00000000   .debug_str + 17c9
0000105b  00000b01 R_PARISC_DIR32    00000000   .debug_str + 392
00001061  00000b01 R_PARISC_DIR32    00000000   .debug_str + 95
00001067  00000b01 R_PARISC_DIR32    00000000   .debug_str + 244
0000106d  00000b01 R_PARISC_DIR32    00000000   .debug_str + 40a
00001073  00000b01 R_PARISC_DIR32    00000000   .debug_str + 175b
00001079  00000b01 R_PARISC_DIR32    00000000   .debug_str + ea6
0000107f  00000b01 R_PARISC_DIR32    00000000   .debug_str + 330
00001085  00000b01 R_PARISC_DIR32    00000000   .debug_str + 30d
0000108b  00000b01 R_PARISC_DIR32    00000000   .debug_str + 169
00001091  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1607
00001097  00000b01 R_PARISC_DIR32    00000000   .debug_str + 917
0000109d  00000b01 R_PARISC_DIR32    00000000   .debug_str + 9b6
000010a3  00000b01 R_PARISC_DIR32    00000000   .debug_str + 94b
000010a9  00000b01 R_PARISC_DIR32    00000000   .debug_str + b8c
000010af  00000b01 R_PARISC_DIR32    00000000   .debug_str + bad
000010b5  00000b01 R_PARISC_DIR32    00000000   .debug_str + 125c
000010bb  00000b01 R_PARISC_DIR32    00000000   .debug_str + 351
000010c1  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1848
000010c8  00000b01 R_PARISC_DIR32    00000000   .debug_str + 8fd
000010db  00000b01 R_PARISC_DIR32    00000000   .debug_str + 3c3
000010e9  00000b01 R_PARISC_DIR32    00000000   .debug_str + 173
000010f7  00000b01 R_PARISC_DIR32    00000000   .debug_str + 4a6
00001106  00000b01 R_PARISC_DIR32    00000000   .debug_str + 5c2
00001111  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1396
00001121  00000b01 R_PARISC_DIR32    00000000   .debug_str + a19
00001129  00000b01 R_PARISC_DIR32    00000000   .debug_str + 141f
00001137  00000b01 R_PARISC_DIR32    00000000   .debug_str + b68
00001145  00000b01 R_PARISC_DIR32    00000000   .debug_str + 416
0000115e  00000b01 R_PARISC_DIR32    00000000   .debug_str + 13fc
00001166  00000b01 R_PARISC_DIR32    00000000   .debug_str + 5d0
00001174  00000b01 R_PARISC_DIR32    00000000   .debug_str + 17a6
0000118d  00000b01 R_PARISC_DIR32    00000000   .debug_str + 824
000011a2  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1a5
000011bb  00000b01 R_PARISC_DIR32    00000000   .debug_str + b55
000011c3  00000b01 R_PARISC_DIR32    00000000   .debug_str + 574
000011df  00000b01 R_PARISC_DIR32    00000000   .debug_str + 27f
000011ed  00000b01 R_PARISC_DIR32    00000000   .debug_str + 147b
000011fc  00000b01 R_PARISC_DIR32    00000000   .debug_str + bb8
00001226  00000b01 R_PARISC_DIR32    00000000   .debug_str + 2b
0000122e  00000b01 R_PARISC_DIR32    00000000   .debug_str + 179c
0000123c  00000b01 R_PARISC_DIR32    00000000   .debug_str + b9b
00001266  00000b01 R_PARISC_DIR32    00000000   .debug_str + 11ab
00001275  00000b01 R_PARISC_DIR32    00000000   .debug_str + 315
0000127d  00000b01 R_PARISC_DIR32    00000000   .debug_str + 13ce
0000128b  00000b01 R_PARISC_DIR32    00000000   .debug_str + f72
0000129e  00000b01 R_PARISC_DIR32    00000000   .debug_str + 33c
000012a6  00000b01 R_PARISC_DIR32    00000000   .debug_str + faa
000012b4  00000b01 R_PARISC_DIR32    00000000   .debug_str + 70a
000012c2  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1030
000012dd  00000b01 R_PARISC_DIR32    00000000   .debug_str + cb4
00001330  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1184
00001338  00000b01 R_PARISC_DIR32    00000000   .debug_str + 19e
00001347  00000b01 R_PARISC_DIR32    00000000   .debug_str + 155a
00001356  00000b01 R_PARISC_DIR32    00000000   .debug_str + f2f
00001365  00000b01 R_PARISC_DIR32    00000000   .debug_str + d7b
00001374  00000b01 R_PARISC_DIR32    00000000   .debug_str + e42
00001383  00000b01 R_PARISC_DIR32    00000000   .debug_str + b10
00001392  00000b01 R_PARISC_DIR32    00000000   .debug_str + 11a
000013a1  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1102
000013b0  00000b01 R_PARISC_DIR32    00000000   .debug_str + e3
000013bf  00000b01 R_PARISC_DIR32    00000000   .debug_str + 8b4
000013ce  00000b01 R_PARISC_DIR32    00000000   .debug_str + 154a
000013dd  00000b01 R_PARISC_DIR32    00000000   .debug_str + be1
000013ec  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1273
000013fb  00000b01 R_PARISC_DIR32    00000000   .debug_str + 545
0000140a  00000b01 R_PARISC_DIR32    00000000   .debug_str + 4f
00001419  00000b01 R_PARISC_DIR32    00000000   .debug_str + 166e
00001428  00000b01 R_PARISC_DIR32    00000000   .debug_str + 10da
00001437  00000b01 R_PARISC_DIR32    00000000   .debug_str + 14b2
00001446  00000b01 R_PARISC_DIR32    00000000   .debug_str + 18b1
00001455  00000b01 R_PARISC_DIR32    00000000   .debug_str + ef
00001464  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1ec
00001473  00000b01 R_PARISC_DIR32    00000000   .debug_str + d92
00001482  00000b01 R_PARISC_DIR32    00000000   .debug_str + 12a5
00001491  00000b01 R_PARISC_DIR32    00000000   .debug_str + 953
000014a0  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1582
000014af  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1441
000014be  00000b01 R_PARISC_DIR32    00000000   .debug_str + 876
000014cd  00000b01 R_PARISC_DIR32    00000000   .debug_str + e31
000014dc  00000b01 R_PARISC_DIR32    00000000   .debug_str + 22
000014ec  00000b01 R_PARISC_DIR32    00000000   .debug_str + 930
00001500  00000b01 R_PARISC_DIR32    00000000   .debug_str + e6a
0000150b  00000b01 R_PARISC_DIR32    00000000   .debug_str + 908
0000151f  00000b01 R_PARISC_DIR32    00000000   .debug_str + 849
0000152d  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1374
0000153c  00000b01 R_PARISC_DIR32    00000000   .debug_str + f91
00001547  00000b01 R_PARISC_DIR32    00000000   .debug_str + ef1
00001595  00000b01 R_PARISC_DIR32    00000000   .debug_str + 174e
0000159d  00000b01 R_PARISC_DIR32    00000000   .debug_str + 63
000015ab  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1646
000015b9  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1252
000015c7  00000b01 R_PARISC_DIR32    00000000   .debug_str + 72
000015d5  00000b01 R_PARISC_DIR32    00000000   .debug_str + 446
000015e3  00000b01 R_PARISC_DIR32    00000000   .debug_str + 17ac
000015f1  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1e0
000015ff  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1025
0000160d  00000b01 R_PARISC_DIR32    00000000   .debug_str + 5b8
0000161b  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1716
00001629  00000b01 R_PARISC_DIR32    00000000   .debug_str + edf
00001637  00000b01 R_PARISC_DIR32    00000000   .debug_str + 17b2
00001645  00000b01 R_PARISC_DIR32    00000000   .debug_str + 859
00001653  00000b01 R_PARISC_DIR32    00000000   .debug_str + 9e
00001661  00000b01 R_PARISC_DIR32    00000000   .debug_str + 53e
0000167a  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1567
00001682  00000b01 R_PARISC_DIR32    00000000   .debug_str + 840
00001690  00000b01 R_PARISC_DIR32    00000000   .debug_str + cf6
0000169e  00000b01 R_PARISC_DIR32    00000000   .debug_str + 13ae
000016ac  00000b01 R_PARISC_DIR32    00000000   .debug_str + 13d6
000016ba  00000b01 R_PARISC_DIR32    00000000   .debug_str + 11d6
000016c8  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1217
000016d6  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1779
000016e4  00000b01 R_PARISC_DIR32    00000000   .debug_str + 3fa
00001716  00000b01 R_PARISC_DIR32    00000000   .debug_str + 4b9
0000173c  00000b01 R_PARISC_DIR32    00000000   .debug_str + 376
0000175d  00000b01 R_PARISC_DIR32    00000000   .debug_str + db0
0000177a  00000b01 R_PARISC_DIR32    00000000   .debug_str + f3c
000017be  00000b01 R_PARISC_DIR32    00000000   .debug_str + e70
000017f9  00000b01 R_PARISC_DIR32    00000000   .debug_str + 29a
00001808  00000b01 R_PARISC_DIR32    00000000   .debug_str + fb2
00001810  00000b01 R_PARISC_DIR32    00000000   .debug_str + bd5
0000181e  00000b01 R_PARISC_DIR32    00000000   .debug_str + 5e5
0000182c  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1769
0000183a  00000b01 R_PARISC_DIR32    00000000   .debug_str + 53e
00001848  00000b01 R_PARISC_DIR32    00000000   .debug_str + c08
0000185d  00000b01 R_PARISC_DIR32    00000000   .debug_str + f19
00001873  00000b01 R_PARISC_DIR32    00000000   .debug_str + cde
0000187b  00000b01 R_PARISC_DIR32    00000000   .debug_str + c0f
00001889  00000b01 R_PARISC_DIR32    00000000   .debug_str + 18d4
00001897  00000b01 R_PARISC_DIR32    00000000   .debug_str + 53e
000018bd  00000b01 R_PARISC_DIR32    00000000   .debug_str + 169e
000018cb  00000b01 R_PARISC_DIR32    00000000   .debug_str + 53e
000018e2  00000b01 R_PARISC_DIR32    00000000   .debug_str + 169e
000018ed  00000b01 R_PARISC_DIR32    00000000   .debug_str + 2b0
000018f9  00000b01 R_PARISC_DIR32    00000000   .debug_str + 55b
00001904  00000b01 R_PARISC_DIR32    00000000   .debug_str + 611
0000190f  00000b01 R_PARISC_DIR32    00000000   .debug_str + f0e
00001917  00000b01 R_PARISC_DIR32    00000000   .debug_str + 9fc
00001925  00000b01 R_PARISC_DIR32    00000000   .debug_str + bcf
00001933  00000b01 R_PARISC_DIR32    00000000   .debug_str + 127c
00001952  00000b01 R_PARISC_DIR32    00000000   .debug_str + 995
0000195a  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1081
00001960  00000b01 R_PARISC_DIR32    00000000   .debug_str + 10f0
00001966  00000b01 R_PARISC_DIR32    00000000   .debug_str + a6b
0000196c  00000b01 R_PARISC_DIR32    00000000   .debug_str + af9
00001977  00000b01 R_PARISC_DIR32    00000000   .debug_str + fc5
0000197f  00000b01 R_PARISC_DIR32    00000000   .debug_str + f9
0000198d  00000b01 R_PARISC_DIR32    00000000   .debug_str + b70
0000199b  00000b01 R_PARISC_DIR32    00000000   .debug_str + 7a6
000019a9  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1281
000019b7  00000b01 R_PARISC_DIR32    00000000   .debug_str + 17fe
000019c5  00000b01 R_PARISC_DIR32    00000000   .debug_str + 3df
000019d3  00000b01 R_PARISC_DIR32    00000000   .debug_str + 18c0
000019e1  00000b01 R_PARISC_DIR32    00000000   .debug_str + 11ff
000019ef  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1473
000019fd  00000b01 R_PARISC_DIR32    00000000   .debug_str + a2f
00001b27  00000b01 R_PARISC_DIR32    00000000   .debug_str + 119d
00001b2f  00000b01 R_PARISC_DIR32    00000000   .debug_str + 155a
00001b3d  00000b01 R_PARISC_DIR32    00000000   .debug_str + f2f
00001b4b  00000b01 R_PARISC_DIR32    00000000   .debug_str + d7b
00001b59  00000b01 R_PARISC_DIR32    00000000   .debug_str + e42
00001b67  00000b01 R_PARISC_DIR32    00000000   .debug_str + b10
00001b75  00000b01 R_PARISC_DIR32    00000000   .debug_str + 11a
00001b83  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1102
00001b91  00000b01 R_PARISC_DIR32    00000000   .debug_str + e3
00001b9f  00000b01 R_PARISC_DIR32    00000000   .debug_str + 8b4
00001bad  00000b01 R_PARISC_DIR32    00000000   .debug_str + 154a
00001bbb  00000b01 R_PARISC_DIR32    00000000   .debug_str + be1
00001bca  00000b01 R_PARISC_DIR32    00000000   .debug_str + 17f4
00001bd9  00000b01 R_PARISC_DIR32    00000000   .debug_str + 686
00001be8  00000b01 R_PARISC_DIR32    00000000   .debug_str + 12a5
00001bf7  00000b01 R_PARISC_DIR32    00000000   .debug_str + ef
00001c07  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1728
00001c28  00000b01 R_PARISC_DIR32    00000000   .debug_str + ac3
00001c59  00000b01 R_PARISC_DIR32    00000000   .debug_str + fea
00001c61  00000b01 R_PARISC_DIR32    00000000   .debug_str + 8c2
00001c6f  00000b01 R_PARISC_DIR32    00000000   .debug_str + a84
00001c7d  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1302
00001c8b  00000b01 R_PARISC_DIR32    00000000   .debug_str + 131e
00001c99  00000b01 R_PARISC_DIR32    00000000   .debug_str + 2c6
00001ca7  00000b01 R_PARISC_DIR32    00000000   .debug_str + dda
00001cb5  00000b01 R_PARISC_DIR32    00000000   .debug_str + 128
00001cc3  00000b01 R_PARISC_DIR32    00000000   .debug_str + 62a
00001cd1  00000b01 R_PARISC_DIR32    00000000   .debug_str + 6dd
00001cdf  00000b01 R_PARISC_DIR32    00000000   .debug_str + 4f3
00001ced  00000b01 R_PARISC_DIR32    00000000   .debug_str + 51e
00001cfb  00000b01 R_PARISC_DIR32    00000000   .debug_str + 15bf
00001d09  00000b01 R_PARISC_DIR32    00000000   .debug_str + 73b
00001d17  00000b01 R_PARISC_DIR32    00000000   .debug_str + dc0
00001d25  00000b01 R_PARISC_DIR32    00000000   .debug_str + c6
00001d33  00000b01 R_PARISC_DIR32    00000000   .debug_str + 4d9
00001d41  00000b01 R_PARISC_DIR32    00000000   .debug_str + 429
00001d4f  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1683
00001d5d  00000b01 R_PARISC_DIR32    00000000   .debug_str + 48e
00001d6b  00000b01 R_PARISC_DIR32    00000000   .debug_str + 10ad
00001d79  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1044
00001d87  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1781
00001d95  00000b01 R_PARISC_DIR32    00000000   .debug_str + 14d5
00001da3  00000b01 R_PARISC_DIR32    00000000   .debug_str + d61
00001db1  00000b01 R_PARISC_DIR32    00000000   .debug_str + 12e8
00001dbf  00000b01 R_PARISC_DIR32    00000000   .debug_str + 111b
00001dcd  00000b01 R_PARISC_DIR32    00000000   .debug_str + a02
00001ddb  00000b01 R_PARISC_DIR32    00000000   .debug_str + 6c1
00001de9  00000b01 R_PARISC_DIR32    00000000   .debug_str + f58
00001df7  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1735
00001e05  00000b01 R_PARISC_DIR32    00000000   .debug_str + 137c
00001e13  00000b01 R_PARISC_DIR32    00000000   .debug_str + d0d
00001e21  00000b01 R_PARISC_DIR32    00000000   .debug_str + 69e
00001e30  00000b01 R_PARISC_DIR32    00000000   .debug_str + 12b8
00001e3f  00000b01 R_PARISC_DIR32    00000000   .debug_str + 8e4
00001e4e  00000b01 R_PARISC_DIR32    00000000   .debug_str + dfa
00001e5d  00000b01 R_PARISC_DIR32    00000000   .debug_str + 897
00001e6c  00000b01 R_PARISC_DIR32    00000000   .debug_str + 46b
00001e7b  00000b01 R_PARISC_DIR32    00000000   .debug_str + 16e8
00001e8a  00000b01 R_PARISC_DIR32    00000000   .debug_str + 966
00001e99  00000b01 R_PARISC_DIR32    00000000   .debug_str + 16c5
00001ea8  00000b01 R_PARISC_DIR32    00000000   .debug_str + 9c5
00001eb7  00000b01 R_PARISC_DIR32    00000000   .debug_str + 17d7
00001ec6  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1610
00001ed5  00000b01 R_PARISC_DIR32    00000000   .debug_str + c3c
00001efb  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1533
0000223f  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1432
0000224e  00000b01 R_PARISC_DIR32    00000000   .debug_str + ceb
0000225b  00000b01 R_PARISC_DIR32    00000000   .debug_str + 153e
0000226b  00000b01 R_PARISC_DIR32    00000000   .debug_str + 208
00002279  00000b01 R_PARISC_DIR32    00000000   .debug_str + 11c0
00002294  00000b01 R_PARISC_DIR32    00000000   .debug_str + 59e
0000229f  00000101 R_PARISC_DIR32    00000000   .text + 0
000022a3  00000101 R_PARISC_DIR32    00000000   .text + 74
000022a7  00000801 R_PARISC_DIR32    00000000   .debug_loc + 0
000022ac  00000b01 R_PARISC_DIR32    00000000   .debug_str + 11c7
000022b7  00000b01 R_PARISC_DIR32    00000000   .debug_str + 165a
000022c2  00000101 R_PARISC_DIR32    00000000   .text + 14
000022c6  00000101 R_PARISC_DIR32    00000000   .text + 18
000022cb  00000b01 R_PARISC_DIR32    00000000   .debug_str + 11c0
000022da  00000101 R_PARISC_DIR32    00000000   .text + 14
000022de  00000101 R_PARISC_DIR32    00000000   .text + 18
000022e5  00000101 R_PARISC_DIR32    00000000   .text + 14
000022e9  00000101 R_PARISC_DIR32    00000000   .text + 18
000022f2  00000801 R_PARISC_DIR32    00000000   .debug_loc + 1f
00002300  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1066
00002307  00000101 R_PARISC_DIR32    00000000   .text + 74
0000230b  00000101 R_PARISC_DIR32    00000000   .text + 80
00002312  00000b01 R_PARISC_DIR32    00000000   .debug_str + 165a
0000231c  00000801 R_PARISC_DIR32    00000000   .debug_loc + 32
00002321  00000b01 R_PARISC_DIR32    00000000   .debug_str + 11c7
0000232c  00000101 R_PARISC_DIR32    00000000   .text + 74
00002330  00000101 R_PARISC_DIR32    00000000   .text + 78
00002335  00000b01 R_PARISC_DIR32    00000000   .debug_str + 11c0
00002344  00000101 R_PARISC_DIR32    00000000   .text + 74
00002348  00000101 R_PARISC_DIR32    00000000   .text + 78
0000234f  00000101 R_PARISC_DIR32    00000000   .text + 74
00002353  00000101 R_PARISC_DIR32    00000000   .text + 78
00002363  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1366
00002371  00000b01 R_PARISC_DIR32    00000000   .debug_str + 14
0000237e  00001701 R_PARISC_DIR32    00000004   __thread_self + 0
00002383  00000b01 R_PARISC_DIR32    00000000   .debug_str + aed
00002389  00000b01 R_PARISC_DIR32    00000000   .debug_str + 108e
00002399  00000b01 R_PARISC_DIR32    00000000   .debug_str + 109
0000239f  00000b01 R_PARISC_DIR32    00000000   .debug_str + c70
000023aa  00000b01 R_PARISC_DIR32    00000000   .debug_str + 24d
000023b7  00000b01 R_PARISC_DIR32    00000000   .debug_str + 265
000023c4  00000b01 R_PARISC_DIR32    00000000   .debug_str + 15b9
000023d1  00000b01 R_PARISC_DIR32    00000000   .debug_str + 201
000023de  00000b01 R_PARISC_DIR32    00000000   .debug_str + e51
000023fc  00000b01 R_PARISC_DIR32    00000000   .debug_str + 3cd
00002409  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1220
00002416  00001801 R_PARISC_DIR32    00000000   __libc_multiple_thread + 0
0000241b  00000b01 R_PARISC_DIR32    00000000   .debug_str + 1aa
00002428  00001901 R_PARISC_DIR32    00000000   __librt_multiple_threa + 0

Relocation section '.rela.debug_line' at offset 0x66cc contains 1 entries:
 Offset     Info    Type            Sym.Value  Sym. Name + Addend
000003dc  00000101 R_PARISC_DIR32    00000000   .text + 0

Relocation section '.rela.PARISC.unwind' at offset 0x66d8 contains 4 entries:
 Offset     Info    Type            Sym.Value  Sym. Name + Addend
00000000  00001331 R_PARISC_SEGREL32 00000000   __libc_enable_asynccan + 0
00000004  00000131 R_PARISC_SEGREL32 00000000   .text + 70
00000010  00001631 R_PARISC_SEGREL32 00000074   __libc_disable_asyncca + 0
00000014  00000131 R_PARISC_SEGREL32 00000000   .text + 7c

Relocation section '.rela.debug_frame' at offset 0x6708 contains 4 entries:
 Offset     Info    Type            Sym.Value  Sym. Name + Addend
00000014  00000701 R_PARISC_DIR32    00000000   .debug_frame + 0
00000018  00000101 R_PARISC_DIR32    00000000   .text + 0
00000030  00000701 R_PARISC_DIR32    00000000   .debug_frame + 0
00000034  00000101 R_PARISC_DIR32    00000000   .text + 74

Relocation section '.rela.debug_pubnames' at offset 0x6738 contains 1 entries:
 Offset     Info    Type            Sym.Value  Sym. Name + Addend
00000006  00000501 R_PARISC_DIR32    00000000   .debug_info + 0

Relocation section '.rela.debug_aranges' at offset 0x6744 contains 2 entries:
 Offset     Info    Type            Sym.Value  Sym. Name + Addend
00000006  00000501 R_PARISC_DIR32    00000000   .debug_info + 0
00000010  00000101 R_PARISC_DIR32    00000000   .text + 0

Unwind section '.PARISC.unwind' at offset 0x2b4c contains 2 entries:

<__libc_enable_asynccancel>: [0x0-0xe0]
	Entry_GR=2 Save_RP Total_frame_size=8 
<__libc_disable_asynccancel>: [0x74-0xf8]
	

Symbol table '.symtab' contains 28 entries:
   Num:    Value  Size Type    Bind   Vis      Ndx Name
     0: 00000000     0 NOTYPE  LOCAL  DEFAULT  UND 
     1: 00000000     0 SECTION LOCAL  DEFAULT    1 
     2: 00000000     0 SECTION LOCAL  DEFAULT    3 
     3: 00000000     0 SECTION LOCAL  DEFAULT    4 
     4: 00000000     0 SECTION LOCAL  DEFAULT    6 
     5: 00000000     0 SECTION LOCAL  DEFAULT    7 
     6: 00000000     0 SECTION LOCAL  DEFAULT    9 
     7: 00000000     0 SECTION LOCAL  DEFAULT   13 
     8: 00000000     0 SECTION LOCAL  DEFAULT   15 
     9: 00000000     0 SECTION LOCAL  DEFAULT   16 
    10: 00000000     0 SECTION LOCAL  DEFAULT   18 
    11: 00000000     0 SECTION LOCAL  DEFAULT   20 
    12: 00000000     0 SECTION LOCAL  DEFAULT    5 
    13: 00000000     0 SECTION LOCAL  DEFAULT   11 
    14: 00000000     0 SECTION LOCAL  DEFAULT   21 
    15: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __divdi3_internal
    16: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __udivdi3_internal
    17: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __moddi3_internal
    18: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __umoddi3_internal
    19: 00000000   116 FUNC    GLOBAL HIDDEN    1 __libc_enable_asynccancel
    20: 00000000     0 NOTYPE  GLOBAL HIDDEN  UND __libc_pthread_functions
    21: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND $$dyncall
    22: 00000074    12 FUNC    GLOBAL HIDDEN    1 __libc_disable_asynccance
    23: 00000004     4 OBJECT  GLOBAL DEFAULT  COM __thread_self
    24: 00000000     4 OBJECT  GLOBAL HIDDEN    4 __libc_multiple_threads
    25: 00000000     4 OBJECT  GLOBAL DEFAULT    4 __librt_multiple_threads
    26: 00000000   116 FUNC    GLOBAL DEFAULT    1 __librt_enable_asynccance
    27: 00000074    12 FUNC    GLOBAL DEFAULT    1 __librt_disable_asynccanc

No version information found in this file.

Notes at offset 0x000000b4 with length 0x00000014:
  Owner		Data size	Description
  01.01		0x00000000	NT_VERSION (version)

--------------070304040203050209060201
Content-Type: text/plain;
 name="dump.readelf_timedreceive"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dump.readelf_timedreceive"

ELF Header:
  Magic:   7f 45 4c 46 01 02 01 03 00 00 00 00 00 00 00 00 
  Class:                             ELF32
  Data:                              2's complement, big endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - Linux
  ABI Version:                       0
  Type:                              REL (Relocatable file)
  Machine:                           HPPA
  Version:                           0x1
  Entry point address:               0x0
  Start of program headers:          0 (bytes into file)
  Start of section headers:          356 (bytes into file)
  Flags:                             0x20b, PA-RISC 1.0
  Size of this header:               52 (bytes)
  Size of program headers:           0 (bytes)
  Number of program headers:         0
  Size of section headers:           40 (bytes)
  Number of section headers:         10
  Section header string table index: 7

Section Headers:
  [Nr] Name              Type            Addr     Off    Size   ES Flg Lk Inf Al
  [ 0]                   NULL            00000000 000000 000000 00      0   0  0
  [ 1] .text             PROGBITS        00000000 000034 0000d8 00  AX  0   0  4
  [ 2] .rela.text        RELA            00000000 00042c 000048 0c      8   1  4
  [ 3] .data             PROGBITS        00000000 00010c 000000 00  WA  0   0  1
  [ 4] .bss              NOBITS          00000000 00010c 000000 00  WA  0   0  1
  [ 5] .PARISC.unwind    PROGBITS        00000000 00010c 000010 04   A  0   1  4
  [ 6] .rela.PARISC.unwi RELA            00000000 000474 000018 0c      8   5  4
  [ 7] .shstrtab         STRTAB          00000000 00011c 000045 00      0   0  1
  [ 8] .symtab           SYMTAB          00000000 0002f4 0000b0 10      9   5  4
  [ 9] .strtab           STRTAB          00000000 0003a4 000087 00      0   0  1
Key to Flags:
  W (write), A (alloc), X (execute), M (merge), S (strings)
  I (info), L (link order), G (group), x (unknown)
  O (extra OS processing required) o (OS specific), p (processor specific)

There are no section groups in this file.

There are no program headers in this file.

Relocation section '.rela.text' at offset 0x42c contains 6 entries:
 Offset     Info    Type            Sym.Value  Sym. Name + Addend
0000001c  00000622 R_PARISC_DLTIND21 00000000   __librt_multiple_threa + 0
00000020  00000626 R_PARISC_DLTIND14 00000000   __librt_multiple_threa + 0
00000044  0000070c R_PARISC_PCREL17F 00000000   __errno_location + 0
00000070  0000080c R_PARISC_PCREL17F 00000000   __librt_enable_asyncca + 0
000000a0  0000090c R_PARISC_PCREL17F 00000000   __librt_disable_asyncc + 0
000000bc  0000070c R_PARISC_PCREL17F 00000000   __errno_location + 0

Relocation section '.rela.PARISC.unwind' at offset 0x474 contains 2 entries:
 Offset     Info    Type            Sym.Value  Sym. Name + Addend
00000000  00000531 R_PARISC_SEGREL32 00000000   __GI_mq_timedreceive + 0
00000004  00000131 R_PARISC_SEGREL32 00000000   .text + d4

Unwind section '.PARISC.unwind' at offset 0x10c contains 1 entries:

<__GI_mq_timedreceive>: [0x0-0x1a8]
	Entry_GR=1 Save_RP Total_frame_size=8 

Symbol table '.symtab' contains 11 entries:
   Num:    Value  Size Type    Bind   Vis      Ndx Name
     0: 00000000     0 NOTYPE  LOCAL  DEFAULT  UND 
     1: 00000000     0 SECTION LOCAL  DEFAULT    1 
     2: 00000000     0 SECTION LOCAL  DEFAULT    3 
     3: 00000000     0 SECTION LOCAL  DEFAULT    4 
     4: 00000000     0 SECTION LOCAL  DEFAULT    5 
     5: 00000000   216 FUNC    GLOBAL DEFAULT    1 __GI_mq_timedreceive
     6: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __librt_multiple_threads
     7: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __errno_location
     8: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __librt_enable_asynccance
     9: 00000000     0 NOTYPE  GLOBAL DEFAULT  UND __librt_disable_asynccanc
    10: 00000000   216 FUNC    WEAK   DEFAULT    1 mq_timedreceive

No version information found in this file.

--------------070304040203050209060201
Content-Type: text/plain;
 name="log.link"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="log.link"

+ gcc-4.1 -v -shared -static-libgcc -Wl,-O1 -Wl,-z,defs -Wl,-dynamic-link=
er=3D/lib/ld.so.1 -B/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/cs=
u/ -Wl,--version-script=3D/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-l=
ibc/librt.map -Wl,-soname=3Dlibrt.so.1 -Wl,-z,combreloc -Wl,--hash-style=3D=
both -Wl,--enable-new-dtags,-z,nodelete -L/home/seb/dev/glibc/glibc-2.5/b=
uild-tree/hppa-libc -L/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/=
math -L/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/elf -L/home/seb=
/dev/glibc/glibc-2.5/build-tree/hppa-libc/dlfcn -L/home/seb/dev/glibc/gli=
bc-2.5/build-tree/hppa-libc/nss -L/home/seb/dev/glibc/glibc-2.5/build-tre=
e/hppa-libc/nis -L/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/rt -=
L/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/resolv -L/home/seb/de=
v/glibc/glibc-2.5/build-tree/hppa-libc/crypt -L/home/seb/dev/glibc/glibc-=
2.5/build-tree/hppa-libc/linuxthreads -Wl,-rpath-link=3D/home/seb/dev/gli=
bc/glibc-2.5/build-tree/hppa-libc:/home/seb/dev/glibc/glibc-2.5/build-tre=
e/hppa-libc/math:/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/elf:/=
home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/dlfcn:/home/seb/dev/gli=
bc/glibc-2.5/build-tree/hppa-libc/nss:/home/seb/dev/glibc/glibc-2.5/build=
-tree/hppa-libc/nis:/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/rt=
:/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/resolv:/home/seb/dev/=
glibc/glibc-2.5/build-tree/hppa-libc/crypt:/home/seb/dev/glibc/glibc-2.5/=
build-tree/hppa-libc/linuxthreads -o /home/seb/dev/glibc/glibc-2.5/build-=
tree/hppa-libc/rt/librt.so -T /home/seb/dev/glibc/glibc-2.5/build-tree/hp=
pa-libc/shlib.lds /home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/csu/=
abi-note.o -Wl,--whole-archive /home/seb/dev/glibc/glibc-2.5/build-tree/h=
ppa-libc/rt/librt_pic.a -Wl,--no-whole-archive /home/seb/dev/glibc/glibc-=
2.5/build-tree/hppa-libc/elf/interp.os /home/seb/dev/glibc/glibc-2.5/buil=
d-tree/hppa-libc/libc.so /home/seb/dev/glibc/glibc-2.5/build-tree/hppa-li=
bc/libc_nonshared.a /home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/li=
nuxthreads/libpthread_nonshared.a /home/seb/dev/glibc/glibc-2.5/build-tre=
e/hppa-libc/linuxthreads/libpthread.so /home/seb/dev/glibc/glibc-2.5/buil=
d-tree/hppa-libc/elf/ld.so
Using built-in specs.
Target: hppa-linux-gnu
Configured with: ../src/configure -v --enable-languages=3Dc,c++,fortran,o=
bjc,obj-c++,treelang --prefix=3D/usr --enable-shared --with-system-zlib -=
-libexecdir=3D/usr/lib --without-included-gettext --enable-threads=3Dposi=
x --enable-nls --with-gxx-include-dir=3D/usr/include/c++/4.1.3 --program-=
suffix=3D-4.1 --enable-__cxa_atexit --enable-clocale=3Dgnu --enable-libst=
dcxx-debug --enable-mpfr --disable-libssp --enable-checking=3Drelease hpp=
a-linux-gnu
Thread model: posix
gcc version 4.1.3 20070629 (prerelease) (Debian 4.1.2-13)
 /usr/lib/gcc/hppa-linux-gnu/4.1.3/collect2 --eh-frame-hdr --hash-style=3D=
both -shared -o /home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/rt/lib=
rt.so /home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/csu/crti.o /usr/=
lib/gcc/hppa-linux-gnu/4.1.3/crtbeginS.o -L/home/seb/dev/glibc/glibc-2.5/=
build-tree/hppa-libc -L/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc=
/math -L/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/elf -L/home/se=
b/dev/glibc/glibc-2.5/build-tree/hppa-libc/dlfcn -L/home/seb/dev/glibc/gl=
ibc-2.5/build-tree/hppa-libc/nss -L/home/seb/dev/glibc/glibc-2.5/build-tr=
ee/hppa-libc/nis -L/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/rt =
-L/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/resolv -L/home/seb/d=
ev/glibc/glibc-2.5/build-tree/hppa-libc/crypt -L/home/seb/dev/glibc/glibc=
-2.5/build-tree/hppa-libc/linuxthreads -L/home/seb/dev/glibc/glibc-2.5/bu=
ild-tree/hppa-libc/csu -L/usr/lib/gcc/hppa-linux-gnu/4.1.3 -L/usr/lib/gcc=
/hppa-linux-gnu/4.1.3 -L/usr/lib/gcc/hppa-linux-gnu/4.1.3/../../.. -O1 -z=
 defs -dynamic-linker=3D/lib/ld.so.1 --version-script=3D/home/seb/dev/gli=
bc/glibc-2.5/build-tree/hppa-libc/librt.map -soname=3Dlibrt.so.1 -z combr=
eloc --hash-style=3Dboth --enable-new-dtags -z nodelete -rpath-link=3D/ho=
me/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc:/home/seb/dev/glibc/glibc=
-2.5/build-tree/hppa-libc/math:/home/seb/dev/glibc/glibc-2.5/build-tree/h=
ppa-libc/elf:/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/dlfcn:/ho=
me/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/nss:/home/seb/dev/glibc/g=
libc-2.5/build-tree/hppa-libc/nis:/home/seb/dev/glibc/glibc-2.5/build-tre=
e/hppa-libc/rt:/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/resolv:=
/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/crypt:/home/seb/dev/gl=
ibc/glibc-2.5/build-tree/hppa-libc/linuxthreads /home/seb/dev/glibc/glibc=
-2.5/build-tree/hppa-libc/csu/abi-note.o --whole-archive /home/seb/dev/gl=
ibc/glibc-2.5/build-tree/hppa-libc/rt/librt_pic.a --no-whole-archive /hom=
e/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/elf/interp.os /home/seb/de=
v/glibc/glibc-2.5/build-tree/hppa-libc/libc.so /home/seb/dev/glibc/glibc-=
2.5/build-tree/hppa-libc/libc_nonshared.a /home/seb/dev/glibc/glibc-2.5/b=
uild-tree/hppa-libc/linuxthreads/libpthread_nonshared.a /home/seb/dev/gli=
bc/glibc-2.5/build-tree/hppa-libc/linuxthreads/libpthread.so /home/seb/de=
v/glibc/glibc-2.5/build-tree/hppa-libc/elf/ld.so -lgcc -lgcc_eh -lgcc -lc=
 -lgcc -lgcc_eh /usr/lib/gcc/hppa-linux-gnu/4.1.3/crtendS.o /home/seb/dev=
/glibc/glibc-2.5/build-tree/hppa-libc/csu/crtn.o -T /home/seb/dev/glibc/g=
libc-2.5/build-tree/hppa-libc/shlib.lds
/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/rt/librt_pic.a(clock_n=
anosleep.os): In function `clock_nanosleep':
/home/seb/dev/glibc/glibc-2.5/build-tree/glibc-2.5/rt/../sysdeps/unix/sys=
v/linux/clock_nanosleep.c:42: undefined reference to `__librt_multiple_th=
reads'
/home/seb/dev/glibc/glibc-2.5/build-tree/glibc-2.5/rt/../sysdeps/unix/sys=
v/linux/clock_nanosleep.c:42: undefined reference to `__librt_multiple_th=
reads'
/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/rt/librt_pic.a(mq_time=
dsend.os): In function `mq_timedsend':
(.text+0x1c): undefined reference to `__librt_multiple_threads'
/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/rt/librt_pic.a(mq_time=
dsend.os): In function `mq_timedsend':
(.text+0x20): undefined reference to `__librt_multiple_threads'
/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/rt/librt_pic.a(mq_time=
dreceive.os): In function `mq_timedreceive':
(.text+0x1c): undefined reference to `__librt_multiple_threads'
/home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/rt/librt_pic.a(mq_time=
dreceive.os):(.text+0x20): more undefined references to `__librt_multiple=
_threads' follow
/usr/bin/ld: /home/seb/dev/glibc/glibc-2.5/build-tree/hppa-libc/rt/librt.=
so: hidden symbol `__librt_multiple_threads' isn't defined
/usr/bin/ld: final link failed: Nonrepresentable section on output
collect2: ld returned 1 exit status

--------------070304040203050209060201
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--------------070304040203050209060201--
