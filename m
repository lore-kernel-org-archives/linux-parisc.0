Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA11312
	for <parisc-linux@puffin.external.hp.com>; Thu, 7 Dec 2000 14:33:03 -0700
To: alan@linuxcare.com.au
Cc: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 07 Dec 2000 14:36:45 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001207213645.DB70E37CA1@carmen.fc.hp.com>
Subject: [parisc-linux] eprintf error when xcompiling gcc
List-ID: <linux-parisc.vger.kernel.org>

Hi Alan,

I'm trying to cross-compile gcc (--with-libc) and I get several thousand of 
the following error,

bad.o: In function `ffebad_here':
/home/al-76/puffin/palinux/gcc/gcc/f/bad.c:268: undefined reference to 
`__eprintf'
/opt/palinux/lib/gcc-lib/hppa-linux/2.96/../../../../hppa-linux/bin/ld: 
bad.o(.text+0x400): cannot find stub entry 00000052___eprintf+0
/opt/palinux/lib/gcc-lib/hppa-linux/2.96/../../../../hppa-linux/bin/ld: 
bad.o(.text+0x400): cannot handle R_PARISC_PCREL17F for __eprintf


The function/.o is different in each error but they all complain about 
__eprintf.
Is this a problem with the xcompiler or the source(or both)?
Is there something else I should be doing when xcompiling?
Is this a bug or am I doing something stupid?

Thanks,

-- 
Matt Taggart
taggart@fc.hp.com
