Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from witte.sonytel.be (mail2.sonytel.be [195.0.45.172])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9503B486E
	for <parisc-linux@parisc-linux.org>; Mon, 29 Sep 2003 07:46:48 -0600 (MDT)
Date: Mon, 29 Sep 2003 15:45:41 +0200 (MEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Matthew Wilcox <willy@debian.org>
Cc: Roman Zippel <zippel@linux-m68k.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>,
	parisc-linux@parisc-linux.org,
	Linux/PPC on APUS development <linux-apus-devel@lists.sourceforge.net>
In-Reply-To: <20030929133317.GP24824@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.GSO.4.21.0309291544190.7432-100000@vervain.sonytel.be>
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

On Mon, 29 Sep 2003, Matthew Wilcox wrote:
> On Mon, Sep 29, 2003 at 02:53:16PM +0200, Roman Zippel wrote:
> > The ppc boards have a 770. In the APUS tree we currently have a modified 
> > ncr53c8xx driver, that sort of seems to work. The biggest problem seems to 
> > be the incoherent memory interface.
> 
> ... Ah ;-)  So where do I find the APUS tree?  From digging around on
> the web (man, there's a lot of broken links in the APUS faq ...), it
> seems to be its own sourceforge project that hasn't switched to working
> on 2.6 yet, is this correct?

The APUS tree is indeed at SourceForge. Most recent version (not counting
Roman's hard disk :-) is 2.4.22.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
