Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E06BD482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  1 Jun 2001 16:00:13 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 155wxY-0002Gf-00; Fri, 01 Jun 2001 22:59:56 +0100
Date: Fri, 1 Jun 2001 22:59:56 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Chuck Slivkoff <charles_slivkoff@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Upgrade path from 0.6 to 0.9?
Message-ID: <20010601225956.K7349@parcelfarce.linux.theplanet.co.uk>
References: <3B180D83.F5479D0B@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B180D83.F5479D0B@hp.com>; from charles_slivkoff@hp.com on Fri, Jun 01, 2001 at 05:47:47PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jun 01, 2001 at 05:47:47PM -0400, Chuck Slivkoff wrote:
> I'm thinking I need to update the kernel, but I'd like to not have to
> reload this from scratch.  I can pull the kernel from the 0.9 ISO, but
> PALO didn't seem to be too intuitive.

You do have to update your kernel in order to run glibc 2.2.3, due to
the changes in how stacks are managed for threads.  I don't think palo
is too unintuitive...

-- 
Revolutions do not require corporate support.
