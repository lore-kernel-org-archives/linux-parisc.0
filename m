Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id A9E894A19
	for <parisc-linux@parisc-linux.org>; Sun,  4 Mar 2001 04:39:16 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id WAA02228;
	Sun, 4 Mar 2001 22:39:06 +1100
Date: Sun, 4 Mar 2001 22:39:06 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] confused about kernel printk behavior...
In-Reply-To: <20010302190848.U27829@tausq.org>
Message-ID: <Pine.LNX.4.21.0103042237440.32448-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 2 Mar 2001, Randolph Chung wrote:

> stabledev_read: pos = 20536, count = 0
> stabledev_read: pos = 1
> stabledev_read: count = 4096
> 
> why is that?  this is a 32-bit kernel built using xc-20010215

loff_t is `long long' on 32-bit parisc.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
