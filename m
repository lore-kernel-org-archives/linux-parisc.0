Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA20263
	for <parisc-linux@puffin.external.hp.com>; Sat, 21 Oct 2000 11:31:17 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 5EA1C3FB5
	for <parisc-linux@thepuffingroup.com>; Sat, 21 Oct 2000 10:32:33 -0700 (PDT)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id KAA17095
	for parisc-linux@thepuffingroup.com; Sat, 21 Oct 2000 10:37:08 -0700 (PDT)
Date: Sat, 21 Oct 2000 10:37:08 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200010211737.KAA17095@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] __FUNCTION__ work?
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
Can anyone tell me if __FUNCTION__ works for the 32-bit tool chain?


I'm quite certain it's not working for the 64-bit toolchain.
Alan (Modra), can you fix that?

The output I get from:
	printk(__FUNCTION__ "() starts\n");

is
	() starts

It's not a disaster, just slightly annoying when debug code
doesn't tell me everything I expect. And I know this worked
before in the 32-bit toolchain (and probably still does).

thanks,
grant
