Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thebsh.namesys.com (thebsh.namesys.com [212.16.0.238])
	by dsl2.external.hp.com (Postfix) with SMTP id 0403E482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 05:05:59 -0600 (MDT)
Sender: root@dsl2.external.hp.com
Message-ID: <3B935FF8.935244CE@namesys.com>
Date: Mon, 03 Sep 2001 14:48:24 +0400
From: Hans Reiser <reiser@namesys.com>
MIME-Version: 1.0
To: Andi Kleen <ak@suse.de>
Cc: "David S. Miller" <davem@redhat.com>, alan@lxorguk.ukuu.org.uk,
	willy@debian.org, thunder7@xs4all.nl,
	parisc-linux@lists.parisc-linux.org, linux-kernel@vger.kernel.org
Subject: Re: [parisc-linux] documented Oops running big-endian reiserfs on parisc
 architecture
References: <20010903002514.X5126@parcelfarce.linux.theplanet.co.uk.suse.lists.linux.kernel> <E15dghq-0000bZ-00@the-village.bc.nu.suse.lists.linux.kernel> <oup66b0zq9j.fsf@pigdrop.muc.suse.de> <20010903.011530.62340995.davem@redhat.com> <20010903104105.A3398@gruyere.muc.suse.de>
Content-Type: text/plain; charset=koi8-r
List-ID: <linux-parisc.vger.kernel.org>

Ok, so the sum of this is that Jeff's patches work on the platforms he wrote
them for, and we need one more fix for PA-RISC.

So, we can reasonably send Jeff's patches to Linus, and test and then put the
PA-RISC patch into the AC tree, any disagreement?

Hans
