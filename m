Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 48D6B482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Mar 2003 04:37:38 -0700 (MST)
Date: Tue, 25 Mar 2003 12:37:34 +0100
Message-ID: <3E68A4AA0000385B@ocpmta8.freegates.net>
In-Reply-To: <20030324213508.GA8436@systemhalted>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] Glibc 2.3.2 failures and possible fixes?
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Carlos,

>
>John, Tausq,
>
>Succeeded in building glibc 2.3.2 with syscall cancellation support, but
>I'm pretty sure it's wrong.
>
I am less luky.

I grab src of glibc-2.3.2 from ftp.gnu and aply your patches and try to rebuild
on an unstable debian (update this 20030324).

unfortunately I got the following err:

gcc-3.2 dl-reloc.c -c -std=gnu99 -O2 -Wall -Winline -Wstrict-prototypes -Wwrite-strings
-fstrict-aliasing -g -pipe      -I../include -I.
-I/Develop/tools/glibc/glibc-2.3.2/hppa-linux/obj/elf -I.. -I../libio  -I/Develop/tools/glibc/glibc-2.3.2/hppa-linux/obj
-I../sysdeps/hpp
a/elf -I../linuxthreads/sysdeps/unix/sysv/linux/hppa -I../linuxthreads/sysdeps/unix/sysv/linux
-I../linuxthreads/sysdeps/pthread -I../sys
deps/pthread -I../linuxthreads/sysdeps/unix/sysv -I../linuxthreads/sysdeps/unix
-I../linuxthreads/sysdeps/hppa -I../sysdeps/unix/sysv/lin
ux/hppa -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sysdeps/unix/common
-I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../sysdeps
/unix/sysv -I../sysdeps/unix -I../sysdeps/posix -I../sysdeps/hppa/hppa1.1
-I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysde
ps/ieee754/dbl-64 -I../sysdeps/ieee754/ldbl-128 -I../sysdeps/hppa/fpu -I../sysdeps/hppa
-I../sysdeps/ieee754 -I../sysdeps/generic/elf -I.
./sysdeps/generic  -nostdinc -isystem /usr/lib/gcc-lib/hppa-linux/3.2.3/include
-isystem /usr/src/linux-2.4.20-pa32-64/include -D_LIBC_RE
ENTRANT -include ../include/libc-symbols.h       -o /Develop/tools/glibc/glibc-2.3.2/hppa-linux/obj/elf/dl-reloc.o
In file included from dynamic-link.h:49,
                 from dl-reloc.c:207:
../sysdeps/hppa/dl-machine.h: In function `_dl_relocate_object': 
../sysdeps/hppa/dl-machine.h:646: conflicting types for `elf_machine_rela_relative'
dynamic-link.h:37: previous declaration of `elf_machine_rela_relative'
make[3]: *** [/Develop/tools/glibc/glibc-2.3.2/hppa-linux/obj/elf/dl-reloc.o]
Error 1
make[3]: Leaving directory `/Develop/tools/glibc/glibc-2.3.2/glibc-2.3.2/elf'
make[2]: *** [elf/subdir_lib] Error 2
make[2]: Leaving directory `/Develop/tools/glibc/glibc-2.3.2/glibc-2.3.2'
make[1]: *** [install] Error 2
make[1]: Leaving directory `/Develop/tools/glibc/glibc-2.3.2/hppa-linux/obj'
make: *** [/Develop/tools/glibc/glibc-2.3.2/hppa-linux/installed-binaries]
Error 2

I also find:

into dynamic-link.h
auto void __attribute__((always_inline))
elf_machine_rela_relative (ElfW(Addr) l_addr, const ElfW(Rela) *reloc,
                           ElfW(Addr) *const reloc_addr);

into sysdeps/hppa/dl-machine.h:
auto void __attribute__((always_inline))
elf_machine_rela_relative (struct link_map *map, Elf32_Addr l_addr,
                           const Elf32_Rela *reloc,
                           Elf32_Addr *const reloc_addr)

Thanks for advise,
    Joel

---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
