Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7279E482A
	for <parisc-linux@parisc-linux.org>; Fri, 25 May 2001 18:08:14 -0600 (MDT)
To: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 25 May 2001 18:10:59 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010526001059.283B437C8F@carmen.fc.hp.com>
Subject: [parisc-linux] List of packages for hppa ISO release
List-ID: <linux-parisc.vger.kernel.org>

Hi binary-hppa hackers,

I have generated a list of packages that we intend to put in the ISO release 
at the end of this month. The list represents a first pass at what pb, willy, 
and I think should be installed on a parisc linux server box. We have excluded 
packages from non-US for the same reasons that Debian does. The way this list 
was generated was by installing the packages and then running a "dpkg 
--get-selections". If you like you can make your system identical to this list 
by feeding the list to "dpkg --set-selections". The list is available at,

http://puffin.external.hp.com/~taggart/selections.20010525

There are still a few missing dependencies but those should be taken care of 
in the next few days. If you have additions/deletions to the list please send 
them to me.

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
