Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF5A84A19
	for <parisc-linux@parisc-linux.org>; Wed,  7 Mar 2001 16:39:18 -0700 (MST)
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel2.hp.com (Postfix) with ESMTP id 472AD718
	for <parisc-linux@parisc-linux.org>; Wed,  7 Mar 2001 18:39:18 -0500 (EST)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id 87F3037CB4
	for <parisc-linux@parisc-linux.org>; Wed,  7 Mar 2001 16:41:51 -0700 (MST)
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] New native glibc debs available 
In-Reply-To: Your message of "Wed, 07 Mar 2001 16:11:20 MST."
             <20010307231120.68F2737CB4@carmen.fc.hp.com>
References: <20010307231120.68F2737CB4@carmen.fc.hp.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 07 Mar 2001 16:41:51 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010307234151.87F3037CB4@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matt Taggart writes...

> I have built new native glibc debs that include the following commits,
> 
> http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2001-March/028738.ht
> ml
> http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2001-March/028739.ht
> ml
> 
> They are available at,
> 
> ftp://puffin.external.hp.com/pub/parisc/binaries/new-debs/debian/

When building debian packages with these glibc debs there is a problem when 
dpkg tries to determine the shlib dependencies. To fix this edit,

/var/lib/dpkg/info/libc6.shlibs

and remove all occurances of GLIBC_2.2. I am rebuilding the debs with the 
proper fix now and will post them soon.

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
