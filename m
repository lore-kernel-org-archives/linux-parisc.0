Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F7F64A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Feb 2001 05:27:20 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id XAA20571;
	Fri, 23 Feb 2001 23:26:17 +1100
Date: Fri, 23 Feb 2001 23:26:17 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] gcc & profiling
In-Reply-To: <20010223121727.C16261@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0102232323540.9345-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 23 Feb 2001, Matthew Wilcox wrote:

> So we're going to need another gcc merge?

No, the PROFILE_HOOK stuff is only a few lines of isolated code.
