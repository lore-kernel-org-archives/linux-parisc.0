Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5CBE5489B
	for <parisc-linux@parisc-linux.org>; Mon, 29 Sep 2003 10:27:50 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A40sH-0002fS-8X; Mon, 29 Sep 2003 17:27:49 +0100
Date: Mon, 29 Sep 2003 17:27:49 +0100
From: Matthew Wilcox <willy@debian.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: Matthew Wilcox <willy@debian.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>,
	parisc-linux@parisc-linux.org, linux-apus-devel@lists.sourceforge.net
Message-ID: <20030929162749.GR24824@parcelfarce.linux.theplanet.co.uk>
References: <Pine.GSO.4.21.0309291116250.7432-100000@vervain.sonytel.be> <Pine.LNX.4.44.0309291434260.17812-100000@serv> <20030929133317.GP24824@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.44.0309291818060.17548-100000@serv>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0309291818060.17548-100000@serv>
Subject: [parisc-linux] Re: NCR53c720
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

On Mon, Sep 29, 2003 at 06:24:14PM +0200, Roman Zippel wrote:
> > Now that ncr53c8xx is non-PCI only, it should cause the absolute minimum
> > of wailing & gnashing of teeth to convert it to use the non-coherent
> > dma device API.
> 
> Um, which one is the current right dma device API?

The one in Documentation/DMA-API.txt.  It looks like PowerPC hasn't got
an implementation of this yet -- is APUS the only non-coherent PowerPC
subport?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
