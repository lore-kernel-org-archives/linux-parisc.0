Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta03-svc.ntlworld.com (mta03-svc.ntlworld.com [62.253.162.43])
	by dsl2.external.hp.com (Postfix) with ESMTP id A77F0482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 14 Apr 2001 08:00:54 -0600 (MDT)
From: "Jeff Arthur" <jeffa@mustain.demon.co.uk>
To: jeffa@owlpoo.org, Richard Hirst <rhirst@linuxcare.com>
Date: Sat, 14 Apr 2001 14:59:50 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Subject: Re: [parisc-linux] 9000/730 booting but SCSI Problems (mke2fs)
Reply-To: jeffa@owlpoo.org
Cc: parisc-linux@lists.parisc-linux.org, apul@israeli.demon.co.uk
In-reply-to: <20010410093901.J6992@linuxcare.com>
References: <20010409225507.RNIM272.mta05-svc.ntlworld.com@mustain.demon.co.uk>; from jeffa@mustain.demon.co.uk on Mon, Apr 09, 2001 at 11:54:02PM +0100
Message-Id: <20010414140053.CSRU283.mta03-svc.ntlworld.com@mustain.demon.co.uk>
List-ID: <linux-parisc.vger.kernel.org>

Thanks Richard, the commnad line change you described seems 
to have worked a treat.

My problem has now moved on, have got all things up and running 
of the hard disk now, but a few key exes are hanging, rpc.lockd, 
nscd, tar etc.

The ones in the init i have got around by removing the entries from 
rcx.d etc, but not being able to use tar is a pain.
