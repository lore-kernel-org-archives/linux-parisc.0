Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D5DCF482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 20:01:34 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15e5Wk-0007cD-00; Tue, 04 Sep 2001 03:01:22 +0100
Date: Tue, 4 Sep 2001 03:01:22 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: Arnaud.ATOCH@oecd.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] UreStoreOptical 20xt
Message-ID: <20010904030122.S5126@parcelfarce.linux.theplanet.co.uk>
References: <C12531D038D1D011B1DB0000F8036C280A30EB51@eosm5.oecd.org> <200109040134.TAA23952@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200109040134.TAA23952@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Mon, Sep 03, 2001 at 07:34:20PM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Sep 03, 2001 at 07:34:20PM -0600, Grant Grundler wrote:
> IIRC, should only need hpfs (which also depends on ufs?..dunno anymore)
> hfs == Apple's Hiearchial File System.

hpfs is IBM's High Performance FileSystem for OS/2 :-)
You need ufs and mount with -ohp, iirc.

> > Btw does the HP-UX fs support patch made it to Linus tree ?
> 
> dunno.  But didn't that patch come from the parisc-linux tree?

Yes, it's in Linus' tree.  We merged that in a loooong time ago.

> Anyway...you might check if those disks are under LVM control.
> If so, you'll have to convert those to non-LVM storage using HPUX.
> The archives for parisc-linux mailing list have a discussion on HP's
> LVM issues.

That's what I assume.  There is now vxfs support in the tree, but nobody's
tried getting it working on HP vxfs volumes.  Volunteers...?

-- 
Revolutions do not require corporate support.
