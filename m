Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5179E4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 11:57:52 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by transport.cksoft.de (Postfix) with ESMTP id CBE181FFEAA
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 19:57:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mail.int.zabbadoz.net (Postfix) with ESMTP id 933A822E13
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 18:57:07 +0000 (UTC)
Date: Tue, 12 Nov 2002 18:57:07 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.BSF.4.44.0211121854470.32930-100000@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] [2.5] rtc doesn't build
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


thi sseems to be a problem with nonexistent defines expected
to be in include/asm-parisc/mc146818rtc.h


  gcc -Wp,-MD,drivers/char/.rtc.o.d -D__KERNEL__ -Iinclude -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -D__linux__ -pipe -fno-strength-reduce -mno-space-regs -mfast-indirect-calls -mdisable-fpregs -ffunction-sections -nostdinc -iwithprefix include -DMODULE -include include/linux/modversions.h   -DKBUILD_BASENAME=rtc -DEXPORT_SYMTAB  -c -o drivers/char/rtc.o drivers/char/rtc.c
drivers/char/rtc.c: In function `rtc_do_ioctl':
drivers/char/rtc.c:411: warning: implicit declaration of function `CMOS_READ'
drivers/char/rtc.c:412: `RTC_ALWAYS_BCD' undeclared (first use in this function)
drivers/char/rtc.c:412: (Each undeclared identifier is reported only once
drivers/char/rtc.c:412: for each function it appears in.)
drivers/char/rtc.c:418: warning: implicit declaration of function `CMOS_WRITE'
drivers/char/rtc.c: In function `rtc_init':
drivers/char/rtc.c:858: warning: implicit declaration of function `RTC_PORT'
drivers/char/rtc.c: In function `get_rtc_time':
drivers/char/rtc.c:1162: `RTC_ALWAYS_BCD' undeclared (first use in this function)
drivers/char/rtc.c: In function `get_rtc_alm_time':
drivers/char/rtc.c:1201: `RTC_ALWAYS_BCD' undeclared (first use in this function)
make[2]: *** [drivers/char/rtc.o] Error 1
make[1]: *** [drivers/char] Error 2
make: *** [drivers] Error 2




-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
