Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1CC514843
	for <parisc-linux@parisc-linux.org>;
	Fri, 16 Jan 2004 11:47:28 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i0GIlMa24029; Fri, 16 Jan 2004 13:47:22 -0500
Subject: Re: [parisc-linux] init and exit text problem
From: James Bottomley <James.Bottomley@steeleye.com>
To: Randolph Chung <tausq@debian.org>
In-Reply-To: <20040116201455.GN533@tausq.org>
References: <4004805D000027C1@ocpmta3.freegates.net>
	<1074274218.2443.12.camel@mulgrave>  <20040116201455.GN533@tausq.org>
Content-Type: text/plain
Date: 16 Jan 2004 13:47:19 -0500
Message-Id: <1074278840.1884.23.camel@mulgrave>
Mime-Version: 1.0
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, 2004-01-16 at 15:14, Randolph Chung wrote:
> > I'm not sure we can actually do this, though...I seem to remember that
> > our 64 bit toolchain is not too happy doing discard sections.
> 
> Bugs not withstanding, it does seem to work. We have this in the linker
> script already for a while:

OK.

There look to be quite a few other differences between our linker script
and x86's.  I'll go over them and see if we need to change.

James
