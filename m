Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8389F4838
	for <parisc-linux@parisc-linux.org>; Tue, 18 Mar 2003 08:30:58 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h2IFUP309010;
	Tue, 18 Mar 2003 10:30:25 -0500
Subject: Re: [parisc-linux] CVSy stuff
From: James Bottomley <James.Bottomley@steeleye.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20030318143337.GF14520@parcelfarce.linux.theplanet.co.uk>
References: <20030318143337.GF14520@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Date: 18 Mar 2003 10:30:25 -0500
Message-Id: <1048001425.2210.14.camel@mulgrave>
Mime-Version: 1.0
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Tue, 2003-03-18 at 09:33, Matthew Wilcox wrote:
> So how about this model...
> 
> 1. -> linus
> 1.1 -> LINUS_260
> 1.2 -> LINUS_261
> 1.2.1 -> parisc_261
> 1.2.1.1 -> CVS261_PA1
> 1.2.1.2 -> CVS261_PA2
> ...
> 1.3 -> LINUS_262
> 1.3.1 -> parisc_262
> 1.3.1.1 -> CVS262_PA1
> 
> OK, this model clearly fits CVS' needs much better.  How about ours?
> Well, it sucks that you're always developing on a branch.  It sucks for
> people who're used to doing 'cvs up -A' to get to the trunk, because
> they now get Linus instead of us.  It also sucks that you stay on
> parisc_261 when you type "cvs up", so you have to explictly say "cvs
> up -rparisc_262".
> 
> However, it doesn't have the suckitude of vendor branches, and it allows
> us to reasonably use cvs diff -rlinus.  Choose your suck.

The proposed model works OK.  I used to use it for my voyager trees when
I had them in CVS instead of BK.  I think your assessment is correct:
it's the least of the evils.

James
