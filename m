Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2B48D482C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Nov 2001 09:49:53 -0700 (MST)
Message-Id: <200111161644.JAA26017@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: "David S. Miller" <davem@redhat.com>, linux-mm@kvack.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: parisc scatterlist doesn't want page/offset 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Fri, 16 Nov 2001 15:43:50 GMT." <20011116154350.L25491@parcelfarce.linux.theplanet.co.uk>
Date: Fri, 16 Nov 2001 09:44:57 -0700
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

Matthew Wilcox wrote:
> grant suggested adding support for it had performance implications,

Jens is right to some degree - I'm counting cycles in that code
path since every driver depends on it for every IO request.
Until page/offset completely replaces address, I see a net increase
in cycles for parisc (probably most archs) with only a tangible benefit
for i386. Seems like the burden should be on the i386 folks to not
impact other arches.

My main gripe is adding this to 2.4 seems like the wrong time/place.
I'm happy to revisit this in 2.5.

grant

ps. I still have to go hunt down the discussion jens was referring to.
  Maybe if I understood the direction better, I'd be more receptive.
