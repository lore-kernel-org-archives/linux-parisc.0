Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3BC6B4843
	for <parisc-linux@parisc-linux.org>;
	Fri, 16 Jan 2004 11:31:57 -0700 (MST)
Date: Fri, 16 Jan 2004 12:14:55 -0800
From: Randolph Chung <tausq@debian.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] init and exit text problem
Message-ID: <20040116201455.GN533@tausq.org>
References: <4004805D000027C1@ocpmta3.freegates.net>
	<1074274218.2443.12.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1074274218.2443.12.camel@mulgrave>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Reply-To: Randolph Chung <tausq@debian.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> I'm not sure we can actually do this, though...I seem to remember that
> our 64 bit toolchain is not too happy doing discard sections.

Bugs not withstanding, it does seem to work. We have this in the linker
script already for a while:

#ifdef CONFIG_PARISC64
  /* temporary hack until binutils is fixed to not emit these
     for static binaries */
  /DISCARD/ : {
    *(.dynsym)
    *(.dynstr)
    *(.dynamic)
    *(.hash)
  }
#endif

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
