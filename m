Return-Path: <alan@lxorguk.ukuu.org.uk>
Received: from dhcp23.swansea.linux.org.uk
	(cpc1-cwma1-5-0-cust4.swan.cable.ntl.com [80.5.120.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 57A1348AD
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 15 Feb 2004 09:10:35 -0700 (MST)
Received: from dhcp23.swansea.linux.org.uk (localhost.localdomain [127.0.0.1])
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10) with ESMTP id
	i1FG640r025553; Sun, 15 Feb 2004 16:06:06 GMT
Received: (from alan@localhost)
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10/Submit) id
	i1FG63rM025551; Sun, 15 Feb 2004 16:06:03 GMT
Subject: Re: [parisc-linux] C3000 video options
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: "M. Grabert" <xam@cs.ucc.ie>
In-Reply-To: <Pine.LNX.4.58.0402150326330.22822@sal.ucc.ie>
References: <Pine.GSO.4.44.0402142137500.12861-100000@keymaster>
	<Pine.LNX.4.58.0402150326330.22822@sal.ucc.ie>
Content-Type: text/plain
Message-Id: <1076861160.25519.1.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Date: Sun, 15 Feb 2004 16:06:01 +0000
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sul, 2004-02-15 at 03:36, M. Grabert wrote:
> Someone tried Voodoo2, but no success report so far.

Voodoo2 fb works for some cards. I'm currently debugging an accelerated
2D Voodoo2 driver that should work bi-endian with some tiny fixes

> You'll be lucky to get any (ix86) PCI graphics card working on Linux/PA-RISC.
> The best bet would be to get a Visualize-EG, or some graphics card that
> doesn't require initialization via (ix86-)BIOS (eg. Matrox Millenium).

Older S3, Matrox fit that, the XFree86 code has an x86 emulator which
will boot some more cards tho it does fail on some too where real vm86
works (eg C&T video BIOS)

Alan
