Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 71CF24840
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  4 May 2004 13:41:32 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 4 May 2004 21:41:29 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Message-Id: <200405042141.29921.deller@gmx.de>
Subject: [parisc-linux] source tarballs give "bzip2 (stdin) trailing garbage
	after EOF ignored"
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

today I found the following small glitch with the linux kernel source tarballs available from 
http://cvs.parisc-linux.org/download/linux-2.6
(e.g. http://cvs.parisc-linux.org/download/linux-2.6/linux-2.6.6-rc3-pa7.tar.bz2)

Extracting with "tar xvfj <filename>"  gives:
....
linux-2.6.6-rc3-pa7/.versions
bzip2: (stdin): trailing garbage after EOF ignored

Helge
