Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from velli.mail.jippii.net (velli.mail.jippii.net [195.197.172.114])
	by dsl2.external.hp.com (Postfix) with ESMTP id B0EEE482C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 30 Nov 2001 07:41:45 -0700 (MST)
Received: from amos (dyn-3-085.tku.netti.fi [195.16.220.86])
	by velli.mail.jippii.net (Postfix) with SMTP id EA920504
	for <parisc-linux@lists.parisc-linux.org>; Fri, 30 Nov 2001 16:41:42 +0200 (EET)
Message-ID: <001301c179ad$de7c0f60$56dc10c3@amos>
From: "Kaj-Michael Lang" <milang@tal.org>
To: <parisc-linux@lists.parisc-linux.org>
Date: Fri, 30 Nov 2001 16:46:57 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Parse error when compiling glibc. binutils bug ?
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

I'm trying to compile glibc 2.2.4+plus all the debian patches I could find.
I'm using the
latest H. J. Lu binutils (2.11.92.0.12.3). The error is this:

make[1]: Leaving directory
`/archive/work/talinuxcvs/base/glibc/tmp/glibc-2.2.4/elf'
gcc   -shared -static-libgcc -Wl,-O1  -Wl,-dynamic-linker=/lib/ld.so.1  -Bsy
sdeps/../csu/  -Wl,--version-script=sysdeps/../libc.map -Wl,-soname=libc.so.
6 -Wl,-z,combreloc -nostdlib -nostartfiles -e __libc_main -u
__register_frame -L. -Lsysdeps/../math -Lsysdeps/../elf -Lsysdeps/../dlfcn -
Lsysdeps/../nss -Lsysdeps/../nis -Lsysdeps/../rt -Lsysdeps/../resolv -Lsysde
ps/../crypt -Lsysdeps/../linuxthreads -Wl,-rpath-link=.:sysdeps/../math:sysd
eps/../elf:sysdeps/../dlfcn:sysdeps/../nss:sysdeps/../nis:sysdeps/../rt:sysd
eps/../resolv:sysdeps/../crypt:sysdeps/../linuxthreads -o
sysdeps/../libc.so.new sysdeps/../csu/abi-note.o -Wl,--verbose -lgcc 2>&1 |
sed -e '/^=========/,/^=========/!d;/^=========/d' -e
*\.hash[      ]*:.*$/  .note.ABI-tag : { *(.note.ABI-tag) } &/' >
sysdeps/../libc.so.lds
rm -f sysdeps/../libc.so.new
gcc   -shared -static-libgcc -Wl,-O1  -Wl,-dynamic-linker=/lib/ld.so.1  -Bsy
sdeps/../csu/  -Wl,--version-script=sysdeps/../libc.map -Wl,-soname=libc.so.
6 -Wl,-z,combreloc -nostdlib -nostartfiles -e __libc_main -u
__register_frame -L. -Lsysdeps/../math -Lsysdeps/../elf -Lsysdeps/../dlfcn -
Lsysdeps/../nss -Lsysdeps/../nis -Lsysdeps/../rt -Lsysdeps/../resolv -Lsysde
ps/../crypt -Lsysdeps/../linuxthreads -Wl,-rpath-link=.:sysdeps/../math:sysd
eps/../elf:sysdeps/../dlfcn:sysdeps/../nss:sysdeps/../nis:sysdeps/../rt:sysd
eps/../resolv:sysdeps/../crypt:sysdeps/../linuxthreads -o
sysdeps/../libc.so -T sysdeps/../libc.so.lds sysdeps/../csu/abi-note.o
sysdeps/../elf/soinit.os sysdeps/../libc_pic.os sysdeps/../elf/sofini.os
sysdeps/../elf/interp.os sysdeps/../elf/ld.so -lgcc
/usr/lib/gcc-lib/hppa-linux/3.0.2/../../../../hppa-linux/bin/ld:sysdeps/../l
ibc.so.lds:144: parse error
collect2: ld returned 1 exit status
make: *** [sysdeps/../libc.so] Error 1

and the lines around 145 in libc.so.lds looks like this:

    KEEP (*crtbegin.o(.ctors))
    /* We don't want to include the .ctor section from
       from the crtend.o file until after the sorted ctors.
       The .ctor section from the crtend file contains the
       end of ctors marker and it must be last */
    KEEP (*(EXCLUDE_FILE (*crtend.o ) .ctors))
    KEEP (*(SORT(.ctors.*)))
    KEEP (*(.ctors))
  }
   .dtors         :
  {/usr/lib/gcc-lib/hppa-linux/3.0.2/../../../../hppa-linux/bin/ld: BFD
2.11.92.0.12.3 20011121 assertion fail elf-strtab.c:207
/usr/lib/gcc-lib/hppa-linux/3.0.2/../../../../hppa-linux/bin/ld: BFD
2.11.92.0.12.3 20011121 assertion fail elf-strtab.c:262

    KEEP (*crtbegin.o(.dtors))
    KEEP (*(EXCLUDE_FILE (*crtend.o ) .dtors))
    KEEP (*(SORT(.dtors.*)))
    KEEP (*(.dtors))
  }

145 is the line with the first assertion fail.

Does anyone know what causes it ? Is there a fix ?

--
Kaj-Michael Lang , milang@tal.org
