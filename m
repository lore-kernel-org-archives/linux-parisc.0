Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 43C574829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  7 Jul 2003 00:05:27 -0600 (MDT)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout1.tiscali.be with esmtp (Tiscali)
	id 19ZP5t-0002Xw-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 07 Jul 2003 08:03:21 +0200
Date: Mon, 7 Jul 2003 08:05:25 +0200
Message-ID: <3F03A42100000529@ocpmta1.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] gcc 3.3.1 ICE
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

Hi all,

Just compiling kernel 2.4.21-pa01 and unfortunately got following ICE:
gcc -D__KERNEL__ -I/usr/src/kernel-source-2.4.21-pa01-lvm-107-20030704/include
-Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -D__linux__ -pipe -fno-strength-reduce -mno-space-regs
-mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=1.1 -mschedule=7100
 -D_JFS_4K -nostdinc -I /usr/lib/gcc-lib/hppa-linux/3.3.1/include -DKBUILD_BASENAME=jfs_xtree
 -c -o jfs_xtree.o jfs_xtree.c
jfs_xtree.c: In function `xtUpdate':
jfs_xtree.c:2351: error: insn does not satisfy its constraints:
(insn 7698 1165 1168 29 (nil) (set (reg:SI 24 %r24)
        (reg:SI 88 SAR [427])) 37 {*pa.md:2265} (nil)
    (nil))
jfs_xtree.c:2351: internal compiler error: in reload_cse_simplify_operands,
at reload1.c:8345
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://gcc.gnu.org/bugs.html> for instructions.
make[3]: *** [jfs_xtree.o] Error 1
make[3]: Leaving directory `/usr/src/kernel-source-2.4.21-pa01-lvm-107-20030704/fs/jfs'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/usr/src/kernel-source-2.4.21-pa01-lvm-107-20030704/fs/jfs'
make[1]: *** [_subdir_jfs] Error 2
make[1]: Leaving directory `/usr/src/kernel-source-2.4.21-pa01-lvm-107-20030704/fs'
make: *** [_dir_fs] Error 2

[gcc -v:
...
gcc version 3.3.1 20030626 (Debian prerealse)

Do I actualy report it?

Thanks for advise,
    Joel


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
