Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 563E8484B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Jun 2002 16:10:15 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17OmtZ-0005zb-00; Sun, 30 Jun 2002 23:10:13 +0100
Date: Sun, 30 Jun 2002 23:10:13 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Bryan W. Headley" <bwheadley@earthlink.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] XFree-4.2 and C110
Message-ID: <20020630231013.C29045@parcelfarce.linux.theplanet.co.uk>
References: <3D1F1A32.7060407@earthlink.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D1F1A32.7060407@earthlink.net>; from bwheadley@earthlink.net on Sun, Jun 30, 2002 at 09:48:18AM -0500
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

On Sun, Jun 30, 2002 at 09:48:18AM -0500, Bryan W. Headley wrote:
> The system appears to be looking in /proc/bus/pci to look for video 
> cards and framebuffers, which is a bogus way to find video cards on a 
> PC, too (VESA bus, ISA, EISA, MCA... where is that video card?)

Ugh.

> I'm not too fond of synthesizing a "pci" directory, and making up fake 
> IDs for things that aren't PCI cards...

Well... it's a hack which we already kind of do, and won't need to
carry forward into 2.5.  There's a fake PCI device per IOC, so maybe
this could be filled in by a gfx card.  In 2.5, we'll have driverfs
and hopefully X won't have to tell the difference.

-- 
Revolutions do not require corporate support.
