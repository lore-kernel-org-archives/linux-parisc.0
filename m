Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA03882
	for <parisc-linux@puffin.external.hp.com>; Mon, 16 Oct 2000 17:14:23 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 7DD31FCB
	for <parisc-linux@thepuffingroup.com>; Mon, 16 Oct 2000 16:15:24 -0700 (PDT)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id QAA12345
	for parisc-linux@thepuffingroup.com; Mon, 16 Oct 2000 16:19:41 -0700 (PDT)
Date: Mon, 16 Oct 2000 16:19:41 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200010162319.QAA12345@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] CPU "driver"?
List-ID: <linux-parisc.vger.kernel.org>

I've start thinking about our SMP support.
The PDC PAT work I'm doing now will also require some changes
to iosapic.c and how iosapic gets information from the firmware.

This led me to the idea that we should have a driver to claim
CPU instances. Some advantages

o CPU initialization code in fewer places. It's currently
  spread about in the inventory.c, setup.c, etc files.
  + fill in CPU specific data (eg id_eid or HPA) from PDC calls.
  + initialize other per CPU instance data (eg counters)
  + allocate/initialize per CPU IRQ_REGION and interupt handling.

o dynamic CPU add/removal possible using the driver callback's.
  (well, at least for now the add)
  + single place to cram CPU specific add/remove code.

I'm not sure what the drawbacks would be (SMP rendevous?)
but like to hear from others if I should or shouldn't
write such a driver.

thanks,
grant
