Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id D72854A18
	for <parisc-linux@parisc-linux.org>; Thu,  1 Feb 2001 17:54:04 -0700 (MST)
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel2.hp.com (Postfix) with ESMTP id 6EEC1120B
	for <parisc-linux@parisc-linux.org>; Thu,  1 Feb 2001 19:54:04 -0500 (EST)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id 75D593873B
	for <parisc-linux@parisc-linux.org>; Thu,  1 Feb 2001 17:55:32 -0700 (MST)
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] WARNING: C3000 Linux problems 
In-Reply-To: Your message of "Wed, 31 Jan 2001 19:50:31 MST."
             <20010201025031.5C5A238926@carmen.fc.hp.com>
References: <20010201025031.5C5A238926@carmen.fc.hp.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 01 Feb 2001 17:55:32 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010202005532.75D593873B@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matt Taggart writes...

> Summary: Don't run Linux on a C3000 until you hear otherwise.
[snip]
> J5600, or J6000. John Marvin is still looking at the problem, I have switched

And he found it and has a patch. He will fix it in current cvs, but since 
that's a little unstable right now I have posted a pre 2.4.0-merge kernel that 
he built with this fix. It's at,

ftp://puffin.external.hp.com/pub/parisc/binaries/kernels/vmlinux-20010201

and of course you'll need to run palo on that kernel before you can boot it.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
