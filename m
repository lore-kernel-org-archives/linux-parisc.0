Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA26629
	for <parisc-linux@puffin.external.hp.com>; Wed, 26 Jan 2000 10:50:33 -0700
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by palrel3.hp.com (Postfix) with ESMTP id B88B8671
	for <parisc-linux@thepuffingroup.com>; Wed, 26 Jan 2000 08:51:23 -0800 (PST)
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] egcs 2.9-hppa release 
In-reply-to: Your message of "Mon, 24 Jan 2000 01:01:53 PST."
             <20000124010153.D8024@linuxcare.com>
Date: Wed, 26 Jan 2000 09:50:21 -0700
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12DVe9-0000cu-00@endor.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


I built the pa1.1 compiler from these bits but am unable to build
the pa2.0w compiler.  It dies when xgcc tries to compile gcc/libgcc2.c
with a littany of nasty errors, many like this:

In file included from tm.h:6,
     from ../../src/gcc/config/pa/xm-pa64hpux.h:46,
      from tconfig.h:5,
       from ../../src/gcc/libgcc2.c:33:
       ../../src/gcc/config/pa/pa.h:29: overflow in enumeration values
       ../../src/gcc/config/pa/pa.h:42: overflow in enumeration values

I used 'configure --prefix=/opt/puffin --enable-languages=c,c++' and
which figured out on its own to build the 2.0w compiler.

No luck building on hp-ux 11.0 on a C3000.

Hints?

	-Paul Bame
