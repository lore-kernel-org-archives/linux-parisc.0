Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from leo.uni-sw.gwdg.de (leo.uni-sw.gwdg.de [134.76.205.152])
	by dsl2.external.hp.com (Postfix) with ESMTP id E18C0482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 10:24:25 -0600 (MDT)
Date: Tue, 14 Aug 2001 18:24:07 +0200 (CEST)
From: Peter Weilbacher <weilbach@uni-sw.gwdg.de>
To: Randolph Chung <randolph@tausq.org>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Once more: JFS
In-Reply-To: <20010814082532.A15709@tausq.org>
Message-ID: <Pine.LNX.4.33.0108141808360.12006-100000@leo.uni-sw.gwdg.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 14 Aug 2001, Randolph Chung wrote:

> The unaligned messages by themselves indicate a *user-space* problem. We can
> look at the fsck.jfs code and see what it's doing.... my guess is that
> there's some casting going on that is causing the unaligned accesses.
[...]
> then it will trigger an unaligned access. (usually it's not quite that
> obvious though)

I am a bit out of programming, so I reported it to the JFS people,
they should be faster at finding this than me.

> If you see a "Not-handled unaligned access" message then there's a
> kernel issue that we need to address, but doesn't seem to be the case
> here.

No, none like that. Thanks for the explenation!

	Peter.
