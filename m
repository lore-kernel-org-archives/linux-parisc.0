Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA22781
	for <parisc-linux@puffin.external.hp.com>; Sat, 28 Aug 1999 19:16:45 -0600
Received: from relay.ch.genedata.com (pinatubo-e0.ch.genedata.com [157.161.173.48])
	by mail.core.genedata.com (8.9.3/8.9.3) with ESMTP id DAA04316
	for <parisc-linux@thepuffingroup.com>; Sun, 29 Aug 1999 03:18:14 +0200
Received: from mencheca.ch.genedata.com (root@mencheca.ch.genedata.com [157.161.173.82])
	by relay.ch.genedata.com (8.9.3/8.9.3) with ESMTP id DAA932730
	for <parisc-linux@thepuffingroup.com>; Sun, 29 Aug 1999 03:18:13 +0200 (CEST)
Received: by genedata.com
	via sendmail from stdin
	id <m11Ktbo-00029uC@mencheca.ch.genedata.com> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Sun, 29 Aug 1999 03:18:12 +0200 (CEST)
Date: Sun, 29 Aug 1999 03:18:12 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19990829031812.J493@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] keyboard driver
List-ID: <linux-parisc.vger.kernel.org>


Is anyone working on the keyboard driver for the 715/33 (and presumably
some other models)?  It appears to be an HIL keyboard, and there's
already an HIL driver in arch/m68k/hp300/hil.c.  Is this likely to work?
Is there any documentation available for this?

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
