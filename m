Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA07875
	for <parisc-linux@puffin.external.hp.com>; Sat, 12 Jun 1999 19:53:02 -0600
Received: from relay.ch.genedata.com (pinatubo-e0.ch.genedata.com [157.161.173.48])
	by mail.core.genedata.com (8.9.3/8.9.3) with ESMTP id DAA06395
	for <parisc-linux@thepuffingroup.com>; Sun, 13 Jun 1999 03:52:56 +0200
Received: from mencheca.ch.genedata.com (root@mencheca.ch.genedata.com [157.161.173.82])
	by relay.ch.genedata.com (8.9.3/8.9.3) with ESMTP id DAA1407882
	for <parisc-linux@thepuffingroup.com>; Sun, 13 Jun 1999 03:52:55 +0200 (CEST)
Received: by genedata.com
	via sendmail from stdin
	id <m10szSA-0002JoC@mencheca.ch.genedata.com> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Sun, 13 Jun 1999 03:52:54 +0200 (CEST)
Date: Sun, 13 Jun 1999 03:52:54 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19990613035254.D31472@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] binfmt_som
List-ID: <linux-parisc.vger.kernel.org>


I plunged further into the binfmt_* files today and have a fair idea what needs to be done next.  One passage is slightly troubling me (page 6-126 of the
runtime arch document),

``exec_dsize
This field specifies the size in bytes of the initialised data (does
not have to be a multiple of 4k).  The actual size of the data section
in the file must be a multiple of 4k and can be padded with zeroes to
make it a multiple of 4k.''

Does this mean in the case where exec_dsize is not a multiple of 4k, it
MUST be padded with zeroes, or merely might be padded with zeroes?  If the
former, I don't need to zero them myself in the loader which would be nice.

Also, where does the bss section start?  Is it immediately after the
initialised data or at the next page boundary after it?

binfmt_som is going to be the cleanest binfmt in the kernel when I'm
finished with it :-)  [and then I'm going to clean up the others.]

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
