Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA25335
	for <parisc-linux@puffin.external.hp.com>; Thu, 4 Nov 1999 18:11:35 -0700
Received: from relay.core.genedata.com (nila-e0.core.genedata.com [157.161.173.44])
	by mail.core.genedata.com (8.10.0.Beta6/8.10.0.Beta6) with ESMTP id dA51CoH06380
	for <parisc-linux@thepuffingroup.com>; Fri, 5 Nov 1999 02:12:50 +0100
Received: from relay.ch.genedata.com (pinatubo-e0.ch.genedata.com [157.161.173.48])
	by relay.core.genedata.com (8.10.0.Beta6/8.10.0.Beta6) with ESMTP id dA51Cnr20836
	for <parisc-linux@thepuffingroup.com>; Fri, 5 Nov 1999 02:12:49 +0100
Received: from mencheca.ch.genedata.com (root@mencheca.ch.genedata.com [157.161.173.82])
	by relay.ch.genedata.com (8.9.3/8.9.3) with ESMTP id CAA710076
	for <parisc-linux@thepuffingroup.com>; Fri, 5 Nov 1999 02:12:48 +0100 (CET)
Received: by genedata.com
	via sendmail from stdin
	id <m11jXwd-00026uC@mencheca.ch.genedata.com> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Fri, 5 Nov 1999 02:13:35 +0100 (CET)
Date: Fri, 5 Nov 1999 02:13:34 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19991105021334.J25252@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] sash commands
List-ID: <linux-parisc.vger.kernel.org>


I've had a busy evening implementing the hpux syscalls required to make
some of the sash commands work.  The following commands work:

cd
-chgrp
-chmod
-chown
help
-ls
-mkdir
-pwd
-touch
-where

-mount is known to not work.  I need to speak to prumpf about why this is.
-umount probably works, but without -mount, that's hard to test :-)
Ditto -sync.  Maybe some others work.  If there's any sash command you
particularly want to work which doesn't yet, drop me a mail.

many thanks to Grant for all his help this evening.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
