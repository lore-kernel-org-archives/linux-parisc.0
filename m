Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 22D39482E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Nov 2001 10:11:56 -0700 (MST)
Message-Id: <200111161706.KAA26099@puffin.external.hp.com>
To: "David S. Miller" <davem@redhat.com>
Cc: willy@debian.org, linux-mm@kvack.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: parisc scatterlist doesn't want page/offset 
In-Reply-To: Message from "David S. Miller" <davem@redhat.com>
   of "Fri, 16 Nov 2001 08:57:54 PST." <20011116.085754.00483458.davem@redhat.com>
Date: Fri, 16 Nov 2001 10:06:57 -0700
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

"David S. Miller" wrote:
> Note the "should", nobody forces them to use page+offset in
> a driver and 2.4.x will NEVER require it.  They just won't
> be able to DMA highmem pages, that's all.

ok.  That's what I wanted to hear.

thanks,
grant
