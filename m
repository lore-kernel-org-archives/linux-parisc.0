Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA10784
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Jun 1999 09:21:33 -0600
Received: from relay.ch.genedata.com (pinatubo-e0.ch.genedata.com [157.161.173.48])
	by mail.core.genedata.com (8.9.3/8.9.3) with ESMTP id RAA31189
	for <parisc-linux@thepuffingroup.com>; Mon, 28 Jun 1999 17:21:42 +0200
Received: from mencheca.ch.genedata.com (root@mencheca.ch.genedata.com [157.161.173.82])
	by relay.ch.genedata.com (8.9.3/8.9.3) with ESMTP id RAA3135190
	for <parisc-linux@thepuffingroup.com>; Mon, 28 Jun 1999 17:21:42 +0200 (CEST)
Received: by genedata.com
	via sendmail from stdin
	id <m10ydE5-00025cC@mencheca.ch.genedata.com> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Mon, 28 Jun 1999 17:21:41 +0200 (CEST)
Date: Mon, 28 Jun 1999 17:21:41 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19990628172141.G30362@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Anyone got a few moments?
List-ID: <linux-parisc.vger.kernel.org>


Which of the people involved in this project know PA-RISC assembler?

We need xchg() written (in include/asm-parisc/system.h) before the
networking will compile.  We're going to need other stuff written too of
course; I know ARM assembler, so I guess I could probably learn PA-RISC
asm if no-one else wants to.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
