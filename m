Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xo.hp.is (xo.hp.is [194.105.242.199])
	by dsl2.external.hp.com (Postfix) with ESMTP id 64D54482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Nov 2001 10:26:06 -0700 (MST)
Received: (from ra@localhost)
	by xo.hp.is (8.11.6/RA-8.11.6) id fAMHQ5r11921
	for parisc-linux@lists.parisc-linux.org; Thu, 22 Nov 2001 17:26:05 GMT
Date: Thu, 22 Nov 2001 17:26:05 +0000
From: Richard Allen <ra@hp.is>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011122172605.C11638@hp.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] CFLAGS on parisc linux
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Are there any optimal CFLAGS this group recomends when compiling
binaries for PA-Risc linux that are supposed to work in most places ?

I've seen -mpa-risc-1-0 used a bit, but is that wise ? 1.1 must be
better ?    Or is it best to not use any extra cflags what so ever ?

-- 
Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
               --  Solaris 7 Certified Systems and Network Administrator.
Bell Labs Unix --  Reach out and grep someone.
Those who do not understand Unix are condemned to reinvent it, poorly.
