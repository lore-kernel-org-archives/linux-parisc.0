Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA06165
	for <parisc-linux@puffin.external.hp.com>; Fri, 2 Jun 2000 22:22:45 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 3 Jun 2000 04:23:12 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id OAA24979;
	Sat, 3 Jun 2000 14:23:02 +1000
Date: Sat, 3 Jun 2000 14:23:02 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: bame@puffin.external.hp.com
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] New glibc and new linker SEGV
In-Reply-To: <Pine.LNX.4.21.0006031200490.22936-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0006031418130.22936-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 2 Jun 2000 bame@puffin.external.hp.com wrote:

>     hppa1.1-linux-gcc -nostdlib -nostartfiles -o locale/localedef [...]
>     collect2: ld terminated with signal 11 [Segmentation fault], core dumped
>     make[2]: *** [/work/xc-build/build-glibc/locale/localedef] Error 1

Arrgh.  More of those undefined weak symbols.  This one used DPREL21L, and
sym_sec is NULL...  I'll be committing a fix soon, after I've done some
testing.

Regards, Alan Modra
-- 
Linuxcare.  Support for the Revolution.
