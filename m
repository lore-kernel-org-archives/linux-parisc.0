Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6E11E48A5
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Jan 2004 12:42:29 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AlZ6R-0007gL-VE; Tue, 27 Jan 2004 19:42:27 +0000
Date: Tue, 27 Jan 2004 19:42:27 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Using PAT_IO calls for PCI config space reads and
	writes.
Message-ID: <20040127194227.GE11844@parcelfarce.linux.theplanet.co.uk>
References: <401623CA.59AE3CCD@india.hp.com>
	<20040127184345.GD11844@parcelfarce.linux.theplanet.co.uk>
	<20040127192212.GC28476@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040127192212.GC28476@colo.lackof.org>
Sender: <willy@www.linux.org.uk>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@lists.parisc-linux.org,
	Naresh Kumar <knaresh@india.hp.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Jan 27, 2004 at 12:22:12PM -0700, Grant Grundler wrote:
> On Tue, Jan 27, 2004 at 06:43:45PM +0000, Matthew Wilcox wrote:
> > > 2. Can these changes be propagated to 2.6 also?
> > 
> > You should be developing against 2.6 in the first place.
> 
> Should - but they don't about 2.6.  At least not yet.
> I'll deal with forward porting the changes once your comments are integrated.
> Naresh, can you take care of that and resubmit?

Their development would actually go a lot easier if they worked on 2.6.
Compare lba_pci.c between 2.4 and 2.6 -- the new one is a *lot* easier
to work on.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
