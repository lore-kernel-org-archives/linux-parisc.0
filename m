Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA20057
	for <parisc-linux@puffin.external.hp.com>; Sat, 7 Aug 1999 07:30:48 -0600
Received: from relay.ch.genedata.com (pinatubo-e0.ch.genedata.com [157.161.173.48])
	by mail.core.genedata.com (8.9.3/8.9.3) with ESMTP id PAA21573
	for <parisc-linux@thepuffingroup.com>; Sat, 7 Aug 1999 15:31:55 +0200
Received: from mencheca.ch.genedata.com (root@mencheca.ch.genedata.com [157.161.173.82])
	by relay.ch.genedata.com (8.9.3/8.9.3) with ESMTP id PAA792558
	for <parisc-linux@thepuffingroup.com>; Sat, 7 Aug 1999 15:31:54 +0200 (CEST)
Received: by genedata.com
	via sendmail from stdin
	id <m11D6Zm-0002M2C@mencheca.ch.genedata.com> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Sat, 7 Aug 1999 15:31:54 +0200 (CEST)
Date: Sat, 7 Aug 1999 15:31:54 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19990807153154.C11586@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] utssys?
List-ID: <linux-parisc.vger.kernel.org>


Can anyone tell me what the utssys() system call does?  There's no manual
page for it.  From tusc, I can see:

utssys("HP-UX", 0, 0) ............................................ = 0

so all I need do to get it to work on Linux is return 0, but I'd like
to understand a little more.

I also can't find a manual page for sigsetreturn() which I probably need
to understand more deeply than utssys :-)

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
