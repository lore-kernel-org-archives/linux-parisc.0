Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 95F3A482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Jun 2001 19:27:24 -0600 (MDT)
To: Al Budriunas <budriuna@cacr.caltech.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Error creating PALO 
In-Reply-To: Your message of "Thu, 21 Jun 2001 17:16:52 PDT."
             <Pine.SOL.4.10.10106211709290.8214-100000@lugh.cacr.caltech.edu>
References: <Pine.SOL.4.10.10106211709290.8214-100000@lugh.cacr.caltech.edu> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 21 Jun 2001 19:30:11 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010622013011.999F037D2C@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Al Budriunas writes...

> Matt,
> 
> The cfdisk utility didn't have a F0 fstype available.

You can change the partition type to f0 but it's not in the list of partition 
types.  I have submitted a wishlist bug against the Debian util-linux package 
with a patch to add it to the list. You can track it's status at,

http://www.debian.org/Bugs/

and searching "By package:" for util-linux (it hasn't shown up yet so I don't 
know the bug number yet).  The Debian maintainer will forward it to the 
upstream maintainer and with any luck it will get added to a future release.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
