Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9E90E482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Jun 2001 16:54:37 -0600 (MDT)
To: Al Budriunas <budriuna@cacr.caltech.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Error creating PALO 
In-Reply-To: Message from Al Budriunas <budriuna@cacr.caltech.edu>
   of "Fri, 22 Jun 2001 13:20:42 PDT." <Pine.SOL.4.10.10106221317550.16626-100000@lugh.cacr.caltech.edu>
References: <Pine.SOL.4.10.10106221317550.16626-100000@lugh.cacr.caltech.edu> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 22 Jun 2001 16:57:25 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010622225725.5096B37D2C@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Al Budriunas writes...

> Would you please share (or point me to) the procedure to change PALO
> parititon into f0 type?

1.) Run cfdisk
2.) Select the partition you want to change using the up/down arrows.
3.) Select "Type"(it may prompt you to hit space when listing the types)
4.) Enter "f0"
5.) Select "Write" to write the partition table to the disk
6.) Select "Quit" to exit cfdisk.

If you're still having problems then we may have a bug.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
