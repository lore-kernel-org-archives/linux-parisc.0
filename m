Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id E039E4A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 23:29:48 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id RAA26470;
	Thu, 22 Feb 2001 17:29:21 +1100
Date: Thu, 22 Feb 2001 17:29:21 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Helge Deller <deller@gmx.de>,
	PL <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: schedule_tail
In-Reply-To: <Pine.LNX.4.21.0102221702100.14557-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0102221726110.14557-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 22 Feb 2001, Alan Modra wrote:

> I wrote up some stuff on stack frames at
> http://lists.parisc-linux.org/pipermail/parisc-linux/2001-February/011715.html

Which in looking at again, I realise is wrong.  :-(

The 64 bit "Outgoing Register Parameter Area" has eight entries, not four,
and the "Outgoing Stack Parameter Area" starts with arg word 8.
