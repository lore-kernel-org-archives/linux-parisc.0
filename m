Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel2.hp.com (palrel2.hp.com [156.153.255.234])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7BAB3482A
	for <parisc-linux@parisc-linux.org>; Wed,  2 May 2001 12:12:44 -0600 (MDT)
Received: from adlmail.cup.hp.com (adlmail.cup.hp.com [15.0.100.30])
	by palrel2.hp.com (Postfix) with ESMTP id 0DDD578B
	for <parisc-linux@parisc-linux.org>; Wed,  2 May 2001 11:12:39 -0700 (PDT)
Message-Id: <200105021812.LAA04905@adlmail.cup.hp.com>
Subject: Re: [parisc-linux] ELFOSABI_LINUX
Date: Wed, 2 May 2001 11:10:16 -0700
From: Cary Coutant <cary@cup.hp.com>
To: "Matthew Wilcox" <willy@ldl.fc.hp.com>,
	<parisc-linux@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>One subversive developer suggested a third alternative -- that we think up
>& implement an extension to the ABI so we have to use ELFOSABI_LINUX :-)

There's no harm in claiming to use extensions that you really don't use 
-- even if there aren't any such extensions to use. We recommend, but do 
not require, that you set the OSABI field to zero if there are no 
extensions in use.

The only downside here is that some non-Linux ELF consumer might decide 
up front that it can't read the file because it doesn't understand the 
extensions. A well-written consumer, however, will wait until it actually 
sees an extension before deciding whether or not it understands it.

-cary
