Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dhcp23.swansea.linux.org.uk (pc1-cwma1-5-cust4.swan.cable.ntl.com [80.5.120.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6E7A94865
	for <parisc-linux@lists.parisc-linux.org>; Sat, 30 Aug 2003 17:33:55 -0600 (MDT)
Received: from dhcp23.swansea.linux.org.uk (localhost.localdomain [127.0.0.1])
	by dhcp23.swansea.linux.org.uk (8.12.9/8.12.9) with ESMTP id h7UNX1ra031871;
	Sun, 31 Aug 2003 00:33:01 +0100
Received: (from alan@localhost)
	by dhcp23.swansea.linux.org.uk (8.12.9/8.12.9/Submit) id h7UNX1K2031869;
	Sun, 31 Aug 2003 00:33:01 +0100
Subject: Re: [parisc-linux] Security Hole in binfmt_som.c ?
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Matthew Wilcox <willy@debian.org>
Cc: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>,
	parisc-linux@lists.parisc-linux.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
In-Reply-To: <20030830135933.GJ13467@parcelfarce.linux.theplanet.co.uk>
References: <3F509BBD.2040007@hrzpub.tu-darmstadt.de>
	 <20030830131541.GI13467@parcelfarce.linux.theplanet.co.uk>
	 <1062251389.31150.4.camel@dhcp23.swansea.linux.org.uk>
	 <20030830135933.GJ13467@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Message-Id: <1062286379.31332.6.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Date: Sun, 31 Aug 2003 00:33:00 +0100
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

On Sad, 2003-08-30 at 14:59, Matthew Wilcox wrote:
> Um, I can't find it, and neither can Google:
> http://www.google.com/search?q=binfmt_som+security&as_q=%5Bparisc-linux&btnG=Google+Search&as_sitesearch=lists.parisc-linux.org

Humm I thought it was on this list. Maybe lkml then

Whatever the basic problem is we have kernel loaders and
user threads sharing a file table unsafely
