Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA31294
	for <parisc-linux@puffin.external.hp.com>; Sun, 1 Aug 1999 13:49:09 -0600
Received: from relay.ch.genedata.com (pinatubo-e0.ch.genedata.com [157.161.173.48])
	by mail.core.genedata.com (8.9.3/8.9.3) with ESMTP id VAA00110
	for <parisc-linux@thepuffingroup.com>; Sun, 1 Aug 1999 21:50:03 +0200
Received: from mencheca.ch.genedata.com (root@mencheca.ch.genedata.com [157.161.173.82])
	by relay.ch.genedata.com (8.9.3/8.9.3) with ESMTP id VAA601370
	for <parisc-linux@thepuffingroup.com>; Sun, 1 Aug 1999 21:50:02 +0200 (CEST)
Received: by genedata.com
	via sendmail from stdin
	id <m11B1cP-0002JoC@mencheca.ch.genedata.com> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Sun, 1 Aug 1999 21:50:01 +0200 (CEST)
Date: Sun, 1 Aug 1999 21:50:01 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19990801215001.W25925@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] HPUX syscall ABI?
List-ID: <linux-parisc.vger.kernel.org>


I've just redefined the Linux syscall ABI again so we can
handle sys_mmap (which takes 6 arguments) cleanly.  I'm now
wondering what the HPUX syscall standard is.  I've searched
http://docs.hp.com:80/dynaweb/hpux11/dtdcen1a/b821/@Generic__BookView
(as mentioned earlier on this mailing list) without success.

For those interested; Linux syscalls now take the syscall number in r20,
take arguments in r26-r21, zero r1, r19-r26, r29 and r31 on exit, preserve
r3-r18, r27(dp) and r30(sp), clobber r2 and return the result in r28.
If it's in the range [-1024,0) then that's an error code, otherwise it's
the result.

ObRant: Why on earth define a register to be caller-saves but not allow it
to contain an argument?  Why force it onto the stack?

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
