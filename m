Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8B8F4482D
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Nov 2001 08:33:35 -0700 (MST)
Date: Fri, 16 Nov 2001 07:33:28 -0800 (PST)
Message-Id: <20011116.073328.129356309.davem@redhat.com>
To: willy@debian.org
Cc: grundler@puffin.external.hp.com, linux-mm@kvack.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: parisc scatterlist doesn't want page/offset
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <20011116152601.K25491@parcelfarce.linux.theplanet.co.uk>
References: <20011116150454.J25491@parcelfarce.linux.theplanet.co.uk>
	<20011116.071751.12999342.davem@redhat.com>
	<20011116152601.K25491@parcelfarce.linux.theplanet.co.uk>
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
   Date: Fri, 16 Nov 2001 15:26:01 +0000
   
   so when jens' code is merged back into 2.4 we won't have to make any
   changes to the arch dependent code?
   
Part of the criteria to whether we merge back Jens' code is
if the ports, given reasonable notice (ie. take this as your notice)
have added in the support for page+offset pairs to their pci_map_sg
code.

I suggest you do this now, it is totally painless.  I would almost
classify it as a mindless edit.

Franks a lot,
David S. Miller
davem@redhat.com
