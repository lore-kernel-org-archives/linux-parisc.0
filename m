Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA18424
	for <parisc-linux@puffin.external.hp.com>; Mon, 6 Sep 1999 11:50:38 -0600
Received: from relay.ch.genedata.com (pinatubo-e0.ch.genedata.com [157.161.173.48])
	by mail.core.genedata.com (8.9.3/8.9.3) with ESMTP id TAA03076
	for <parisc-linux@thepuffingroup.com>; Mon, 6 Sep 1999 19:52:35 +0200
Received: from mencheca.ch.genedata.com (root@mencheca.ch.genedata.com [157.161.173.82])
	by relay.ch.genedata.com (8.9.3/8.9.3) with ESMTP id TAA755033
	for <parisc-linux@thepuffingroup.com>; Mon, 6 Sep 1999 19:52:34 +0200 (CEST)
Received: by genedata.com
	via sendmail from stdin
	id <m11O2wU-0002KnC@mencheca.ch.genedata.com> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Mon, 6 Sep 1999 19:52:34 +0200 (CEST)
Date: Mon, 6 Sep 1999 19:52:33 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19990906195233.E493@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] status on 715/33
List-ID: <linux-parisc.vger.kernel.org>


I've got my 715/33 as far as panicing because it can't find `init'.
There's a couple of small changes (which Philipp has) to get it through
the perils of handling the timer interrupt.  After that, it will crash
in pci_init() if that's enabled (looks like dereferencing a null pointer
to me), so disable CONFIG_PCI.  I'll investigate further tomorrow.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
