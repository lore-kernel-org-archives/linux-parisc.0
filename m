Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA02738
	for <parisc-linux@puffin.external.hp.com>; Fri, 29 Dec 2000 18:09:06 -0700
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel1.hp.com (Postfix) with ESMTP id 42BB452E
	for <parisc-linux@thepuffingroup.com>; Fri, 29 Dec 2000 20:12:19 -0500 (EST)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id 2046E37C97
	for <parisc-linux@thepuffingroup.com>; Fri, 29 Dec 2000 18:14:14 -0700 (MST)
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 29 Dec 2000 18:14:14 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001230011414.2046E37C97@carmen.fc.hp.com>
Subject: [parisc-linux] Lots of warnings in the compiler build logs
List-ID: <linux-parisc.vger.kernel.org>

There are quite a few warnings in the compiler build logs. I thought I would 
post the logs in case someone wanted to work on cleanup. The build log for the 
cross-compiler is,

ftp://puffin.external.hp.com/pub/parisc/debug/xc-20001222.log [5.1MB]

and the log for the cross-compile of a native toolchain is,
 
ftp://puffin.external.hp.com/pub/parisc/debug/nc-20001222.log [4.8MB]

There are currently 452 warning lines in the xc log(builds binutils and gcc 
twice) and 269 warning lines in the nc log.

-- 
Matt Taggart
taggart@fc.hp.com
