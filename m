Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6FD1D4A19
	for <parisc-linux@parisc-linux.org>; Thu,  1 Mar 2001 18:23:59 -0700 (MST)
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel2.hp.com (Postfix) with ESMTP id BCE7A2A5
	for <parisc-linux@parisc-linux.org>; Thu,  1 Mar 2001 20:23:58 -0500 (EST)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id C62DB37CB2
	for <parisc-linux@parisc-linux.org>; Thu,  1 Mar 2001 18:26:31 -0700 (MST)
To: parisc-linux@parisc-linux.org
Subject: New XC available was Re: [parisc-linux] 64-bit compiler millicode
 update
In-Reply-To: Message from Paul Bame <bame@fc.hp.com>
   of "Thu, 01 Mar 2001 17:33:07 MST." <E14YdVL-0000NE-00@noam.fc.hp.com>
References: <E14YdVL-0000NE-00@noam.fc.hp.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 01 Mar 2001 18:26:31 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010302012631.C62DB37CB2@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Paul Bame writes...

> 
> This affects people building 64-bit kernels after willy's (not yet
> available) changes, whereupon the $$mulI millicode routine becomes
> needed.
> 
> New cross compilers will soon be available, but if you just want to
> get the millicode change and no others, replace your 64-bit libgcc.a
> with [ftp|http]://puffin.external.hp.com/pub/parisc/binaries/libgcc.a.gz

The full xc with this change and also the recent glibc changes is now 
available at,

ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-20010301.tar.gz

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
