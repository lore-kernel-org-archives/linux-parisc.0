Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailhost.cacr.caltech.edu (mailhost.cacr.caltech.edu [131.215.145.180])
	by dsl2.external.hp.com (Postfix) with ESMTP id 418F3482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 27 Jun 2001 09:33:01 -0600 (MDT)
Date: Wed, 27 Jun 2001 08:29:23 -0700 (PDT)
From: Al Budriunas <budriuna@cacr.caltech.edu>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Error creating PALO 
In-Reply-To: <20010622225725.5096B37D2C@carmen.fc.hp.com>
Message-ID: <Pine.SOL.4.10.10106270820490.1484-100000@lugh.cacr.caltech.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 22 Jun 2001, Matt Taggart wrote:

> Al Budriunas writes...
> 
> > Would you please share (or point me to) the procedure to change PALO
> > parititon into f0 type?
> 
> 1.) Run cfdisk
> 2.) Select the partition you want to change using the up/down arrows.
> 3.) Select "Type"(it may prompt you to hit space when listing the types)
> 4.) Enter "f0"
> 5.) Select "Write" to write the partition table to the disk
> 6.) Select "Quit" to exit cfdisk.
> 
> If you're still having problems then we may have a bug.
> 

Matt,

I didn't realize that an unlisted type could be entered in cfdisk, but it
worked! It was listed as "unkown (f0)" in the parition information. The
PALO installation phase completed this time, and the system booted from
the hard drive for the first time.

Thanks for the quick replies.

Regards,

Al

------------------------------------------------------------------
Al Budriunas                            email: budriuna@rsn.hp.com  
Hewlett Packard Co.                     voice: 310-535-2884
Los Angeles, Ca.                        
------------------------------------------------------------------
