Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 64258482A
	for <parisc-linux@parisc-linux.org>; Thu, 19 Apr 2001 20:36:40 -0600 (MDT)
Date: Thu, 19 Apr 2001 20:36:39 -0600
To: esr@thyrsus.com
Cc: linux-kernel@vger.kernel.org, parisc-linux@parisc-linux.org
Message-ID: <20010419203639.H4217@zumpano.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: willy@ldl.fc.hp.com (Matthew Wilcox)
Subject: [parisc-linux] Re: OK, let's try cleaning up another nit. Is anyone paying attention?
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Apr 19, 2001 at 18:50:34 EDT, Eric S. Raymond wrote:
> Remove dead CONFIG_BINFMT_JAVA symbol.

Please don't do this, it just makes merging our patches with Linus harder.
This has already been done in our tree since Feb 1.  In fact, please
don't touch anything in the tree which is PA specific; we have a large
arch update pending.

http://puffin.external.hp.com/cvs/linux/arch/parisc/config.in?log=y

shows the current state of our config.in, if you're curious.  If you
have any changes you want to make, don't hesitate to coordinate with us
by mailing parisc-linux@parisc-linux.org.
