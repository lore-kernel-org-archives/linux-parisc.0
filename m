Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA00987
	for <parisc-linux@puffin.external.hp.com>; Fri, 29 Oct 1999 18:54:59 -0600
Received: from milano.cup.hp.com (grundler@milano.cup.hp.com [15.16.124.11])
	by atlrel1.hp.com (8.9.3 (PHNE_18979)/8.8.5tis) with ESMTP id UAA18327
	for <parisc-linux@thepuffingroup.com>; Fri, 29 Oct 1999 20:55:19 -0400 (EDT)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id RAA07975 for parisc-linux@thepuffingroup.com; Fri, 29 Oct 1999 17:56:40 -0700 (PDT)
Date: Fri, 29 Oct 1999 17:56:40 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <199910300056.RAA07975@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
Subject: [parisc-linux] udelay accuracy
List-ID: <linux-parisc.vger.kernel.org>

FYA,
Here's some data on the accuracy of udelay().
Test was read cr16, udelay(x), read cr16, print cr16 delta.
I collected this from my A180.
Numbers on the right of the ":" is the cr16 delta.

udelay test 10 :  2023 1896 1896 1896 1896 1896 1896 1896 1896 1896
udelay test 20 :  3731 3681 3681 3681 3681 3681 3681 3681 3681 3681
udelay test 30 :  5507 5472 5472 5472 5472 5472 5472 5472 5472 5472
udelay test 100 :  18028 17967 17967 17967 17967 17967 17967 17967 17967 17967
udelay test 200 :  35885 35815 35815 35815 35815 35815 35815 35815 35815 35815
udelay test 300 :  53665 53665 53665 53665 53665 53665 53665 53665 53665 53665
udelay test 1000 :  178615 178615 178615 178615 178615 178615 178615 178615 178615 178615
udelay test 2000 :  357115 357115 357115 357115 357115 357115 357115 357115 357115 357115
udelay test 3000 :  535615 538451 535615 535615 535615 535615 535615 535615 535615 535615

Expected output for "180Mhz" machine:
	udelay(10) 1800
	udelay(20) 3600
	...
	udelay(3000) 540000

The difference between the first invocation and successive might be a problem.
I don't know what the expected accuracy is.
If +- 10% is ok, we are there.

grant

ps. thanks to ftr for helping figure out the expected values.
    page zero (0x38c) contains the number of cycles per 10ms
    for every box. This can be accessed from the A180
    service menu: "mr 0x38c 2"
