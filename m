Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust171.bre.cable.ntl.com [213.105.88.171])
	by dsl2.external.hp.com (Postfix) with ESMTP id ACF9D482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 23 May 2001 02:00:53 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 1BF50B008; Wed, 23 May 2001 08:58:33 +0100 (BST)
Date: Wed, 23 May 2001 08:58:33 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Tom Hansen <tomh@execpc.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems booting .61 ISO on 715/75
Message-ID: <20010523085833.O8736@linuxcare.com>
References: <5.1.0.14.0.20010520213045.029610c0@mail.execpc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5.1.0.14.0.20010520213045.029610c0@mail.execpc.com>; from tomh@execpc.com on Sun, May 20, 2001 at 09:35:01PM -0500
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  I don't think 715/old (which includes 715/75) have STI graphics,
so I wouldn't expect that to work.  In any case, my 715/75 hangs
later during install (serial console).  I think that is due to problems
with glibc (misaligned locks), which should be fixed in glibc 2.2.3
some time soon.

Richard

On Sun, May 20, 2001 at 09:35:01PM -0500, Tom Hansen wrote:
> 
> I have just downloaded the 0.61 ISO:
> 
>     palinux-0.6-32STI.iso.gz
> 
> from the HP site, burned a CD, and booted from the CD on my 715/75 Apollo, 
> 160MB, Toshiba 5701 CD-ROM. I'm using the built-in console, I don't have a 
> serial console.
> 
> After what appears to be a successful start to the boot sequence (it 
> identifies devices OK, etc.) it gets as far as the line:
> 
>     Console: colour dummy device 80x25
> 
> After this line is displayed, the CD is accessed for about 2 or 3 more 
> seconds, after which everything stops.
> 
> Any ideas?
> 
> 
> --
> Tom Hansen
> tomh@execpc.com
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
