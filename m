Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3C934A19
	for <parisc-linux@lists.parisc-linux.org>; Thu,  1 Mar 2001 02:54:15 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA04355
	for <parisc-linux@puffin.external.hp.com>; Thu, 1 Mar 2001 02:49:23 -0700
Received: from pc117-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.117)
  by mailserv2.iuinc.com with SMTP; 1 Mar 2001 09:54:13 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 1886EB007; Thu,  1 Mar 2001 09:54:35 +0000 (GMT)
Date: Thu, 1 Mar 2001 09:54:35 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Chris Moore <cmoore@cancun.rose.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Another 735 hums to life
Message-ID: <20010301095435.G2686@linuxcare.com>
References: <1010228143459.ZM5008@cancun.rose.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1010228143459.ZM5008@cancun.rose.hp.com>; from cmoore@cancun.rose.hp.com on Wed, Feb 28, 2001 at 02:34:59PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Feb 28, 2001 at 02:34:59PM -0800, Chris Moore wrote:
> After a lot of struggling I finally got my 735/99 up and running.
> After even more struggling I got it to boot standalone off its
> own internal SCSI disk and make it all the way to runlevel 2.
> 
> I am still having a few problems though.  I tried using dpkg
> to install something and the process just seemed to hang.  I
> saw the same thing when trying to compile something - don't
> remember what.

Does tar hang also?  If so it's probably the pthreads problem
that is affecting older machines (my 715/75, for example).  In
theory a new glibc should fix this, but when I tried things seemed
to get even worse - wouldn't even boot any more.  Havn't tried
for a couple of weeks though.

Richard
