Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA04258
	for <parisc-linux@puffin.external.hp.com>; Tue, 8 Feb 2000 18:37:02 -0700
Received: from hpdst41.cup.hp.com (hpdst41.cup.hp.com [15.16.128.62])
	by atlrel1.hp.com (Postfix) with ESMTP id 29A4A8221
	for <parisc-linux@thepuffingroup.com>; Tue,  8 Feb 2000 19:32:21 -0500 (EST)
Received: from cup.hp.com (hpdst231.cup.hp.com [15.16.129.192]) by hpdst41.cup.hp.com with ESMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id QAA28782 for <parisc-linux@thepuffingroup.com>; Tue, 8 Feb 2000 16:32:20 -0800 (PST)
Message-ID: <38A0B5CB.DCF1C486@cup.hp.com>
Date: Tue, 08 Feb 2000 16:33:15 -0800
From: Ullas Ponnadi <uponnadi@cup.hp.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Timer Interrupt and Scheduler
List-ID: <linux-parisc.vger.kernel.org>

Could someone give me more insight into how the scheduler would get
called
when a timer interrupt happens? I tried tracing through the code
handling the
external interrupt and am at a loss trying to figure out this part.

Thanks,

Ullas Ponnadi
