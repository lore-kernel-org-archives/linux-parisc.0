Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8D7FB482A
	for <parisc-linux@parisc-linux.org>; Fri,  4 May 2001 11:08:06 -0600 (MDT)
Message-Id: <200105041708.KAA08105@adlmail.cup.hp.com>
Subject: Re: [parisc-linux] ELFOSABI_LINUX
Date: Fri, 4 May 2001 10:05:45 -0700
From: Cary Coutant <cary@cup.hp.com>
To: "Ulrich Drepper" <drepper@cygnus.com>
Cc: "Matthew Wilcox" <willy@ldl.fc.hp.com>,
	<parisc-linux@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>> There's no harm in claiming to use extensions that you really don't use 
>> -- even if there aren't any such extensions to use.
>
>There is no harm but I won't allow it. 

My statement was in response to a concern expressed by Matthew that a 
change to binutils would require rebuilding every single package:

> * Change binutils to produce binaries without ELFOSABI_LINUX set.  This
>   implies rebuilding every debian package we've built so far -- over
>   1100 source packages.  This means we'd miss our deadline of shipping
>   at the end of May.

I was trying to make the point that he could fix the tools (as you seem 
to prefer), but that binaries that have already been built will still 
work. They can be rebuilt at leisure (or not at all).

-cary
