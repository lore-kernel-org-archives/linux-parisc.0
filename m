Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8B4454868
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 19:47:20 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16kynP-0004I2-00; Wed, 13 Mar 2002 02:47:19 +0000
Date: Wed, 13 Mar 2002 02:47:19 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Switch console error.
Message-ID: <20020313024719.N30538@parcelfarce.linux.theplanet.co.uk>
References: <3C8E5DCD.942E6278@cup.hp.com> <20020312201309.H30538@parcelfarce.linux.theplanet.co.uk> <3C8E6704.81F14945@cup.hp.com> <20020312204919.I30538@parcelfarce.linux.theplanet.co.uk> <3C8E8520.EC6877E3@cup.hp.com> <20020312225858.A979E38556@carmen.fc.hp.com> <3C8E8A6F.2AD5761C@cup.hp.com> <20020312234838.K30538@parcelfarce.linux.theplanet.co.uk> <willy@debian.org> <20020313014206.75AA54851@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020313014206.75AA54851@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Tue, Mar 12, 2002 at 06:42:06PM -0700
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

On Tue, Mar 12, 2002 at 06:42:06PM -0700, Grant Grundler wrote:
> Matthew Wilcox wrote:
> > The kernel has its own mappings for pages so it can take advantage of
> > 16MB pages.  These are not coherent with the pages that are mapped into
> > user space. 
> 
> And this would cause an HPMC?

Yes, indirectly, see below.

> If someone could decode the Gururaj's HPMC data ("ser pim" from BCH prompt)
> and post the results.  At worst, it would confirm this theory.

Yes, that would certainly help.  As I said, it is only a theory...

> Sorry, I'm not VM clueful enough to understand why this would be a
> problem on N-class and not other boxes.  I know coherency works differently
> here (Merced Bus is "central" vs Runway for most other boxes).
> Someplace to look for more clues?

It's not to do with the bus (AFAIK...).  It's to do with Stretch (the
memory controller).  We've got away with using non-equivalent aliases (see
the PA 2.0 book [1]) up until now, but it seems that Stretch doesn't let
us get away with it any more.  So we have to be sure to use equivalent
aliases when accessing a page.  It's been suggested to me that Stretch
has its own tags for a page and if it gets writes to different tags on
the same physical page, it generates an HPMC.

[1] I would have given a reference here, but
http://h21007.www2.hp.com/dspp/tech/tech_TechDocumentDetailPage_IDX/1,1701,959,00.html
gives me a Redirection Limit exceeded error... hopefully this will get
fixed soon.

-- 
Revolutions do not require corporate support.
