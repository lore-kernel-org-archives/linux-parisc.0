Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 78644482A
	for <parisc-linux@parisc-linux.org>; Tue, 18 Dec 2001 08:15:08 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16GLxN-0002ig-00; Tue, 18 Dec 2001 15:15:01 +0000
Date: Tue, 18 Dec 2001 15:15:01 +0000
From: Matthew Wilcox <willy@debian.org>
To: Tom <palinux@alaskatech.org>
Cc: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] C180 and EISA/PCI video?
Message-ID: <20011218151501.B8936@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.33.0112171521110.20808-100000@goliath.alaskatech.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0112171521110.20808-100000@goliath.alaskatech.org>; from palinux@alaskatech.org on Mon, Dec 17, 2001 at 03:27:11PM -0900
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

On Mon, Dec 17, 2001 at 03:27:11PM -0900, Tom wrote:
> So, finally picked up a C180. However, it has the DVI video connector. It
> also has free slots - is it possible to use a PCI or EISA video card in
> it, or should I track down the video adapter?

it tends to be tricky getting pci graphics cards of the right voltage --
unless they're HP manufactured ones, in which case they're expensive.
Nobody's written support for EISA DMA yet.  Easiest thing is to get hold
of the adapter.

-- 
Revolutions do not require corporate support.
