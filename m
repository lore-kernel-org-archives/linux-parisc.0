Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0941E484B
	for <parisc-linux@parisc-linux.org>;
	Fri, 16 Jan 2004 10:32:16 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i0GHUHa19640; Fri, 16 Jan 2004 12:30:17 -0500
Subject: RE: [parisc-linux] init and exit text problem
From: James Bottomley <James.Bottomley@steeleye.com>
To: Joel Soete <soete.joel@tiscali.be>
In-Reply-To: <4004805D000027C1@ocpmta3.freegates.net>
References: <4004805D000027C1@ocpmta3.freegates.net>
Content-Type: text/plain
Date: 16 Jan 2004 12:30:17 -0500
Message-Id: <1074274218.2443.12.camel@mulgrave>
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

On Fri, 2004-01-16 at 11:50, Joel Soete wrote:
> +  /* When something in the kernel is NOT compiled as a module, the
> +   * module cleanup code and data are put into these segments.  Both
> +   * can then be thrown away, as cleanup code is never called unless
> +   * it's a module.
> +   */
> +  /DISCARD/ : {
> +	*(.exit.text)
> +	*(.exit.data)

This is wrong...exit.text and exit.data are runtime discards, not link
time ones, precisely because of the compile failures you get.

> +	*(.exitcall.exit)

This one should be OK.

I'm not sure we can actually do this, though...I seem to remember that
our 64 bit toolchain is not too happy doing discard sections.

James
