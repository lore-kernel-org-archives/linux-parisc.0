Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from spawn.hockeyfiend.com (dsl092-073-086.bos1.dsl.speakeasy.net [66.92.73.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 06FAD482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Jan 2002 09:12:52 -0700 (MST)
Date: Tue, 29 Jan 2002 11:12:42 -0500 (EST)
From: "Christopher C. Chimelis" <chris@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: HEISERER DANIEL <Daniel.Heiserer@bmw.de>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
In-Reply-To: <20020129151945.B3850@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0201291110160.32249-100000@spawn.hockeyfiend.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: octave2.1_2.1.35-6_hppa
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

On Tue, 29 Jan 2002, Matthew Wilcox wrote:

> We don't build binaries for HP-UX.  Some people have suggested starting a
> new port to build binaries for proprietary unices sch as Solaris and HP-UX,
> but nobody has actually done so yet.

It may be helpful, though, to pick up the Debian source package and look
over the patches since there may be some that work around the "gotchas" of
the platform.  It would at least be a good start, even though the patches 
are probably a bit more linux-specific and probably shouldn't be used
verbatim hoping that they fix problems for HP-UX compilation.

C
