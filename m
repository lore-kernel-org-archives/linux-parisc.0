Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA27712
	for <parisc-linux@puffin.external.hp.com>; Mon, 29 Jan 2001 23:42:52 -0700
From: 5116@telia.com
Received: from zaphod.halden.lillfab.se (t5o70p38.telia.com [195.67.239.38])
	by maild.telia.com (8.9.3/8.9.3) with ESMTP id HAA22425
	for <parisc-linux@thepuffingroup.com>; Tue, 30 Jan 2001 07:46:52 +0100 (CET)
Received: (from danne@localhost)
	by zaphod.halden.lillfab.se (8.9.3/8.9.3) id HAA30526
	for parisc-linux@thepuffingroup.com; Tue, 30 Jan 2001 07:45:47 +0100
Message-Id: <200101300645.HAA30526@zaphod.halden.lillfab.se>
Date: Tue, 30 Jan 2001 07:45:46 +0100 (CET)
Reply-To: 5116@telia.com
To: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: TEXT/plain; CHARSET=US-ASCII
Subject: [parisc-linux] /proc/bus/gsc
List-ID: <linux-parisc.vger.kernel.org>

What is the plan for /proc/bus/gsc?

I see some unfinished support in drvices/gsc/gsc.c. and what about
devices which are not really GSC? Should there be a /proc/pdc/devices
for the complete story?

/Daniel 
-- 
