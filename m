Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA23939
	for <parisc-linux@puffin.external.hp.com>; Tue, 31 Oct 2000 16:12:54 -0700
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel1.hp.com (Postfix) with ESMTP id DDAC11256
	for <parisc-linux@thepuffingroup.com>; Tue, 31 Oct 2000 18:14:33 -0500 (EST)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id 8F44638554
	for <parisc-linux@thepuffingroup.com>; Tue, 31 Oct 2000 16:16:09 -0700 (MST)
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 31 Oct 2000 16:16:09 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001031231609.8F44638554@carmen.fc.hp.com>
Subject: [parisc-linux] New cross-compiler
List-ID: <linux-parisc.vger.kernel.org>

I have placed a new i386-linux -> hppa32/64-linux cross compiler (with 32bit 
glibc) in,

ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-20001031.tar.gz

It includes Alan Modra's recent fix for the 64 bit compiler,

http://puffin.external.hp.com/mailing-lists/parisc-linux-cvs/2000/10-Oct/0233.h
tml

-- 
Matt Taggart
taggart@fc.hp.com
