Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1C028482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Jul 2001 01:31:11 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 00683B00C; Thu,  5 Jul 2001 08:30:32 +0100 (BST)
Date: Thu, 5 Jul 2001 08:30:32 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Christoph Plattner <christoph.plattner@alcatel.at>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problem in palinux-0.9.1 image with directory "debian" !!
Message-ID: <20010705083032.J23509@linuxcare.com>
References: <3B441232.44A2B63B@alcatel.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B441232.44A2B63B@alcatel.at>; from christoph.plattner@alcatel.at on Thu, Jul 05, 2001 at 09:07:30AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jul 05, 2001 at 09:07:30AM +0200, Christoph Plattner wrote:
> I have a problem with the iso image. I have loop back mounted
> it on my linux box, and I wanted to tar (copy) it to a location
> (NFSROOT) to try a media less installation via rboot/bootp.
> 
> But the copy was not possible, as the directory debian
> contains recursively the contents of the whole CD !!
> 
> Is this correct !

No, it isn't correct.  debian should be a symbolic link to '.'.
I guess at some problem with the mkisofs options.  I've notified
the guys that made it, and hopefully they will remaster without
that problem soon.  I also had problems trying a CD based install
for the same reason.  In your case, try just taring up the dist
directory, or telling tar to ignore debian.

There may be workarounds for CD based installs, but I havn't
fully investigated yet.

Richard
