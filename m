Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id D715348BD
	for <parisc-linux@parisc-linux.org>;
	Mon, 12 Apr 2004 09:15:51 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3CFFla24031; Mon, 12 Apr 2004 11:15:47 -0400
Subject: Re: [parisc-linux] Re: if something is not done, hppa will not have
	an installer for sarge
From: James Bottomley <James.Bottomley@steeleye.com>
To: Richard Hirst <rhirst@linuxcare.com>
In-Reply-To: <20040412150556.GT20209@linuxcare.com>
References: <20040411165459.GB11699@kitenet.net>
	<20040411171831.GA15032@mcmartin.ca>
	<20040411174629.GA12562@kitenet.net>
	<20040412111257.GS20209@linuxcare.com>
	<1081779569.1804.11.camel@mulgrave>
	<20040412150556.GT20209@linuxcare.com>
Content-Type: text/plain
Date: 12 Apr 2004 10:15:46 -0500
Message-Id: <1081782948.2234.26.camel@mulgrave>
Mime-Version: 1.0
Cc: Kyle McMartin <kyle@mcmartin.ca>, debian-boot@lists.debian.org,
	parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, 2004-04-12 at 10:05, Richard Hirst wrote:
> Unbootable, or unbootable on 64 bit h/w?

It seems to be unbootable entirely, but for 32 bit kernels that's random
(sometimes it will, sometimes it won't).

> > Unfortunately, palo is rather poor about checking this limit when
> > installing the image or modifying the command line...
> 
> and last time I tried building palo on a sid system to investigate
> these hangs on boot, the result didn't work at all :(

I think just reducing the command line would be the best option.  Why's
it so long?

James
