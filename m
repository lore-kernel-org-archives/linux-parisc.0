Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5BFC64843
	for <parisc-linux@parisc-linux.org>;
	Tue, 27 Jan 2004 11:36:09 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i0RIa5a20120; Tue, 27 Jan 2004 13:36:07 -0500
Subject: Re: [parisc-linux] 2.6.2-rc2 merging
From: James Bottomley <James.Bottomley@steeleye.com>
To: Matthew Wilcox <willy@debian.org>
In-Reply-To: <20040127175647.GC11844@parcelfarce.linux.theplanet.co.uk>
References: <20040127175647.GC11844@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Date: 27 Jan 2004 12:35:59 -0600
Message-Id: <1075228562.2952.30.camel@mulgrave>
Mime-Version: 1.0
Cc: parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, 2004-01-27 at 11:56, Matthew Wilcox wrote:
> After a conversation with jejb, we've decided to pull 2.6.2-rc2 into our
> tree to work on fixing some of the problems with it more effectively.
> This does mean that the tree will PROBABBLY NOT WORK, MAY EAT YOUR
> CAT, etc.  Unless you know what you're doing stick with the head of
> tree today.  Thanks.

Actually, the major issue that I can't fix is Vojtec's partial merge of
the parisc input subsystem, so if your name is Helge, this means you
need to update.

I also have been running a 2.6.2-rc2 based kernel on my PA boxes since
it was released with no ill effects (I do have to confess not having
seen the cat at all after doing the upgrade, but I'm assuming this is
because I didn't have one before...)

James
