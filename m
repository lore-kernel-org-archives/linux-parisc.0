Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA27875
	for <parisc-linux@puffin.external.hp.com>; Sun, 20 Jun 1999 11:40:28 -0600
Received: from relay.ch.genedata.com (pinatubo-e0.ch.genedata.com [157.161.173.48])
	by mail.core.genedata.com (8.9.3/8.9.3) with ESMTP id TAA01590
	for <parisc-linux@thepuffingroup.com>; Sun, 20 Jun 1999 19:40:16 +0200
Received: from mencheca.ch.genedata.com (root@mencheca.ch.genedata.com [157.161.173.82])
	by relay.ch.genedata.com (8.9.3/8.9.3) with ESMTP id TAA2197419
	for <parisc-linux@thepuffingroup.com>; Sun, 20 Jun 1999 19:40:15 +0200 (CEST)
Received: by genedata.com
	via sendmail from stdin
	id <m10vlZn-00029qC@mencheca.ch.genedata.com> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Sun, 20 Jun 1999 19:40:15 +0200 (CEST)
Date: Sun, 20 Jun 1999 19:40:15 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19990620194015.J30362@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] HPUX binary compatibility
List-ID: <linux-parisc.vger.kernel.org>


How far do we want to or are we able to go with making constants identical
between HPUX and Linux?

Some syscalls are going to have to be different between the two OSes --
ioctl is the obvious example -- but it would be nice to have to do as
little work as possible.

I've just been through errno.h making the Linux error numbers the same as
the HPUX ones.  This seems pretty sane; I can't imagine that it will have
any negative effect on anything.  Where it gets a little more thorny is
in signal.h -- HPUX uses more than 32 signals.  Is it going to negatively
impact Linux at all to use more than 32?  I see there is space reserved
for them, but I'd like someone to reassure me.

The real thing which bothers me about this is that doing this means that
HPUX and Linux are then allocating from the same numberspace, so where
Linux has things which HPUX doesn't, HPUX might later allocate the same
number for a different extension.

(Of course, if HP want to add Linux binary compatibility to HPUX, now
would be a great time to mention it :-)

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
