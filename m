Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id D33A4482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Sep 2001 21:28:47 -0600 (MDT)
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] CVS Uptodate 
In-Reply-To: Message from "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
   of "Wed, 05 Sep 2001 23:20:58 EDT." <20010905232058.A1365@megatonmonkey.net>
References: <20010905232058.A1365@megatonmonkey.net> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 05 Sep 2001 21:28:46 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010906032846.E3D1B37DD4@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Carlos O'Donell Jr." writes...

> Just a quick question, I was wondering which CVS bits are
> up to date?
> 
> - gcc (Yes)
> - binutils (Someone recently said they were stale)
> - linux (Yes)
> - palo (Yes)
> - glibc (No, debian pool has latest source)

These are all correct. Use uptream for binutils(or the Debian package works 
too). I might rename binutils and glibc to make it clear that they're not 
being kept up to date.

> I guess the debian pool would have the latest source for
> everything?

Unless you have a good reason to use pehc cvs, use the Debian packages for 
everything.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
