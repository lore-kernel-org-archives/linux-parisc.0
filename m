Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA26615
	for <parisc-linux@puffin.external.hp.com>; Sun, 20 Jun 1999 00:49:28 -0600
Received: from relay.ch.genedata.com (pinatubo-e0.ch.genedata.com [157.161.173.48])
	by mail.core.genedata.com (8.9.3/8.9.3) with ESMTP id IAA00429
	for <parisc-linux@thepuffingroup.com>; Sun, 20 Jun 1999 08:49:19 +0200
Received: from mencheca.ch.genedata.com (root@mencheca.ch.genedata.com [157.161.173.82])
	by relay.ch.genedata.com (8.9.3/8.9.3) with ESMTP id IAA2138315
	for <parisc-linux@thepuffingroup.com>; Sun, 20 Jun 1999 08:49:18 +0200 (CEST)
Received: by genedata.com
	via sendmail from stdin
	id <m10vbPq-00025eC@mencheca.ch.genedata.com> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Sun, 20 Jun 1999 08:49:18 +0200 (CEST)
Date: Sun, 20 Jun 1999 08:49:18 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19990620084918.H30362@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] strace/truss/par equivalent for HP-UX
List-ID: <linux-parisc.vger.kernel.org>


I've found trace for HP-UX 10.20 (and 10.10, 9.x) on ftp.interworks.org
(as recommended by the HPUX FAQ), however it doesn't appear to have been
updated for HP-UX 11.  What do you guys at HP use to trace programs?

Rather than waste time trying to get it to compile when it probably
won't link, anyone want to give me a trace of what system calls `sh'
makes when it starts up so I can have a crack at getting the most useful
bits of HPUX binary compatibility working?

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
