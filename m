Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA04283
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Feb 2000 11:18:38 -0700
Received: from hpdst41.cup.hp.com (hpdst41.cup.hp.com [15.16.128.62])
	by palrel3.hp.com (Postfix) with ESMTP id E7E82142E
	for <parisc-linux@thepuffingroup.com>; Fri, 11 Feb 2000 09:11:21 -0800 (PST)
Received: from jc356611 (jc356611.cup.hp.com [15.16.128.28]) by hpdst41.cup.hp.com with SMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id JAA21988 for <parisc-linux@thepuffingroup.com>; Fri, 11 Feb 2000 09:10:55 -0800 (PST)
Message-ID: <00ec01bf74b2$f4c6c050$1c80100f@jc356611.cup.hp.com>
From: "John Curry" <jcurry@cup.hp.com>
To: <parisc-linux@thepuffingroup.com>
Date: Fri, 11 Feb 2000 09:10:54 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Some PA-RISC 2.0 Gotchas
List-ID: <linux-parisc.vger.kernel.org>


Hello all,
            we have been looking into the kernel code for porting to the 2.0
Architecture. We have
stumbled upon a few gothas:

- In 2.0, function pointers are not addresses to functions, but are
addresses to data strcutures
called "function descriptors". So, if assembly code gets passed a pointer to
a function, it will have
to remember which slot in the "function descriptor" the actual function
pointer resides.

- There are some places in the kernel where the implicit assumption that
longs == ints will break!
For example, the parisc_set_bit  function is used in several places to
operate on bitmaps of type long.
Obviously, this function (and the other related functions) has to converted
to operate on 64-bit quantities.
But, in the free_area_struc type, the map variable is declared as an integer
ptr. Depending on the size of
the bitmap, this will cause the parisc_set_bit  to operate incorrectly. We
solved this problem by making
the map variable a unsigned long pointer.

- The 32-bit assembly LDIL, LDO trick of getting the address of some label
(or address) will not work the way you want.
In the 64-bit architeture, you will have to use MFIA in conjunction with
loading the difference from the address
you want, to where you are.


Hope these are of some use.

J.C.
