Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA21348
	for <parisc-linux@puffin.external.hp.com>; Mon, 29 Jan 2001 14:55:49 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 33EDEE35
	for <parisc-linux@thepuffingroup.com>; Mon, 29 Jan 2001 13:59:23 -0800 (PST)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id OAA26531
	for parisc-linux@thepuffingroup.com; Mon, 29 Jan 2001 14:01:36 -0800 (PST)
Date: Mon, 29 Jan 2001 14:01:36 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200101292201.OAA26531@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] register_fallback_cpu()
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
I committed a change to address some deficiencies in our hp_devices
handling and the change also affected older architectures. In particular,
I replaced register_modules() interface (whose name neither Matthew
nor I liked) with two functions: alloc_pa_dev() and register_pa_dev().

register_fallback_cpu() was one of the functions used by older HW
that I was not able to test. If anyone has time to pull a new kernel
and play with it, that would be good. Please let me know ASAP, if I
broke it. I'm happy to help fix it again.

grant
