Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (lightning.swansea.linux.org.uk [194.168.151.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 838B8482A
	for <parisc-linux@parisc-linux.org>; Tue, 21 Aug 2001 08:10:57 -0600 (MDT)
Subject: Re: [parisc-linux] iotree thoughts
To: willy@debian.org (Matthew Wilcox)
Date: Tue, 21 Aug 2001 15:12:42 +0100 (BST)
Cc: grundler@puffin.external.hp.com (Grant Grundler),
	willy@debian.org (Matthew Wilcox), parisc-linux@parisc-linux.org
In-Reply-To: <20010821080953.B12638@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Aug 21, 2001 08:09:53 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E15ZCGo-0007vc-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> or we just make inb() BUG().

Its probably more useful to make it print the port numher and traceback then
continue. That way any minor escapees will get back some cookie you pick
(eg 0xFF) and you can chase them out easily
