Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8112D482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Nov 2002 13:23:05 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by transport.cksoft.de (Postfix) with ESMTP id 15E5C1FFEC7
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Nov 2002 21:22:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mail.int.zabbadoz.net (Postfix) with ESMTP id E6F3822E1A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Nov 2002 20:23:24 +0000 (UTC)
Date: Thu, 21 Nov 2002 20:23:24 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.BSF.4.44.0211212015160.39295-100000@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] 2.5cvs with gcc-3.3cvs
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

Hi,

for all compiling a 2.5cvs kernel with gcc-3.3cvs ... how ?


--- cut ---
  gcc -Wp,-MD,arch/parisc/lib/.memset.o.d -D__KERNEL__ -Iinclude -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -D__linux__ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect-calls -mdisable-fpregs -ffunction-sections -nostdinc -iwithprefix
include    -DKBUILD_BASENAME=memset   -c -o arch/parisc/lib/memset.o arch/parisc/lib/memset.c
  rm -f arch/parisc/lib/lib.a; ar  rcs arch/parisc/lib/lib.a arch/parisc/lib/lusercopy.o arch/parisc/lib/bitops.o arch/parisc/lib/checksum.o arch/parisc/lib/io.o arch/parisc/lib/memset.o
  gcc -E -Wp,-MD,arch/parisc/.vmlinux.lds.s.d_ -D__ASSEMBLY__ -D__KERNEL__ -Iinclude -nostdinc -iwithprefix include   -P -C -Uparisc   -o arch/parisc/vmlinux.lds.s arch/parisc/vmlinux.lds.S
echo '  Generating build number'
  Generating build number
. scripts/mkversion > .tmp_version
mv -f .tmp_version .version
make -f scripts/Makefile.build obj=init
  Generating include/linux/compile.h (updated)
  gcc -Wp,-MD,init/.version.o.d -D__KERNEL__ -Iinclude -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -D__linux__ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect-calls -mdisable-fpregs -ffunction-sections -nostdinc -iwithprefix include
-DKBUILD_BASENAME=version   -c -o init/version.o init/version.c
   ld   -r -o init/built-in.o init/main.o init/version.o init/do_mounts.o init/initramfs.o
        ld  -T arch/parisc/vmlinux.lds.s arch/parisc/kernel/head.o   init/built-in.o --start-group  usr/built-in.o arch/parisc/kernel/pdc_cons.o arch/parisc/kernel/process.o  arch/parisc/mm/built-in.o  arch/parisc/kernel/built-in.o  arch/parisc/hpux/built-in.o  arch/parisc/math-emu/built-in.o
arch/parisc/kernel/init_task.o  kernel/built-in.o  mm/built-in.o  fs/built-in.o  ipc/built-in.o  security/built-in.o  crypto/built-in.o  lib/lib.a  arch/parisc/lib/lib.a `gcc -print-libgcc-file-name`  drivers/built-in.o  sound/built-in.o  net/built-in.o --end-group  -o vmlinux
arch/parisc/kernel/built-in.o(__ksymtab+0x250): undefined reference to `$$mulU'
make: *** [vmlinux] Error 1
--- cut ---


build with:

bz@apollo:/usr/src/linux> gcc -v
Reading specs from /usr/local/lib/gcc-lib/hppa-linux/3.3/specs
Configured with: ../gcc/configure -v --enable-languages=c,c++ --enable-shared --with-gnu-as --with-gnu-ld --with-system-zlib --enable-long-long --enable-nls --without-included-gettext --disable-checking --enable-threads=posix hppa-linux
Thread model: posix
gcc version 3.3 20021120 (experimental)


and either:
	binutils 2.13.90.0.10-2 (debian)
or
	binutils 20021107 (compiled with gcc-3.3cvs)


same error with both......

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
