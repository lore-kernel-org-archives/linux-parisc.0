Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA16173
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Nov 1999 19:10:10 -0700
Received: from relay.ch.genedata.com (pinatubo-e0.ch.genedata.com [157.161.173.48])
	by mail.core.genedata.com (8.9.3/8.9.3) with ESMTP id DAA16038
	for <parisc-linux@thepuffingroup.com>; Wed, 3 Nov 1999 03:11:22 +0100
Received: from mencheca.ch.genedata.com (root@mencheca.ch.genedata.com [157.161.173.82])
	by relay.ch.genedata.com (8.9.3/8.9.3) with ESMTP id DAA524020
	for <parisc-linux@thepuffingroup.com>; Wed, 3 Nov 1999 03:11:19 +0100 (CET)
Received: by genedata.com
	via sendmail from stdin
	id <m11iptw-000262C@mencheca.ch.genedata.com> (Debian Smail3.2.0.102)
	for parisc-linux@thepuffingroup.com; Wed, 3 Nov 1999 03:11:52 +0100 (CET)
Date: Wed, 3 Nov 1999 03:11:52 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <19991103031152.F25252@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] getdents
List-ID: <linux-parisc.vger.kernel.org>


I'm trying to implement the HPUX getdents syscall so that we can `-ls'
in sash.  Unfortunately, there appears to be no manual page on this.
Could someone let me know exactly what libc is expecting getdents
to return?  So far I have deduced the following:

It takes three parameters; a file descriptor, an address and a length
in bytes.  On return, that block of memory is filled with as many of
the following struct as will fit:

struct hpux_dirent {
	ino_t	d_ino;
	short	d_reclen;
	short	d_namlen;
	char	d_name[1];
};

But checking through the other compatibility implementations of getdents;
there is so much variation about what else might be returned in that
block that I would prefer to not speculate further unless I have to.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
