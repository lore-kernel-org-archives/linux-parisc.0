Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 483D64829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Nov 2002 14:06:27 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by transport.cksoft.de (Postfix) with ESMTP id 2C8A51FFEC0
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Nov 2002 22:06:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mail.int.zabbadoz.net (Postfix) with ESMTP id 9592F22E18
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Nov 2002 21:05:51 +0000 (UTC)
Date: Fri, 8 Nov 2002 21:05:51 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.BSF.4.44.0211082101420.32930-100000@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] 2.5 kernel compilation error
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

I had not been following these lists and parisc development for more
than half a year now.

I saw a post on 2.5 kernel in the archive for november but do not know
if this is the right place.

Nevertheless Willy and the ohers for sure are reading this ;-)

Are there any updates or fixes or do I need to have a look at it myself ?
This is a bk pull from 20021108-165510 UTC.


  gcc -Wp,-MD,arch/parisc/kernel/.setup.o.d -D__KERNEL__ -Iinclude -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -D__linux__ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect-calls -mdisable-fpregs -ffunction-sections -nostdinc
-iwithprefix include    -DKBUILD_BASENAME=setup   -c -o arch/parisc/kernel/setup.o arch/parisc/kernel/setup.c
arch/parisc/kernel/setup.c: In function `parisc_proc_mkdir':
arch/parisc/kernel/setup.c:215: warning: enumeration value `pcx' not handled in switch
arch/parisc/kernel/setup.c:215: warning: enumeration value `pcxs' not handled in switch
arch/parisc/kernel/setup.c:215: warning: enumeration value `pcxt' not handled in switch
  gcc -Wp,-MD,arch/parisc/kernel/.traps.o.d -D__KERNEL__ -Iinclude -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -D__linux__ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect-calls -mdisable-fpregs -ffunction-sections -nostdinc
-iwithprefix include    -DKBUILD_BASENAME=traps   -c -o arch/parisc/kernel/traps.o arch/parisc/kernel/traps.c
  gcc -Wp,-MD,arch/parisc/kernel/.time.o.d -D__KERNEL__ -Iinclude -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -D__linux__ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect-calls -mdisable-fpregs -ffunction-sections -nostdinc
-iwithprefix include    -DKBUILD_BASENAME=time   -c -o arch/parisc/kernel/time.o arch/parisc/kernel/time.c
  gcc -Wp,-MD,arch/parisc/kernel/.irq.o.d -D__KERNEL__ -Iinclude -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -D__linux__ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect-calls -mdisable-fpregs -ffunction-sections -nostdinc -iwithprefix
include    -DKBUILD_BASENAME=irq   -c -o arch/parisc/kernel/irq.o arch/parisc/kernel/irq.c
arch/parisc/kernel/irq.c: In function `show_interrupts':
arch/parisc/kernel/irq.c:238: subscripted value is neither array nor pointer
arch/parisc/kernel/irq.c: In function `do_irq':
arch/parisc/kernel/irq.c:375: subscripted value is neither array nor pointer
make[1]: *** [arch/parisc/kernel/irq.o] Error 1
make: *** [arch/parisc/kernel] Error 2

Thanks.

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
