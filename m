Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp5ve.mailsrvcs.net (smtp5vepub.gte.net [206.46.170.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id F4212482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Jul 2001 10:28:46 -0600 (MDT)
Received: from neuronet.pitt.edu (client-151-201-23-51.pittpa.adsl.bellatlantic.net [151.201.23.51])
	by smtp5ve.mailsrvcs.net (8.9.1/8.9.1) with ESMTP id QAA24343456
	for <parisc-linux@lists.parisc-linux.org>; Thu, 5 Jul 2001 16:28:45 GMT
Sender: raffo@bellatlantic.net
Message-ID: <3B4495BC.C3E7A04D@neuronet.pitt.edu>
Date: Thu, 05 Jul 2001 12:28:44 -0400
From: Rafael Herrera <raffo@neuronet.pitt.edu>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 0.9.1 installation failed with and ext2-fs error
List-ID: <linux-parisc.vger.kernel.org>

While installing the latest 0.9.1 on a 715/75 machine over a serial
line, the installation halted with this error message:

 Extracting
 /var/cache/apt/archives/tar_1.13.19-1_hppa.deb...          EXT2-fs
error (device sd(8,3)): ext2_write_inode: unable t9

it looks truncated. I can't provide more error messages. Are there other
virtual consoles under the installed? if so, how do you switch to them?
I'm using minicom on an X terminal.

-- 
     Rafael
