Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP
	id 72A8D4829; Thu, 10 Apr 2003 05:19:28 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 193a5W-0006lF-VF; Thu, 10 Apr 2003 12:19:26 +0100
Date: Thu, 10 Apr 2003 12:19:26 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] parisc-linux.org kernel
Message-ID: <20030410111926.GR23430@parcelfarce.linux.theplanet.co.uk>
References: <20030409054929.GB21306@dsl2.external.hp.com> <3E947323.14900.19F1E3AF@localhost> <20030410055003.GB21872@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030410055003.GB21872@dsl2.external.hp.com>
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

On Wed, Apr 09, 2003 at 11:50:03PM -0600, Grant Grundler wrote:
> > actually, i'd like to (feel free to answer off-list),
> 
> Once the 2.4.20-preX bk tree that willy was using as "parent"
> was discarded by marcelo because of other bugs in patches.
> Or marcelo wouldn't accept the patch because he had a -pre candidate
> and didn't want to risk that. Just stuff like that.

And other people were patching things in the parisc-specific directories
which conflicted with my patches ;-(

> As willy noted, parisc is not an exception. last time willy looked at
> merging, the 2.4 diff was something like 2 or 3MB. I'd hope it's a bit
> smaller since Alan Cox merge a bunch of stuff into his tree.
> But I haven't looked if/when Marcelo picked any of that up.
> For comparison, last I heard, the 2.5 diff is something like < 100KB.

-rw-r--r--    1 willy    willy      202871 Apr  8 20:54 parisc-2.5.diff
although most of that is:
-rw-r--r--    1 willy    willy      170361 Mar 18 18:46 parisc-hil.diff

$ zcat ../ftp/cvs/patch-2.4.20-pa32.diff.gz |wc
  91100  503494 3691507

that's not the full story since a large chunk of that's been merged into
2.4.21-pre, but i have no idea how much would be remaining.

if anyone had the time, we could track 2.4.21-pre more closely.  but it's
just not worth it.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
