Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3D6C64854
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 12 Dec 2003 07:59:11 -0700 (MST)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com
	[172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	hBCEx9a01807; Fri, 12 Dec 2003 09:59:09 -0500
Subject: Re: [parisc-linux] proposed changes to dino.c
From: James Bottomley <James.Bottomley@steeleye.com>
To: Grant Grundler <grundler@parisc-linux.org>
In-Reply-To: <20031212074838.GA16885@colo.lackof.org>
References: <1071031038.1977.1.camel@mulgrave>
	<20031210045429.GA18782@colo.lackof.org>
	<1071093265.1730.27.camel@mulgrave>
	<20031212074838.GA16885@colo.lackof.org>
Content-Type: text/plain
Date: 12 Dec 2003 09:58:48 -0500
Message-Id: <1071241131.1814.5.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, 2003-12-12 at 02:48, Grant Grundler wrote:
> I just realized some drivers may need to access data (not code)
> in the ROM. I'm not aware of any but I don't want to under
> estimate how creative people can get. Just something to beware
> when bringing up new cards.

Hmm, well, we can back it out if people start hitting problems.

The reason for it is the Quad tulip card:  The bridge chip only requests
a 1MB PCI window, but each chip has two memory BARs: the iomem region
(128bytes, with page alignment) and the ROM (256Kb).  The bridge
allocation routines seem to work the BARs in reverse, so by the time the
ROM BARs are allocated, the memory window is full and none of the
devices can function.

I suppose I could look at a two phase approach: count all the resources
and sizes and then resize the bridge window appropriately...we actually
already need to do this for the GSC window on my C360...firmware
allocates too much space in the GSC/8 window and I run out of iomem
space for devices on the GSC/10.

James
