Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailin9.bigpond.com (juicer34.bigpond.com [139.134.6.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0D66C482A
	for <parisc-linux@parisc-linux.org>; Sun,  2 Sep 2001 19:29:59 -0600 (MDT)
Received: from bubble.local ([144.135.24.81]) by
          mailin9.bigpond.com (Netscape Messaging Server 4.15) with SMTP
          id GJ2CG400.3X5 for <parisc-linux@parisc-linux.org>; Mon, 3 Sep
          2001 11:36:04 +1000
Date: Mon, 3 Sep 2001 10:59:49 +0930
From: Alan Modra <amodra@bigpond.net.au>
To: Linux/HPPA List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Which CVS modules are still alive?
Message-ID: <20010903105949.L29754@bubble.sa.bigpond.net.au>
References: <20010902165337.F16220@neep.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010902165337.F16220@neep.com.au>; from andrew@neep.com.au on Sun, Sep 02, 2001 at 04:53:39PM +0800
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Sep 02, 2001 at 04:53:39PM +0800, Andrew Shugg wrote:
> I was just wondering which of the following CVS modules (that I have
> checked out) are still considered active.
> 
>   binutils  gcc  glibc  linux  palo
> 
> Obviously 'linux' will be active as long as hppa-linux kernel
> development continues outside of the main kernel tree.  I believe glibc
> has been mentioned before as being stale?  How about the others?

binutils is long dead.  Use sources.redhat.com CVS, trunk or 2.11 branch,
or one of H.J.'s releases after 2.11.90.0.19.  Don't use any of the 2.11.x
releases, unless you like debugging binutils problems;  They are all
missing some hppa fixes that I found just after each release.  :-(

gcc is a wee bit stale, but should be updated soon.

Alan
