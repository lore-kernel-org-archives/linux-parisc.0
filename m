Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 12418482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 23 May 2001 10:36:42 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 152bO0-0000em-00; Wed, 23 May 2001 17:21:24 +0100
Date: Wed, 23 May 2001 17:21:24 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: rbrad@beavis.ybsoft.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel panic
Message-ID: <20010523172124.W23718@parcelfarce.linux.theplanet.co.uk>
References: <200105230853.CAA07709@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200105230853.CAA07709@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Wed, May 23, 2001 at 02:53:15AM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, May 23, 2001 at 02:53:15AM -0600, John Marvin wrote:
> I can't remember if your original problem crashed the system or just
> caused data corruption. If the machine stays up, a debugging workaround
> might be to store data in an internal array instead of using printk.
> You could then dump this array after the problem occured. One possible
> hack to dump the array would be to add code to dump it via the proc fs
> code that already exists in the ccio_dma code.

or just use printk(KERN_DEBUG "foo"); since this won't output to console.

-- 
Revolutions do not require corporate support.
