Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from wolf.alaskatech (207-5-237-24-cable.anchorageak.net [24.237.5.207])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2125F4829
	for <parisc-linux@parisc-linux.org>; Wed, 13 Nov 2002 13:05:39 -0700 (MST)
Received: from wolf.alaskatech (palinux@wolf.alaskatech [24.237.5.207])
	by wolf.alaskatech (8.12.3/8.12.3/Debian -4) with ESMTP id gADK5qRO028315;
	Wed, 13 Nov 2002 11:05:52 -0900
Date: Wed, 13 Nov 2002 11:05:51 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: Matthew Wilcox <willy@debian.org>
Cc: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] LONG pause on boot
In-Reply-To: <20021113193018.P30392@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.44.0211131104580.26859-100000@wolf.alaskatech>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

> On Wed, Nov 13, 2002 at 10:26:43AM -0900, Tom wrote:
> > Does anyone have an idea as to why such a long delay would occur there?
> > PDC has console to serial_1, which had a terminal on it. There was no
> > errors or complaints anywhere in the boot process, and none visible during
> > the kernel compile. I can provide System.map, config file, etc. if
> > desired...

> On Wed, 13 Nov 2002, Matthew Wilcox wrote:
> Yes, it's during device walk.  The support for E class that rbrad wrote
> means that every machine with a CCIO suffers.  I suspect this'll get
> fixed fairly soon.

Then I'll assume it's a "feature", at least until sometime in the 2.4.20
range :-)

Thanks!
