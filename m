Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from chac.inf.utfsm.cl (chac.inf.utfsm.cl [200.1.19.54])
	by dsl2.external.hp.com (Postfix) with ESMTP id 242B1482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 17:05:31 -0600 (MDT)
Message-Id: <200109031544.f83Fidbr002589@sleipnir.valparaiso.cl>
To: "David S. Miller" <davem@redhat.com>
Cc: ak@suse.de, alan@lxorguk.ukuu.org.uk, willy@debian.org,
	thunder7@xs4all.nl, parisc-linux@lists.parisc-linux.org,
	linux-kernel@vger.kernel.org
Subject: Re: [parisc-linux] documented Oops running big-endian reiserfs on parisc architecture 
In-Reply-To: Message from "David S. Miller" <davem@redhat.com>
   of "Mon, 03 Sep 2001 01:15:30 MST." <20010903.011530.62340995.davem@redhat.com>
Date: Mon, 03 Sep 2001 11:44:39 -0400
From: Horst von Brand <vonbrand@sleipnir.valparaiso.cl>
List-ID: <linux-parisc.vger.kernel.org>

"David S. Miller" <davem@redhat.com> said:
> IP header length is measured in octets, so how is this possible?
> :-)

1 octet == 8 bits in RFC-speak. "Byte" is the name given to character
units.  There were machines around with non-8-bit bytes. AFAIR, DEC PDP-10
had the options of 6, 7, or 8 bits/byte in 36 bit words. Purely historical
now, since (AFAIK) everybody has agreed with IBM (S/360?) that 1 byte == 8
bits. As Brian Reid (IIRC) used to say: "It is spelled 'o-c-t-e-t' and
pronounced 'byte'"
-- 
Horst von Brand                             vonbrand@sleipnir.valparaiso.cl
Casilla 9G, Vin~a del Mar, Chile                               +56 32 672616
