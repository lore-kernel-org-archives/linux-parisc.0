Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 154E54829
	for <parisc-linux@parisc-linux.org>; Tue,  8 Apr 2003 09:06:26 -0600 (MDT)
Date: Tue, 8 Apr 2003 08:03:32 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20030408150332.GE12993@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] dump driver patches on ftp.parisc-linux.org
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

With Bruno's permission I've placed his dump driver and crashtools stuff
on ftp://ftp.parisc-linux.org/patches/

The files are:
2679a448460c9be8260cc937ddd52ccc  crashtools.tar.gz
044c09a53f3b6113621d539bc297ea9f  dump_modules-2.4.20-pa32.patch.gz

Bruno gives the following warning:
"But I think that a warning must be printed, because it use low level
function for writing on disk, it is better to use free disk. I've tested
it, but it is still possible to still have bugs. I've take care to ensure
that I'm not writing anywhere, but it is still not doing any test
to know if it is a swap partition or a file system. In case of misconfiguration
it is still possible to override a file system."

ymmv :)
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
