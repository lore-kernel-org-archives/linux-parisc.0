Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 04F38482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Apr 2002 03:03:03 -0600 (MDT)
Received: from www-data by webmail.tiscalinet.be with local (Tiscali)
	id 16xlL4-00053F-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 17 Apr 2002 11:02:54 +0200
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1019034174.3cbd3a3e2c5a5@webmail.tiscalinet.be>
Date: Wed, 17 Apr 2002 11:02:54 +0200 (CEST)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] linux-2.4.18-pa19 fpu problem
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

Here is some trace I get from the kernel (2.4.18-pa19) make (after a make
oldconfig):
...
gcc -D__KERNEL__ -I/GNU-Dev/parisc-linux/src/linux/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing
-fno-common -D__linux__ -pipe -fno-strength-reduce -mno-space-regs
-mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=1.1
-mschedule=7100   -DKBUILD_BASENAME=driver  -c -o driver.o driver.c
driver.c: In function `handle_fpe':
driver.c:103: warning: implicit declaration of function `decode_fpu'
gcc -D__KERNEL__ -I/GNU-Dev/parisc-linux/src/linux/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing
-fno-common -D__linux__ -pipe -fno-strength-reduce -mno-space-regs
-mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=1.1
-mschedule=7100   -DKBUILD_BASENAME=decode_exc  -c -o decode_exc.o decode_exc.c
decode_exc.c: In function `decode_fpu':
decode_exc.c:168: warning: implicit declaration of function `fpudispatch'
decode_exc.c:239: warning: implicit declaration of function `sgl_denormalize'
decode_exc.c:251: warning: implicit declaration of function `dbl_denormalize'
decode_exc.c:304: warning: suggest parentheses around arithmetic in operand of |
decode_exc.c:350: warning: implicit declaration of function `printk'
gcc -D__KERNEL__ -I/GNU-Dev/parisc-linux/src/linux/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing
-fno-common -D__linux__ -pipe -fno-strength-reduce -mno-space-regs
-mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=1.1
-mschedule=7100   -DKBUILD_BASENAME=fpudispatch  -c -o fpudispatch.o fpudispatch.c
fpudispatch.c: In function `decode_0c':
fpudispatch.c:365: warning: implicit declaration of function `sgl_fsqrt'
fpudispatch.c:368: warning: implicit declaration of function `dbl_fsqrt'
fpudispatch.c:377: warning: implicit declaration of function `sgl_frnd'
fpudispatch.c:380: warning: implicit declaration of function `dbl_frnd'
fpudispatch.c:409: warning: implicit declaration of function `sgl_to_dbl_fcnvff'
fpudispatch.c:412: warning: implicit declaration of function `dbl_to_sgl_fcnvff'
fpudispatch.c:420: warning: implicit declaration of function `sgl_to_sgl_fcnvxf'
fpudispatch.c:423: warning: implicit declaration of function `sgl_to_dbl_fcnvxf'
fpudispatch.c:426: warning: implicit declaration of function `dbl_to_sgl_fcnvxf'
fpudispatch.c:429: warning: implicit declaration of function `dbl_to_dbl_fcnvxf'
fpudispatch.c:435: warning: implicit declaration of function `sgl_to_sgl_fcnvfx'
fpudispatch.c:438: warning: implicit declaration of function `sgl_to_dbl_fcnvfx'
fpudispatch.c:441: warning: implicit declaration of function `dbl_to_sgl_fcnvfx'
fpudispatch.c:444: warning: implicit declaration of function `dbl_to_dbl_fcnvfx'
fpudispatch.c:450: warning: implicit declaration of function `sgl_to_sgl_fcnvfxt'
fpudispatch.c:453: warning: implicit declaration of function `sgl_to_dbl_fcnvfxt'
fpudispatch.c:456: warning: implicit declaration of function `dbl_to_sgl_fcnvfxt'
fpudispatch.c:459: warning: implicit declaration of function `dbl_to_dbl_fcnvfxt'
fpudispatch.c:465: warning: implicit declaration of function `sgl_to_sgl_fcnvuf'
fpudispatch.c:468: warning: implicit declaration of function `sgl_to_dbl_fcnvuf'
fpudispatch.c:471: warning: implicit declaration of function `dbl_to_sgl_fcnvuf'
fpudispatch.c:474: warning: implicit declaration of function `dbl_to_dbl_fcnvuf'
fpudispatch.c:480: warning: implicit declaration of function `sgl_to_sgl_fcnvfu'
fpudispatch.c:483: warning: implicit declaration of function `sgl_to_dbl_fcnvfu'
fpudispatch.c:486: warning: implicit declaration of function `dbl_to_sgl_fcnvfu'
fpudispatch.c:489: warning: implicit declaration of function `dbl_to_dbl_fcnvfu'
fpudispatch.c:495: warning: implicit declaration of function `sgl_to_sgl_fcnvfut'
fpudispatch.c:498: warning: implicit declaration of function `sgl_to_dbl_fcnvfut'
fpudispatch.c:501: warning: implicit declaration of function `dbl_to_sgl_fcnvfut'
fpudispatch.c:504: warning: implicit declaration of function `dbl_to_dbl_fcnvfut'
fpudispatch.c:540: warning: implicit declaration of function `sgl_fcmp'
fpudispatch.c:547: warning: implicit declaration of function `dbl_fcmp'
fpudispatch.c:622: warning: implicit declaration of function `sgl_fadd'
fpudispatch.c:625: warning: implicit declaration of function `dbl_fadd'
fpudispatch.c:634: warning: implicit declaration of function `sgl_fsub'
fpudispatch.c:637: warning: implicit declaration of function `dbl_fsub'
fpudispatch.c:646: warning: implicit declaration of function `sgl_fmpy'
fpudispatch.c:649: warning: implicit declaration of function `dbl_fmpy'
fpudispatch.c:658: warning: implicit declaration of function `sgl_fdiv'
fpudispatch.c:661: warning: implicit declaration of function `dbl_fdiv'
fpudispatch.c:670: warning: implicit declaration of function `sgl_frem'
fpudispatch.c:673: warning: implicit declaration of function `dbl_frem'
fpudispatch.c: In function `decode_2e':
fpudispatch.c:1354: warning: implicit declaration of function `dbl_fmpynfadd'
fpudispatch.c:1357: warning: implicit declaration of function `dbl_fmpyfadd'
fpudispatch.c:1376: warning: implicit declaration of function `sgl_fmpynfadd'
fpudispatch.c:1379: warning: implicit declaration of function `sgl_fmpyfadd'
...

I do think that lacks a header to define some function.

Thanks in advance for help,
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
