Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA31673
	for <parisc-linux@puffin.external.hp.com>; Thu, 13 Apr 2000 17:38:35 -0600
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by palrel3.hp.com (Postfix) with ESMTP id DA12814D3
	for <parisc-linux@thepuffingroup.com>; Thu, 13 Apr 2000 16:38:32 -0700 (PDT)
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] building a glibc-based tool chain 
In-reply-to: Your message of "Tue, 11 Apr 2000 09:50:55 MDT."
             <E12f2wJ-0002l4-00@endor.fc.hp.com>
Date: Thu, 13 Apr 2000 17:38:31 -0600
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12ftBw-0003b1-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Ok, using my prior instructions you'll get a 'glibc' containing
x86 object files!  crt1.o is one of those, and is probably why the
linker segfaults.

Although this is still naive, a better glibc config command is:

.../configure  \
    --prefix=/opt/palinux/lib/gcc-lib/hppa1.1-linux/2.9-hppa-991112  \
    --disable-nls  \
    --disable-sanity-checks  \
    --disable-shared  \
    --host=hppa1.1-linux  \
    --target=hppa1.1-linux  \
    --build=i386-linux  \
    --with-headers=/opt/puffin/include  \
    --without-nls  \
    --disable-profile

Currently this is dying in the glibc build but that will probably get
fixed tomorrow.

	-P
