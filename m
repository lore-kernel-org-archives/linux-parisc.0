Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA05543
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 May 2000 19:00:01 -0600
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by cosrel1.hp.com (Postfix) with ESMTP id E0FA8340
	for <parisc-linux@thepuffingroup.com>; Tue, 23 May 2000 19:00:17 -0600 (MDT)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id 907CA37DA8
	for <parisc-linux@thepuffingroup.com>; Tue, 23 May 2000 19:01:51 -0600 (MDT)
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 23 May 2000 19:01:51 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20000524010151.907CA37DA8@carmen.fc.hp.com>
Subject: [parisc-linux] bad asm comments
List-ID: <linux-parisc.vger.kernel.org>

In building gcc/binutils-2.10 today I discovered a few asm files that are 
still using ! as a comment character. They are,

./gcc/gcc/config/pa/lib2funcs-elf.S
./glibc/csu/crti.S
./glibc/csu/crtn.S
./glibc/sysdeps/hppa/__longjmp.S
./glibc/sysdeps/hppa/setjmp.S

Which need to be changed?

Thanks,

-- 
Matt Taggart
taggart@fc.hp.com
