Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF3A7482A
	for <parisc-linux@parisc-linux.org>; Sat, 14 Jul 2001 14:53:29 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15LWPn-00018S-00; Sat, 14 Jul 2001 21:53:27 +0100
Date: Sat, 14 Jul 2001 21:53:27 +0100
From: Matthew Wilcox <willy@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] TODO list
Message-ID: <20010714215327.R3048@parcelfarce.linux.theplanet.co.uk>
References: <20010713201008.Q3048@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010713201008.Q3048@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Fri, Jul 13, 2001 at 08:10:08PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

Removing the ones which are fixed (or found to be not-bugs) leaves:

>  * Documentation/parisc/unwritten appears out of date

Grant has this one in progress.

>  * cache_init wants some printk DEBUG levels adding
>    [In general grep printk(\" is useful to check]

Helge in progress.

>  * led_get_net_stats() is interrupt-unsafe.

Helge in progress.

>  * ptrace is chock-full of intrusive debug code.  either remove it or
>    macroise it.
> 
>  * Why does the superio driver BUG and thus oops rather than printking an
>    error and continuing without that driver ?

-- 
Revolutions do not require corporate support.
