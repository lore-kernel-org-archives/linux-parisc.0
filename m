Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id AAE7D482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Apr 2001 03:49:07 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id A3FB0B007; Tue, 17 Apr 2001 10:49:20 +0100 (BST)
Date: Tue, 17 Apr 2001 10:49:20 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: jeffa@owlpoo.org
Cc: parisc-linux@lists.parisc-linux.org, apul@israeli.demon.co.uk
Subject: Re: [parisc-linux] 9000/730 booting but SCSI Problems (mke2fs)
Message-ID: <20010417104920.J11226@linuxcare.com>
References: <20010409225507.RNIM272.mta05-svc.ntlworld.com@mustain.demon.co.uk>; <20010410093901.J6992@linuxcare.com> <20010414140053.CSRU283.mta03-svc.ntlworld.com@mustain.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010414140053.CSRU283.mta03-svc.ntlworld.com@mustain.demon.co.uk>; from jeffa@mustain.demon.co.uk on Sat, Apr 14, 2001 at 02:59:50PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Apr 14, 2001 at 02:59:50PM +0100, Jeff Arthur wrote:
> Thanks Richard, the commnad line change you described seems 
> to have worked a treat.

Hmm, so it seems the sim700 driver has problems with disconnect/reselect
enabled, on your system at least.  I'll do some testing here.

> My problem has now moved on, have got all things up and running 
> of the hard disk now, but a few key exes are hanging, rpc.lockd, 
> nscd, tar etc.
> 
> The ones in the init i have got around by removing the entries from 
> rcx.d etc, but not being able to use tar is a pain.
> 
> >From posts around feb it looked like there was a known problem 
> with spinlock.  Has any progress been made in that area?

As Matthew said, that is fixed.  You might try a new base tarball from
<ftp://puffin.external.hp.com/pub/parisc/binaries/debian/basetars/>.

Richard
