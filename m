Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spawn.hockeyfiend.com (dsl092-073-086.bos1.dsl.speakeasy.net [66.92.73.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 94E8A482A
	for <parisc-linux@parisc-linux.org>; Mon, 22 Oct 2001 23:20:17 -0600 (MDT)
Date: Tue, 23 Oct 2001 01:20:00 -0400 (EDT)
From: "Christopher C. Chimelis" <chris@debian.org>
To: Randolph Chung <tausq@debian.org>
Cc: bcollins@debian.org, amodra@bigpond.net.au,
	parisc-linux@parisc-linux.org
In-Reply-To: <20011022221714.O537@tausq.org>
Message-ID: <Pine.LNX.4.21.0110230118590.16337-100000@spawn.hockeyfiend.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: "Christopher C. Chimelis" <chris@spawn.hockeyfiend.com>
Subject: [parisc-linux] Re: Yay, binutils fixed for hppa
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 22 Oct 2001, Randolph Chung wrote:

> With many thanks to Alan Modra binutils seems to be fixed now. Chris,
> can you please build a new binutils from cvs? Everything should be there, and
> the hppa-specific patch you currently have in the package should no longer 
> be needed.

Ok, I'll include those in the next upload (based on HJ's release from
today and including the patches that Alan just committed).

> The patch Ben has is needed to build glibc with the new binutils.

Fantastic :-)

> hppa is also a bit behind on gcc-3.0. I'll try to build new ones RSN.

This is good news :-)  Many thanks to Alan for working on this so quickly
:-)

C
