Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 94698482A
	for <parisc-linux@parisc-linux.org>; Mon, 23 Apr 2001 12:52:45 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14rlRv-0008N0-00
	for parisc-linux@parisc-linux.org; Mon, 23 Apr 2001 19:52:39 +0100
Date: Mon, 23 Apr 2001 19:52:39 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010423195239.D18464@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] gcc -print-file-name=cpp
List-ID: <linux-parisc.vger.kernel.org>

Our gcc prints `cpp' when invoked as gcc -print-file-name=cpp.  Every
other gcc in the world seems to output something along the lines of
/usr/lib/gcc-lib/i386-linux/2.95.2/cpp.  This includes other gcc 3.0
and 3.1 versions.  Would someone care to track this down?  This bug
currently requires a patch to glibc in order to get glibc to build,
and Ulrich rightly refuses to apply this patch to glibc CVS.

-- 
Revolutions do not require corporate support.
