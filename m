Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA13384
	for <parisc-linux@puffin.external.hp.com>; Thu, 3 Jun 1999 11:57:09 -0600
Received: from relay.ch.genedata.com (pinatubo-e0.ch.genedata.com [157.161.173.48])
	by mail.core.genedata.com (8.9.3/8.9.3) with ESMTP id TAA02685
	for <parisc-linux@thepuffingroup.com>; Thu, 3 Jun 1999 19:57:04 +0200
Received: from mencheca.ch.genedata.com (root@mencheca.ch.genedata.com [157.161.173.82])
	by relay.ch.genedata.com (8.9.3/8.9.3) with ESMTP id TAA880908
	for <parisc-linux@thepuffingroup.com>; Thu, 3 Jun 1999 19:57:04 +0200 (CEST)
Received: by genedata.com
	via sendmail from stdin
	id <m10pbjk-00028pC@mencheca.ch.genedata.com> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Thu, 3 Jun 1999 19:57:04 +0200 (CEST)
Date: Thu, 3 Jun 1999 19:57:04 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19990603195704.Q1410@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] binfmt_som
List-ID: <linux-parisc.vger.kernel.org>


I've checked in a binfmt_som which I think might work.  However,
it definitely won't work until someone defines put_user() & friends
in include/asm-parisc/uaccess.h.

I also inserted a declaration of start_thread in <asm/processor.h> --
some platforms have it as a macro, some have it as a function, so I
think linking will now fail with that as an undefined symbol.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
