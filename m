Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (lightning.swansea.linux.org.uk [194.168.151.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9673D482A
	for <parisc-linux@parisc-linux.org>; Sun, 13 Jan 2002 08:56:51 -0700 (MST)
Subject: Re: [parisc-linux] bogomips?
To: willy@debian.org (Matthew Wilcox)
Date: Sun, 13 Jan 2002 16:08:18 +0000 (GMT)
Cc: mszick@pflash.com (Michael S. Zick),
	parisc-linux@parisc-linux.org
In-Reply-To: <20020113155216.O9193@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Jan 13, 2002 03:52:16 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E16PnBC-0007Jg-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
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

> On Sun, Jan 13, 2002 at 09:48:20AM -0600, Michael S. Zick wrote:
> > Once upon a time, both my Celeron and my P-II reported approximately 1.00 * 
> > clock (same as above reference), then with some change of kernel version, 
> > jumped to 2.00 * clock.
> 
> yeah, that was a change prumpf made.  i forget why, but there was an
> important reason.

We changed the x86 bogomip computation because it overflowed on a 2GHz 
processor. (Yes Linux 2.0 does not work on 2GHz preventium IV 8))

In all cases bogomips serves only two other serious purposes. Comparison
of identical processors, and checking nobody sold you the wrong processor.

Even in the x86 world this is quite obvious, with a 1.5GHz AMD flattening
a 2GHz Intel on actual throughput.

Alan
