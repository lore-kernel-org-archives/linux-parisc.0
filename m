Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A1AB3482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 12:36:01 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15kV9Y-0004N4-00; Fri, 21 Sep 2001 19:35:56 +0100
Date: Fri, 21 Sep 2001 19:35:56 +0100
From: Matthew Wilcox <willy@debian.org>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] Additional Address cleanup
Message-ID: <20010921193556.A2765@parcelfarce.linux.theplanet.co.uk>
References: <20010921104838.A2049@beavis.ybsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010921104838.A2049@beavis.ybsoft.com>; from rbradetich@uswest.net on Fri, Sep 21, 2001 at 10:48:38AM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Sep 21, 2001 at 10:48:38AM -0600, Ryan Bradetich wrote:
> The simplification I made was to remove the HPA from index
> 0 of the addr[] in the parisc_device.  I feel this is redundant
> since the device already records the HPA with the hpa field.
> By not including the HPA, it also saves a kmalloc on every
> parisc device to store the HPA, and an additional kfree/kmalloc
> when the device actually has additional addresses to store.

I haven't had time to review the patch, but I think it's an excellent
idea to remove the duplicate hpa and addr[0] entries.  I was thinking
about doing it myself, but hadn't got round to checking it could be done.

I was also thinking about removing the `hpa' entry completely and using
struct resource to track the area claimed by the device.  I think we
want to do this in any case for the card-mode dino support.  This is a
later step, I think, so don't let this consideration slow you down.

-- 
Revolutions do not require corporate support.
