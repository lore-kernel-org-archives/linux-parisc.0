Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id B099F482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Sep 2001 17:26:37 -0600 (MDT)
Date: Sun, 02 Sep 2001 16:26:32 -0700 (PDT)
Message-Id: <20010902.162632.55510336.davem@redhat.com>
To: willy@debian.org
Cc: thunder7@xs4all.nl, parisc-linux@lists.parisc-linux.org,
	linux-kernel@vger.kernel.org
Subject: Re: [parisc-linux] documented Oops running big-endian reiserfs on
 parisc architecture
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <20010903002514.X5126@parcelfarce.linux.theplanet.co.uk>
References: <20010902150023.U5126@parcelfarce.linux.theplanet.co.uk>
	<20010902.160441.92583890.davem@redhat.com>
	<20010903002514.X5126@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

   From: Matthew Wilcox <willy@debian.org>
   Date: Mon, 3 Sep 2001 00:25:14 +0100
   
   No, we just haven't bothered to implement it yet.  Not many people
   use IPX these days.
   
IPX is not the only way this can happen.  Normal IPv4 can get
it with some ethernet cards on receive.

Later,
David S. Miller
davem@redhat.com
