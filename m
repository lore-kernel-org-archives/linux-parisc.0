Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3654482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Sep 2001 13:05:33 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15dcYm-0007bg-00; Sun, 02 Sep 2001 20:05:32 +0100
Date: Sun, 2 Sep 2001 20:05:32 +0100
From: Matthew Wilcox <willy@debian.org>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Delaying the device inventory detection time
Message-ID: <20010902200532.W5126@parcelfarce.linux.theplanet.co.uk>
References: <200109020616.AAA07559@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200109020616.AAA07559@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Sun, Sep 02, 2001 at 12:16:39AM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Sep 02, 2001 at 12:16:39AM -0600, John Marvin wrote:
> Why isn't alloc_bootmem or alloc_bootmem_pages good enough? I already
> restructured the boot sequence a while back to allow for that.

I don't see the need to use bootmem for this.  We can manage just fine
without the devices until after kmalloc starts up.

-- 
Revolutions do not require corporate support.
