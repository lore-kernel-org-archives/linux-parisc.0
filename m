Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 627914A19
	for <parisc-linux@parisc-linux.org>; Wed, 21 Feb 2001 12:31:47 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14VeQw-0001e5-00; Wed, 21 Feb 2001 11:56:14 -0700
Date: Wed, 21 Feb 2001 11:56:14 -0700
From: Matthew Wilcox <matthew@wil.cx>
To: hull@cup.hp.com
Cc: Matthew Wilcox <matthew@wil.cx>, arjanv@redhat.com,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Prefetch macros for PA-RISC
Message-ID: <20010221115614.K31164@parcelfarce.linux.theplanet.co.uk>
References: <20010221111141.H31164@parcelfarce.linux.theplanet.co.uk> <NDBBIHNACACKNDHNHIKAIEEGCBAA.jim_hull@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <NDBBIHNACACKNDHNHIKAIEEGCBAA.jim_hull@hp.com>; from jim_hull@hp.com on Wed, Feb 21, 2001 at 10:49:33AM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Feb 21, 2001 at 10:49:33AM -0800, Jim Hull wrote:
> Actually, Table 6-10 in the PA-RISC 2.0 book is wrong -- LDW is prefetch
> for read, LDD is prefetch for write.  See this erratum description:
> 
> http://devresource.hp.com/devresource/Docs/Refs/PA2_0/updates/e1.html

Wow, thanks Jim.  I would never have noticed that.

-- 
Revolutions do not require corporate support.
