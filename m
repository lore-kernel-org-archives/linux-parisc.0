Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0FA9C482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Dec 2001 17:30:27 -0700 (MST)
Message-Id: <200112130025.RAA12183@puffin.external.hp.com>
To: "James P. Kinney III" <jkinney@localnetsolutions.com>
Cc: palinux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C160 STI console woes 
In-Reply-To: Message from "James P. Kinney III" <jkinney@localnetsolutions.com>
   of "12 Dec 2001 17:33:43 EST." <1008196423.31094.55.camel@archimedes.localnetsolutions.com>
Date: Wed, 12 Dec 2001 17:25:29 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

"James P. Kinney III" wrote:
> (Why is the PCI socket "backwards"? I've got a great Matrox Millineum ...)

You mean the keying of the PCI slot?
I don't know if C160 supports 3.3v, 5.5v, or both. I'd need to dig
up a product data sheet to tell you which the C160 (not C160L)
supported. But if your card doesn't fit the keys in the slot,
it's *not* electrically compatible.

Secondly, folks with broken Dino's built-in, can *only* plug
in HP-UPX supported graphics cards once firmware is upgraded
to 5.x or better (on older B and C-class machines).
PDC won't boot with anything else installed - but no harm
in trying (unlike mismatched PCI slot keys).

grant
