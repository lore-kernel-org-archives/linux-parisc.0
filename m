Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D6C74843
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 17 Jan 2004 01:17:22 -0700 (MST)
Date: Sat, 17 Jan 2004 01:17:20 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] init and exit text problem
Message-ID: <20040117081720.GA29918@colo.lackof.org>
References: <4004805D000027C1@ocpmta3.freegates.net>
	<1074274218.2443.12.camel@mulgrave>
	<20040116201455.GN533@tausq.org>
	<1074278840.1884.23.camel@mulgrave>
	<1074298363.2443.47.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1074298363.2443.47.camel@mulgrave>
Cc: Matthew Wilcox <willy@debian.org>, Randolph Chung <tausq@debian.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Jan 16, 2004 at 07:12:41PM -0500, James Bottomley wrote:
> The attached should be a first cut at this.
> 
> I shifted around or vmlinux.lds.S with a view to minimising the diffs
> between ours and the one in i386 (so we can spot changes more easily).

This boots and works on the A500 (ios).

2.6.1 kernel with this patch and "bridge_ctl" PCI patch from
Russell King are uploaded to ftp.p-l.o:kernels/a500/2.6.1-pa4.tgz
(No, it's not a -pa4 kernel but that's what it happens to use)

thanks!
grant
