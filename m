Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from Cantor.suse.de (ns.suse.de [213.95.15.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5E3C9482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 02:41:08 -0600 (MDT)
Date: Mon, 3 Sep 2001 10:41:05 +0200
From: Andi Kleen <ak@suse.de>
To: "David S. Miller" <davem@redhat.com>
Cc: ak@suse.de, alan@lxorguk.ukuu.org.uk, willy@debian.org,
	thunder7@xs4all.nl, parisc-linux@lists.parisc-linux.org,
	linux-kernel@vger.kernel.org
Subject: Re: [parisc-linux] documented Oops running big-endian reiserfs on parisc architecture
Message-ID: <20010903104105.A3398@gruyere.muc.suse.de>
References: <20010903002514.X5126@parcelfarce.linux.theplanet.co.uk.suse.lists.linux.kernel> <E15dghq-0000bZ-00@the-village.bc.nu.suse.lists.linux.kernel> <oup66b0zq9j.fsf@pigdrop.muc.suse.de> <20010903.011530.62340995.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010903.011530.62340995.davem@redhat.com>; from davem@redhat.com on Mon, Sep 03, 2001 at 01:15:30AM -0700
Sender: ak@suse.de
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Sep 03, 2001 at 01:15:30AM -0700, David S. Miller wrote:
>    From: Andi Kleen <ak@suse.de>
>    Date: 03 Sep 2001 09:29:12 +0200
>    
>    And also everybody connected to the internet needs them, because you can 
>    create arbitarily unaligned TCP/UDP/ICMP headers using IP option byte sized 
>    NOPs. 
> 
> IP header length is measured in octets, so how is this possible?
> :-)

Sorry that came out wrong. You can in theory generate unaligned IP options this way, but the 
kernel handles this correctly using memcpy. What it doesn't handle is unaligned TCP options
(e.g. timestamps); which you can create using TCP option byte fillers.

Also the 4 byte alignment of the header doesn't help much when the driver didn't cooperate.

-Andi
