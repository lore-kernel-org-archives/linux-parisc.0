Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id CD5FF482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Jul 2001 13:13:52 -0600 (MDT)
To: Al Budriunas <budriuna@cacr.caltech.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] telnetd binary 
In-Reply-To: Message from Al Budriunas <budriuna@cacr.caltech.edu>
   of "Mon, 02 Jul 2001 11:38:39 PDT." <Pine.SOL.4.10.10107021131370.13925-100000@lugh.cacr.caltech.edu>
References: <Pine.SOL.4.10.10107021131370.13925-100000@lugh.cacr.caltech.edu> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 02 Jul 2001 13:13:51 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010702191351.0FF0937F86@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Al Budriunas writes...

> telnetd and ftpd were not included with the June 1 ISO image. The only
> telnetd and ftpd I did find on the Debian site is for i386.  

apt-get update
apt-get install telnetd
apt-get install ftpd

Alternatively you can grab them from any debian mirror by hand and install 
them. These should go in the next iso as we get a lot of requests for them.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
