Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from scrub.xs4all.nl (scrub.xs4all.nl [194.109.195.176])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9B5B04845
	for <parisc-linux@parisc-linux.org>; Mon, 29 Sep 2003 10:24:31 -0600 (MDT)
Date: Mon, 29 Sep 2003 18:24:14 +0200 (CEST)
From: Roman Zippel <zippel@linux-m68k.org>
To: Matthew Wilcox <willy@debian.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>,
	<parisc-linux@parisc-linux.org>,
	<linux-apus-devel@lists.sourceforge.net>
In-Reply-To: <20030929133317.GP24824@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.44.0309291818060.17548-100000@serv>
References: <Pine.GSO.4.21.0309291116250.7432-100000@vervain.sonytel.be>
 <Pine.LNX.4.44.0309291434260.17812-100000@serv>
 <20030929133317.GP24824@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi,

On Mon, 29 Sep 2003, Matthew Wilcox wrote:

> ... Ah ;-)  So where do I find the APUS tree?  From digging around on
> the web (man, there's a lot of broken links in the APUS faq ...), it

It's also quite old... :)

> seems to be its own sourceforge project that hasn't switched to working
> on 2.6 yet, is this correct?

Yes. My 2.6 tree currently dies at the first exec.

> Now that ncr53c8xx is non-PCI only, it should cause the absolute minimum
> of wailing & gnashing of teeth to convert it to use the non-coherent
> dma device API.

Um, which one is the current right dma device API?

bye, Roman
