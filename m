Return-Path: <alan@lxorguk.ukuu.org.uk>
Received: from dhcp23.swansea.linux.org.uk (unknown [81.2.110.254])
	by dsl2.external.hp.com (Postfix) with ESMTP id E8F2A484B
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 12 Dec 2003 12:32:28 -0700 (MST)
Received: from dhcp23.swansea.linux.org.uk (localhost.localdomain [127.0.0.1])
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10) with ESMTP id
	hBCJSPPr021685; Fri, 12 Dec 2003 19:28:27 GMT
Received: (from alan@localhost)
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10/Submit) id
	hBCJSMls021683; Fri, 12 Dec 2003 19:28:22 GMT
Subject: Re: [parisc-linux] proposed changes to dino.c
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: James Bottomley <James.Bottomley@SteelEye.com>
In-Reply-To: <1071241131.1814.5.camel@mulgrave>
References: <1071031038.1977.1.camel@mulgrave>
	<20031210045429.GA18782@colo.lackof.org>
	<1071093265.1730.27.camel@mulgrave>
	<20031212074838.GA16885@colo.lackof.org>
	<1071241131.1814.5.camel@mulgrave>
Content-Type: text/plain
Message-Id: <1071257297.21661.3.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Date: Fri, 12 Dec 2003 19:28:18 +0000
Cc: Grant Grundler <grundler@parisc-linux.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Gwe, 2003-12-12 at 14:58, James Bottomley wrote:
> The reason for it is the Quad tulip card:  The bridge chip only requests
> a 1MB PCI window, but each chip has two memory BARs: the iomem region
> (128bytes, with page alignment) and the ROM (256Kb).  The bridge
> allocation routines seem to work the BARs in reverse, so by the time the
> ROM BARs are allocated, the memory window is full and none of the
> devices can function.

You don't need the ROM mapped expect for reading stuff like MAC, and you
can do that by mapping each port over the same address range.
