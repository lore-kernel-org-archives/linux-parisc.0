Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C0C81482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Apr 2001 11:31:32 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14pCqW-0006PE-00; Mon, 16 Apr 2001 18:31:28 +0100
Date: Mon, 16 Apr 2001 18:31:28 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: jeffa@owlpoo.org
Cc: Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@lists.parisc-linux.org, apul@israeli.demon.co.uk
Subject: Re: [parisc-linux] 9000/730 booting but SCSI Problems (mke2fs)
Message-ID: <20010416183128.A18045@parcelfarce.linux.theplanet.co.uk>
References: <20010409225507.RNIM272.mta05-svc.ntlworld.com@mustain.demon.co.uk>; <20010410093901.J6992@linuxcare.com> <20010414140053.CSRU283.mta03-svc.ntlworld.com@mustain.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010414140053.CSRU283.mta03-svc.ntlworld.com@mustain.demon.co.uk>; from jeffa@mustain.demon.co.uk on Sat, Apr 14, 2001 at 02:59:50PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Apr 14, 2001 at 02:59:50PM +0100, Jeff Arthur wrote:
> My problem has now moved on, have got all things up and running 
> of the hard disk now, but a few key exes are hanging, rpc.lockd, 
> nscd, tar etc.
> 
> The ones in the init i have got around by removing the entries from 
> rcx.d etc, but not being able to use tar is a pain.
> 
> >From posts around feb it looked like there was a known problem 
> with spinlock.  Has any progress been made in that area?

Yes, this problem is now fixed.  http://bugs.parisc-linux.org/db/76/76.html

-- 
Revolutions do not require corporate support.
