Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 07343482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Aug 2001 12:42:36 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15SNQY-0005kB-00; Thu, 02 Aug 2001 19:42:34 +0100
Date: Thu, 2 Aug 2001 19:42:34 +0100
From: Matthew Wilcox <willy@debian.org>
To: LaMont Jones <lamont@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] libqthreads and hppa-linux
Message-ID: <20010802194234.A20250@parcelfarce.linux.theplanet.co.uk>
References: <20010802040435.818241872C@security.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010802040435.818241872C@security.hp.com>; from lamont@hp.com on Wed, Aug 01, 2001 at 10:04:34PM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Aug 01, 2001 at 10:04:34PM -0600, LaMont Jones wrote:
> I started to play with getting the hppa assembly code in guile-core to work
> on pa-linux, but ran into challenges with %farg[0-3], which aren't defined
> by the assembler...

I already discussed this in detail with the maintainer; details of the
discussion can be found in the BTS.  I'm disappointed you decided to
waste your time on this without reading that discussion or talking to me.

> I'm about to upload a source NMU of guile-core, which has qt/md/hppa*-linux.?
> in it.  If someone wanted to take that the rest of the way, I'd be happy to
> upload it...

No, don't do this, it's completely unnecessary.

-- 
Revolutions do not require corporate support.
