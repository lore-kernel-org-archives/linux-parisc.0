Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8A6BE4840
	for <parisc-linux@parisc-linux.org>; Mon, 29 Sep 2003 07:33:19 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A3y9N-0003Pc-9D; Mon, 29 Sep 2003 14:33:17 +0100
Date: Mon, 29 Sep 2003 14:33:17 +0100
From: Matthew Wilcox <willy@debian.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Matthew Wilcox <willy@debian.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>,
	parisc-linux@parisc-linux.org, linux-apus-devel@lists.sourceforge.net
Message-ID: <20030929133317.GP24824@parcelfarce.linux.theplanet.co.uk>
References: <Pine.GSO.4.21.0309291116250.7432-100000@vervain.sonytel.be> <Pine.LNX.4.44.0309291434260.17812-100000@serv>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0309291434260.17812-100000@serv>
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

On Mon, Sep 29, 2003 at 02:53:16PM +0200, Roman Zippel wrote:
> Hi,
> 
> On Mon, 29 Sep 2003, Geert Uytterhoeven wrote:
> 
> > > Are there any Amiga cards that are 720 based?
> > 
> > I don't know for sure. Probably not (cfr. above).
> 
> The ppc boards have a 770. In the APUS tree we currently have a modified 
> ncr53c8xx driver, that sort of seems to work. The biggest problem seems to 
> be the incoherent memory interface.

... Ah ;-)  So where do I find the APUS tree?  From digging around on
the web (man, there's a lot of broken links in the APUS faq ...), it
seems to be its own sourceforge project that hasn't switched to working
on 2.6 yet, is this correct?

Now that ncr53c8xx is non-PCI only, it should cause the absolute minimum
of wailing & gnashing of teeth to convert it to use the non-coherent
dma device API.  It would benefit PA-RISC too as we have two models
(735 and 755) that have NCR720 chips and a non-coherent architecture.
Right now, they use the 53c700 driver, but it'd be better to use the
ncr53c8xx driver, of course.

Are any APUS people interested in working on this?  

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
