Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9BFF8482B
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Mar 2003 22:39:56 -0700 (MST)
Date: Sun, 09 Mar 2003 21:18:06 -0800 (PST)
Message-Id: <20030309.211806.104521297.davem@redhat.com>
To: willy@debian.org
Cc: grundler@dsl2.external.hp.com, jsm@udlkern.fc.hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: RFC: mmap patch
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <20030310015005.GA5278@parcelfarce.linux.theplanet.co.uk>
References: <20030309144225.O3865@parcelfarce.linux.theplanet.co.uk>
	<20030309.133830.82279538.davem@redhat.com>
	<20030310015005.GA5278@parcelfarce.linux.theplanet.co.uk>
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
   Date: Mon, 10 Mar 2003 01:50:05 +0000
   
   Really, this should be doing a clear_user_page() -- but not all
   callers of this routine have a user address to pass on.

That sounds like the best fix to me.

The user address really is a "hint" to the routine, it need not be
precise.  Feel free to make this explicit in cachetlb.txt
