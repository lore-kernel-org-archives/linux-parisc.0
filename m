Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA22406
	for <parisc-linux@puffin.external.hp.com>; Tue, 11 Jul 2000 09:06:19 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 11 Jul 2000 15:07:50 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13C1cN-0006zT-00
	for <parisc-linux@thepuffingroup.com>; Tue, 11 Jul 2000 11:06:39 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 11 Jul 2000 11:06:37 -0400
Message-ID: <87em50btaa.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Don't rebuild gcc/glibc yet
List-ID: <linux-parisc.vger.kernel.org>

Hi,

glibc is currently a bit borken, probably because I foolishly tried to
enable 'long double' support in gcc:

/home/dhd/src/parisc/glibc-build/libc.a(vfscanf.o): In function `_IO_vfscanf':
/home/dhd/src/parisc/glibc/stdio-common/vfscanf.c:1582: undefined reference to `_U_Qfneg'
/home/dhd/src/parisc/glibc-build/libc.a(strtold.o): In function `__strtold_internal':
/home/dhd/src/parisc/glibc/stdlib/strtod.c:532: undefined reference to `_U_Qfcnvff_sgl_to_quad'

Is the long double stuff in gcc supposed to work at all?  (i.e. are
there definitions of those functions anywhere?)  I get 'sizeof(long
double) == 0' when configuring glibc, but strangely enough it still
wants to use them...

For now I'll back out that bit in gcc.  Sorry about this.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
