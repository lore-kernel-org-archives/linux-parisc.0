Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA17812
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Mar 2000 08:17:21 -0700
Received: from prismalink.com (IDENT:bheadley@d253.focal2.interaccess.com [207.208.137.253])
	by neuman.interaccess.com (8.9.0/8.9.0) with ESMTP id IAA05720
	for <parisc-linux@thepuffingroup.com>; Mon, 20 Mar 2000 08:18:49 -0600 (CST)
Sender: bheadley@neuman.interaccess.com
Message-ID: <38D631D4.2DC7A04@prismalink.com>
Date: Mon, 20 Mar 2000 08:12:37 -0600
From: "Bryan W. Headley" <bheadley@prismalink.com>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Notice that pre2 is out
List-ID: <linux-parisc.vger.kernel.org>

Arrived sometime Sunday. Lots of file movement; don't know what changed
yet. I was up to drivers/char with pre1, and expect I can apply
pre1_to_pre2 patches without much harm. Sunday was mostly a "get 6.2
beta working/get the 735 working". The latter is done, and it boots
10.20 and generally looks smug with itself. So that's good; gives me a
real machine to test merged baseline with. The x86 machine I was putting
6.2 on died, perhaps for the last time. I have an old RS/6000 that needs
a port that can take it's slot very easily...

--
Bryan W. Headley                     Phone: 312/913-9158
Chief Technology Officer             Fax:   312/913-9155
Prisma & Company                     Email: bheadley@prismalink.com
