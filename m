Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id F1F34482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Sep 2001 17:04:50 -0600 (MDT)
Date: Sun, 02 Sep 2001 16:04:41 -0700 (PDT)
Message-Id: <20010902.160441.92583890.davem@redhat.com>
To: willy@debian.org
Cc: thunder7@xs4all.nl, parisc-linux@lists.parisc-linux.org,
	linux-kernel@vger.kernel.org
Subject: Re: [parisc-linux] documented Oops running big-endian reiserfs on
 parisc architecture
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <20010902150023.U5126@parcelfarce.linux.theplanet.co.uk>
References: <20010902105538.A15344@middle.of.nowhere>
	<20010902150023.U5126@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

   From: Matthew Wilcox <willy@debian.org>
   Date: Sun, 2 Sep 2001 15:00:23 +0100

   On Sun, Sep 02, 2001 at 10:55:38AM +0200, thunder7@xs4all.nl wrote:
   > ReiserFS version 3.6.25
   > bonnie[163]: Unaligned data reference 28
   
   As it says, an unaligned data reference.
   
BTW, you should not be OOPSing on this as unaligned references are
defined as completely normal, especially in the networking.

Is it impossible to handle unaligned access traps properly on
parisc?  If so, well you have some problems...

Later,
David S. Miller
davem@redhat.com
