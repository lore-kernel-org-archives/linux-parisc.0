Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id A32D6482C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Nov 2001 08:47:55 -0700 (MST)
Date: Fri, 16 Nov 2001 07:47:46 -0800 (PST)
Message-Id: <20011116.074746.133020969.davem@redhat.com>
To: willy@debian.org
Cc: grundler@puffin.external.hp.com, linux-mm@kvack.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: parisc scatterlist doesn't want page/offset
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <20011116154350.L25491@parcelfarce.linux.theplanet.co.uk>
References: <20011116152601.K25491@parcelfarce.linux.theplanet.co.uk>
	<20011116.073328.129356309.davem@redhat.com>
	<20011116154350.L25491@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
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

   From: Matthew Wilcox <willy@debian.org>
   Date: Fri, 16 Nov 2001 15:43:50 +0000
   
   grant suggested adding support for it had performance implications,
   so he wasn't willing to let me make that edit.  i'm not sure i entirely
   understand the new scheme either.  the danger of updating code without
   updating its supporting documentation.

If "address" is NULL, use page+offset.  It's pretty simple.
