Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA18178
	for <parisc-linux@puffin.external.hp.com>; Tue, 17 Oct 2000 03:10:57 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 17 Oct 2000 09:12:14 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id UAA12051;
	Tue, 17 Oct 2000 20:08:29 +1100
Date: Tue, 17 Oct 2000 20:08:29 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
cc: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Troubles following the 'recipe'
In-Reply-To: <39EC0F06.4C908926@admin.france.hp.com>
Message-ID: <Pine.LNX.4.21.0010171957521.9896-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 17 Oct 2000, Bruno Vidal wrote:

> but in the make install:
> .././scripts/install-sh -c /opt/linux_hppa/src/build/glibc/elf/ld.so /opt/linux/hppa-linux/lib/ld-2.1.92.so.new
> mv -f /opt/linux/hppa-linux/lib/ld-2.1.92.so.new /opt/linux/hppa-linux/lib/ld-2.1.92.so
> make[2]: *** No rule to make target `/opt/linux/hppa-linux/lib/libc-2.1.92.so', needed by `/opt/linux/hppa-linux/lib/ld.so.1'.  Stop.

Immediately after installing ld.so, "make install" should be installing
the new libc.so.  Hmm, your glibc sources are not the latest puffin ones,
as the latest glibc will install as 2.1.94  You might have better luck
after updating (via cvs).  At some point glibc configure was changed to
require make-3.79.1 or later to compile glibc, perhaps in response to a
problem such as you are seeing, so maybe you also need to upgrade "make".

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
