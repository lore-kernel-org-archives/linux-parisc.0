Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP
	id A36C948FA; Sun, 30 Sep 2001 01:01:44 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15nabf-0002Rj-00; Sun, 30 Sep 2001 08:01:43 +0100
Date: Sun, 30 Sep 2001 08:01:43 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@lists.parisc-linux.org
Cc: parisc-linux-cvs@lists.parisc-linux.org
Message-ID: <20010930080143.A9242@parcelfarce.linux.theplanet.co.uk>
References: <200109291642.KAA12575@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200109291642.KAA12575@puffin.external.hp.com>; from tsbogend@puffin.external.hp.com on Sat, Sep 29, 2001 at 10:42:33AM -0600
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux tsbogend
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Sep 29, 2001 at 10:42:33AM -0600, Thomas Bogendoerfer wrote:
> Log message:
> we need to flush pages used inside the kernel and passed to user processes
> otherwise because of the virtual alias we get mixed writebacks.
> FIMXE: flush_data_cache() isn't a very well optimized function for this
> purpose

flush_dcache_page() is perhaps the function you are looking for?  I'm
not sure I understand what the problem is since you didn't post a diff.
I'll investigate more when I get back tomrrow.

-- 
Revolutions do not require corporate support.
