Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6AA9C482D
	for <parisc-linux@parisc-linux.org>; Mon, 18 Jun 2001 12:50:31 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15C46S-0007FH-00; Mon, 18 Jun 2001 19:50:24 +0100
Date: Mon, 18 Jun 2001 19:50:24 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Message-ID: <20010618195024.O10186@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] WARNING: installing glibc-2.2.3-6 breaks ssh
List-ID: <linux-parisc.vger.kernel.org>

Ifyou install glibc-2.2.3-6, sshd will break.  Here's why:

168   setrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM_INFINITY}) = 0 

glibc-2.2.3-2.0.0.2 had a bug in that it'd set the max limit to INF/2
and everything would work fine.  This needs to be fixed in the kernel
and hopefully I'll get that done by the end of today.

-- 
Revolutions do not require corporate support.
