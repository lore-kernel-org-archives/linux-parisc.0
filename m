Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id F3E9C482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 Aug 2001 23:59:08 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15cKr5-0002Ze-00; Thu, 30 Aug 2001 06:59:07 +0100
Date: Thu, 30 Aug 2001 06:59:07 +0100
From: Matthew Wilcox <willy@debian.org>
To: thunder7@xs4all.nl
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [newbie] gcc/glibc problems
Message-ID: <20010830065907.H13438@parcelfarce.linux.theplanet.co.uk>
References: <20010830073255.A9044@middle.of.nowhere>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010830073255.A9044@middle.of.nowhere>; from thunder7@xs4all.nl on Thu, Aug 30, 2001 at 07:32:55AM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Aug 30, 2001 at 07:32:55AM +0200, thunder7@xs4all.nl wrote:
> In file included from test.c:1:
> /usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:37:23: features.h: No such file or directory
> In file included from /usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:43,

do you have libc6-dev installed?

-- 
Revolutions do not require corporate support.
