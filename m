Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA19292
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 May 2000 22:53:35 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 25 May 2000 04:53:49 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id OAA15203;
	Thu, 25 May 2000 14:51:44 +1000
Date: Thu, 25 May 2000 14:51:44 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] bad asm comments
In-Reply-To: <Pine.LNX.4.21.0005241116300.13743-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0005241750310.8974-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


I've patched these gcc files for the new binutils.  They ought to still
work with the old binutils too.

gcc/longlong.h
gcc/config/pa/lib1linux.asm
gcc/config/pa/lib2funcs-elf.S
gcc/config/pa/lib2funcs.asm

And these glibc files too.

csu/Makefile
stdlib/longlong.h
sysdeps/hppa/__longjmp.S
sysdeps/hppa/add_n.s
sysdeps/hppa/dl-machine.h
sysdeps/hppa/lshift.s
sysdeps/hppa/rshift.s
sysdeps/hppa/setjmp.S
sysdeps/hppa/sub_n.s
sysdeps/hppa/udiv_qrnnd.s
sysdeps/hppa/hppa1.1/addmul_1.s
sysdeps/hppa/hppa1.1/mul_1.s
sysdeps/hppa/hppa1.1/submul_1.s
sysdeps/hppa/hppa1.1/udiv_qrnnd.s
sysdeps/unix/sysv/linux/bits/errno.h

The csu/Makefile patch should put to rest the problem with csu/crti.S and
csu/crtn.S

-- 
Linuxcare.  Support for the Revolution.
