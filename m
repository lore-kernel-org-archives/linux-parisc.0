Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA28055
	for <parisc-linux@puffin.external.hp.com>; Thu, 24 Aug 2000 11:29:07 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 24 Aug 2000 17:29:01 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13S0nQ-0006AM-00
	for <parisc-linux@thepuffingroup.com>; Thu, 24 Aug 2000 13:28:08 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 24 Aug 2000 13:28:07 -0400
Message-ID: <87d7iyr2l4.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] New native toolchain tarballs uploaded
List-ID: <linux-parisc.vger.kernel.org>

Hi,

ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/gcc-20000824.tar.gz
ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/glibc-20000824.tar.gz
ftp://puffin.external.hp.com/pub/parisc/binaries/userspace/binutils-20000824.tar.gz

These are tested and seem to work rather well so long as the kernel
cooperates.  Still static-only of course, but quite functional.

I'm native-building sysvinit and util-linux at the moment and will
upload new tarballs of them as well.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
