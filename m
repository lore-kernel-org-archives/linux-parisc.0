Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spawn.hockeyfiend.com (dsl092-073-086.bos1.dsl.speakeasy.net [66.92.73.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 53238482B
	for <parisc-linux@parisc-linux.org>; Tue, 23 Oct 2001 17:56:32 -0600 (MDT)
Date: Tue, 23 Oct 2001 19:56:08 -0400 (EDT)
From: "Christopher C. Chimelis" <chris@debian.org>
To: Randolph Chung <tausq@debian.org>
Cc: bcollins@debian.org, amodra@bigpond.net.au,
	parisc-linux@parisc-linux.org
In-Reply-To: <20011022221714.O537@tausq.org>
Message-ID: <Pine.LNX.4.21.0110231955320.29726-100000@spawn.hockeyfiend.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: "Christopher C. Chimelis" <chris@spawn.hockeyfiend.com>
Subject: [parisc-linux] Re: Yay, binutils fixed for hppa
List-ID: <linux-parisc.vger.kernel.org>

Ok, new source package on klecker in ~chris/public_html/binutils for your
testing :-)  If it works, I'll do the upload tonight :-)

C

On Mon, 22 Oct 2001, Randolph Chung wrote:

> With many thanks to Alan Modra binutils seems to be fixed now. Chris,
> can you please build a new binutils from cvs? Everything should be there, and
> the hppa-specific patch you currently have in the package should no longer 
> be needed.
> 
> The patch Ben has is needed to build glibc with the new binutils.
> 
> hppa is also a bit behind on gcc-3.0. I'll try to build new ones RSN.
> 
> randolph
> -- 
> Debian Developer <tausq@debian.org>
> http://www.TauSq.org/
> 
> 
