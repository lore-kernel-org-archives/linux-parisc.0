Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA05598
	for <parisc-linux@puffin.external.hp.com>; Sun, 30 May 1999 17:09:27 -0600
Received: from relay.ch.genedata.com (pinatubo-e0.ch.genedata.com [157.161.173.48])
	by mail.core.genedata.com (8.9.3/8.9.3) with ESMTP id BAA19454
	for <parisc-linux@thepuffingroup.com>; Mon, 31 May 1999 01:09:22 +0200
Received: from mencheca.ch.genedata.com (root@mencheca.ch.genedata.com [157.161.173.82])
	by relay.ch.genedata.com (8.9.3/8.9.3) with ESMTP id BAA529504
	for <parisc-linux@thepuffingroup.com>; Mon, 31 May 1999 01:09:22 +0200 (CEST)
Received: by genedata.com
	via sendmail from stdin
	id <m10oEhm-00029yC@mencheca.ch.genedata.com> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Mon, 31 May 1999 01:09:22 +0200 (CEST)
Date: Mon, 31 May 1999 01:09:22 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19990531010922.S1410@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] binfmt_som
List-ID: <linux-parisc.vger.kernel.org>


I was a little over-optimistic about releasing a first cut today,
I guess :-)

I've moved `som.h' from include/asm-parisc/ to include/linux/, like elf.h
& a.out.h.  I've also populated it with the structures which I've needed
so far, copied from the document below.  binfmt_som.c is still showing
extreme signs of its ELF heritage and definitely won't compile yet.

I have a question; what is `union name_pt' defined as?  It's referenced
several times in ``32-bit PA-RISC Run-Time Architecture Document
11.0 version 1.0'', page 3-56 for one example.  However, grepping the
document reveals no trace of a definition of this (or `union name_p'
for that matter).

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
