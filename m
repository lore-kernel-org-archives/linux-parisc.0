Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (lightning.swansea.linux.org.uk [194.168.151.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0803D482C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Nov 2001 10:25:07 -0700 (MST)
Subject: Re: [parisc-linux] Re: parisc scatterlist doesn't want page/offset
To: grundler@puffin.external.hp.com (Grant Grundler)
Date: Fri, 16 Nov 2001 17:31:22 +0000 (GMT)
Cc: willy@debian.org (Matthew Wilcox),
	davem@redhat.com (David S. Miller), linux-mm@kvack.org,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <200111161644.JAA26017@puffin.external.hp.com> from "Grant Grundler" at Nov 16, 2001 09:44:57 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E164mpm-0004a2-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
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

> Until page/offset completely replaces address, I see a net increase
> in cycles for parisc (probably most archs) with only a tangible benefit
> for i386. Seems like the burden should be on the i386 folks to not
> impact other arches.
> My main gripe is adding this to 2.4 seems like the wrong time/place.
> I'm happy to revisit this in 2.5.

Its a bad impact on x86 so unfortunately it does need doing and I agree with
Dave - DaveM rarely implements something that is x86 beneficial but harms 
his beloved sparc64 without good reason.

Alan
