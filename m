Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id 23DF74843
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Sep 2001 07:03:41 -0600 (MDT)
Date: Wed, 12 Sep 2001 07:03:37 -0600
To: Randall Craig <randall@tdl.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ccio-dma error
Message-ID: <20010912070337.A21888@beavis.ybsoft.com>
References: <20010910012502.A30056@tdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010910012502.A30056@tdl.com>
From: rbradetich@uswest.net (Ryan Bradetich)
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Sep 10, 2001 at 01:25:02AM -0700, Randall Craig wrote:
> My computer frequently crashes with the error message:
> 
>  Kernel panic: ccio-dma.c: ccio_alloc_range() I/O MMU is out of mapping resource

This error occurs when the ccio driver can not find adequate space in the resource
map to complete the dma mapping.  Since you are seeing it frequently, try changing
the following line in arch/parisc/kernel/ccio-dma.c to see if that helps:

From:
	static unsigned long ccio_mem_ratio = 32;
To:
	static unsigned long ccio_mem_ratio = 4;

You can also look at the the 2 /proc file entries to get an idea what is going
on: 

	/proc/bus/runway/ccio
	/proc/bus/runway/ccio-bitmap

The /proc/bus/runway/ccio should give you general information about the hardware
and driver.  The /proc/bus/runway/ccio-bitmap should give you an idea of how dense
the resource bitmap is.

Hopefully this will help you out.

- Ryan


> 
> This is with kernel pa17.
> 
> 
> This occurs during medium to heavy io. 
> 
> 
> 
> This has also caused my /var/lib/dbkg directory to be missing.
> 
> How can I rebuild it?
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 

-- 
