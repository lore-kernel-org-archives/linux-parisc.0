Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2CE1D482E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Jan 2003 03:03:45 -0700 (MST)
Date: Tue, 14 Jan 2003 11:03:41 +0100
Message-ID: <3DED9A66000057DD@ocpmta3.freegates.net>
In-Reply-To: <3E1AA7C1000010F1@ocpmta7.freegates.net>
From: jsoe0708@tiscali.be
To: "Randolph Chung" <tausq@debian.org>
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] new gcc-snapshot problem [was: new gcc-default for hppa]
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

>PS: Tommorrow I will try either snapshot or gcc-3.0?
>
I so try snapshot (named 20030105-1) and so set LD_LIBRARY_PATH and PATH
as documented but compiling the kernel 2.4.20 failled with:
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-pa21/include -Wall -Wstrict-prot=
otypes
-Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer
-D__linux__ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect-ca=
lls
-mdisable-fpregs -ffunction-sections -march=3D1.1 -mschedule=3D7100   -no=
stdinc
-I /usr/lib/gcc-snapshot/lib/gcc-lib/hppa-linux/3.3/include -DKBUILD_BASE=
NAME=3Dide_cd
 -c -o ide-cd.o ide-cd.c
In file included from /usr/src/linux-2.4.20-pa21/include/linux/ide.h:301,=

                 from ide-cd.c:309:
/usr/src/linux-2.4.20-pa21/include/asm/ide.h: In function `ide_fix_drivei=
d':
/usr/src/linux-2.4.20-pa21/include/asm/ide.h:150: warning: comparison bet=
ween
signed and unsigned
In file included from /usr/src/linux-2.4.20-pa21/include/linux/highmem.h:=
5,
                 from /usr/src/linux-2.4.20-pa21/include/linux/pagemap.h:=
16,
                 from /usr/src/linux-2.4.20-pa21/include/linux/locks.h:8,=

                 from /usr/src/linux-2.4.20-pa21/include/linux/blk.h:5,
                 from /usr/src/linux-2.4.20-pa21/include/linux/ide.h:771,=

                 from ide-cd.c:309:
/usr/src/linux-2.4.20-pa21/include/asm/pgalloc.h: In function `flush_cach=
e_range':
/usr/src/linux-2.4.20-pa21/include/asm/pgalloc.h:83: warning: comparison
between signed and unsigned
In file included from /usr/src/linux-2.4.20-pa21/include/linux/highmem.h:=
5,
                 from /usr/src/linux-2.4.20-pa21/include/linux/pagemap.h:=
16,
                 from /usr/src/linux-2.4.20-pa21/include/linux/locks.h:8,=

                 from /usr/src/linux-2.4.20-pa21/include/linux/blk.h:5,
                 from /usr/src/linux-2.4.20-pa21/include/linux/ide.h:771,=

                 from ide-cd.c:309:
/usr/src/linux-2.4.20-pa21/include/asm/pgalloc.h: In function `flush_cach=
e_page':
/usr/src/linux-2.4.20-pa21/include/asm/pgalloc.h:102: warning: comparison=

between signed and unsigned
In file included from ide-cd.c:318:
ide-cd.h: At top level:
ide-cd.h:440: error: long, short, signed or unsigned used invalidly for
`slot_tablelen'
ide-cd.c: In function `cdrom_analyze_sense_data':
ide-cd.c:468: warning: comparison between signed and unsigned
ide-cd.c: In function `cdrom_buffer_sectors':
ide-cd.c:816: warning: comparison between signed and unsigned
ide-cd.c:816: warning: signed and unsigned type in conditional expression=

ide-cd.c: In function `cdrom_read_intr':
ide-cd.c:994: warning: comparison between signed and unsigned
ide-cd.c:994: warning: signed and unsigned type in conditional expression=

ide-cd.c: In function `cdrom_read_from_buffer':
ide-cd.c:1061: warning: comparison between signed and unsigned
ide-cd.c: In function `cdrom_start_read_continuation':
ide-cd.c:1100: warning: comparison between signed and unsigned
ide-cd.c: In function `cdrom_write_intr':
ide-cd.c:1607: warning: comparison between signed and unsigned
ide-cd.c:1607: warning: signed and unsigned type in conditional expressio=
n
make[3]: *** [ide-cd.o] Error 1
make[3]: Leaving directory `/usr/src/linux-2.4.20-pa21/drivers/ide'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/usr/src/linux-2.4.20-pa21/drivers/ide'
make[1]: *** [_subdir_ide] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.20-pa21/drivers'
make: *** [_dir_drivers] Error 2

I have a look and in drivers/ide/ide-cd.h line 440 I found well:
    __u8 short slot_tabelen;

Any idea?

Thanks,
    Joel


*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
