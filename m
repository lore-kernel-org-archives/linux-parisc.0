Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6FF314829
	for <parisc-linux@parisc-linux.org>; Wed,  6 Nov 2002 00:19:31 -0700 (MST)
Date: Wed, 6 Nov 2002 08:18:48 +0100
Message-ID: <3DB5755500002283@ocpmta7.be.tiscali.com>
In-Reply-To: <200210311549.g9VFns45010517@hiauly1.hia.nrc.ca>
From: jsoe0708@tiscali.be
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] Re: gcc-3.3 hppa patch
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

Hi Dave,

>-- Original Message --
>Subject: Re: gcc-3.3 hppa patch
>To: jsoe0708@tiscali.be
>Date: Thu, 31 Oct 2002 10:49:54 -0500 (EST)
>From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
>
>
>> >I have decided to split it into two parts.  I am testing the call
>> >rewrite now.  This is the only part that is relevant to user space
>> >on linux.  Hopefully, this will be installed in a day or so.
>
>This is now installed in the gcc main branch.
>

I just have to grab gcc-snapshot debian pkg; nice :))

I also try to test a 2.5 (45-pa5) it compiles well (after application of
an old tips [remove $$mulU from parisc_ksyms.c]) but failled to boot :((
(Is somebody already reach to boot a 2.5 pa?)

And so I come back to my 2.4.19-pa24 (+evms+jfs+xfs patches; as it is where
I suspect some gcc bugs and want to test the improvement with last gcc-3.3).
Very unfortunately it failled earlier (just after make dep and very begining
of make vmlinux) with following messages:
make[2]: Entering directory `/usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028/arch/parisc/math-emu'
/usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028/scripts/mkdep
-D__KERNEL__ -I/usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028/include
 -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -D__linux__ -pipe -fno-strength-reduce -mno-space-regs
-mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=1.1 -mschedule=7100
 -nostdinc -I /usr/lib/gcc-snapshot/lib/gcc-lib/hppa-linux/3.3/include --
cnv_float.h dbl_float.h decode_exc.c denormal.c dfadd.c dfcmp.c dfdiv.c dfmpy.c
dfrem.c dfsqrt.c dfsub.c driver.c fcnvff.c fcnvfu.c fcnvfut.c fcnvfx.c fcnvfxt.c
fcnvuf.c fcnvxf.c float.h fmpyfadd.c fpbits.h fpu.h fpudispatch.c frnd.c
hppa.h math-emu.h sfadd.c sfcmp.c sfdiv.c sfmpy.c sfrem.c sfsqrt.c sfsub.c
sgl_float.h types.h > .depend
make[2]: Leaving directory `/usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028/arch/parisc/math-emu'
make[1]: Leaving directory `/usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028'
make update-modverfile
make[1]: Entering directory `/usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028'
/usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028/include/linux/modversions.h
was updated
make[1]: Leaving directory `/usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028'
gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -o scripts/split-include
scripts/split-include.c
scripts/split-include include/linux/autoconf.h include/config
gcc -D__KERNEL__ -I/usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028/include
 -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -D__linux__ -pipe -fno-strength-reduce -mno-space-regs
-mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=1.1 -mschedule=7100
  -DKBUILD_BASENAME=main -c -o init/main.o init/main.c
In file included from /usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028/include/linux/highmem.h:5,
                 from /usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028/include/linux/pagemap.h:16,
                 from /usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028/include/linux/locks.h:8,
                 from /usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028/include/linux/blk.h:5,
                 from init/main.c:25:
/usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028/include/asm/pgalloc.h:
In function `flush_cache_range':
/usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028/include/asm/pgalloc.h:83:
warning: comparison between signed and unsigned
In file included from /usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028/include/linux/highmem.h:5,
                 from /usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028/include/linux/pagemap.h:16,
                 from /usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028/include/linux/locks.h:8,
                 from /usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028/include/linux/blk.h:5,
                 from init/main.c:25:
/usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028/include/asm/pgalloc.h:
In function `flush_cache_page':
/usr/src/kernel-source-2.4.19-pa24-evms-120-jfs-1023-xfs-20021028/include/asm/pgalloc.h:102:
warning: comparison between signed and unsigned
init/main.c: In function `init':
init/main.c:624: internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.
{standard input}: Assembler messages:
{standard input}:793: Error: can't resolve `.L242' {.text.init section} -
`.L256' {*UND* section}
{standard input}:793: Fatal error: Missing .exit

make: *** [init/main.o] Error 1

Any idea.

Thanks in advance,
        Joel

PS: Merge of 2.4.20-rc1 will hardest than I believe
