Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0CFFC482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 13:19:26 -0600 (MDT)
Date: Mon, 3 Sep 2001 13:19:23 -0600
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Delaying the device inventory detection time
Message-ID: <20010903131923.A11381@beavis.ybsoft.com>
References: <200109020616.AAA07559@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200109020616.AAA07559@udlkern.fc.hp.com>
From: rbradetich@uswest.net (Ryan Bradetich)
List-ID: <linux-parisc.vger.kernel.org>

John,

Willy and I have been looking over the current boot sequence and did not
see any reason why the device detection could not be delayed until main
memory had been setup.  The only special case looked like the cpu driver,
and upon further investigation, all the cpu related information was
gathered via pdc calls.  I remember our converstation about using bootmem
and regulard kmalloc'd memory with a flag to detect which type of memory
was used, but delaying the device detection until memory was initialized
seems like a cleaner solution.   Are there cases where this scheme will
not work?  Like with SMP kernels?  Newer hardware (like superdome), etc?

Thanks for your feedback John, if this patch is not going to work, then
we need to restructure the design of the iotree to not depend upon this
patch!

- Ryan

On Sun, Sep 02, 2001 at 12:16:39AM -0600, John Marvin wrote:
> 
> Ryan,
> 
> Why isn't alloc_bootmem or alloc_bootmem_pages good enough? I already
> restructured the boot sequence a while back to allow for that.
> 
> The only problem I see with using those routines is that it is a little
> harder to free up memory allocated with those routines once the
> memory subsystem is fully initialized, but if you are only dynamically
> allocating, without a need to free the memory you should be able to
> use those routines without having to do any restructuring.
> 
> John
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 

-- 
