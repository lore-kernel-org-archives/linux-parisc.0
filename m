Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B0B77482C
	for <parisc-linux@parisc-linux.org>; Tue, 27 Nov 2001 11:21:14 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 168mr3-0007NQ-00; Tue, 27 Nov 2001 18:21:13 +0000
Date: Tue, 27 Nov 2001 18:21:13 +0000
From: Matthew Wilcox <willy@debian.org>
To: "Michael S . Zick" <mszick@pflash.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] ftp://parisc-linus.org/cvs - binutils? - glibc?
Message-ID: <20011127182113.D4180@parcelfarce.linux.theplanet.co.uk>
References: <01112712080500.01278@Wolf-01>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01112712080500.01278@Wolf-01>; from mszick@pflash.com on Tue, Nov 27, 2001 at 12:08:05PM -0600
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

On Tue, Nov 27, 2001 at 12:08:05PM -0600, Michael S . Zick wrote:
> I have checked both /cvs and /src but can not find "glibc" and "binutils" 
> snapshots.
> Where could I find these?

you can't.  we have not maintained glibc & binutils cvs trees for a while.
i suggest the debian packages as your best source of latest bits.

> There have been a number of recent patchs to binutils for hppa.  (Such as: 
> http://sources.redhat.com/ml/binutils/2001-11/msg00622.html ) by Alan Modra.
> I would like to try keeping a local tree of the hppa version.

nobody's going to stop you doing that, though why you wouldn't simply
use the upstream cvs binutils, i don't know.

-- 
Revolutions do not require corporate support.
