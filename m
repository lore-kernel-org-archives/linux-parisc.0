Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9B91482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 02:15:55 -0600 (MDT)
Date: Mon, 03 Sep 2001 01:15:30 -0700 (PDT)
Message-Id: <20010903.011530.62340995.davem@redhat.com>
To: ak@suse.de
Cc: alan@lxorguk.ukuu.org.uk, willy@debian.org, thunder7@xs4all.nl,
	parisc-linux@lists.parisc-linux.org, linux-kernel@vger.kernel.org
Subject: Re: [parisc-linux] documented Oops running big-endian reiserfs on
 parisc architecture
From: "David S. Miller" <davem@redhat.com>
In-Reply-To: <oup66b0zq9j.fsf@pigdrop.muc.suse.de>
References: <20010903002514.X5126@parcelfarce.linux.theplanet.co.uk.suse.lists.linux.kernel>
	<E15dghq-0000bZ-00@the-village.bc.nu.suse.lists.linux.kernel>
	<oup66b0zq9j.fsf@pigdrop.muc.suse.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

   From: Andi Kleen <ak@suse.de>
   Date: 03 Sep 2001 09:29:12 +0200
   
   And also everybody connected to the internet needs them, because you can 
   create arbitarily unaligned TCP/UDP/ICMP headers using IP option byte sized 
   NOPs. 

IP header length is measured in octets, so how is this possible?
:-)

Later,
David S. Miller
davem@redhat.com
