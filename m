Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 590A64843
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Jan 2004 12:22:13 -0700 (MST)
Date: Tue, 27 Jan 2004 12:22:12 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Using PAT_IO calls for PCI config space reads and
	writes.
Message-ID: <20040127192212.GC28476@colo.lackof.org>
References: <401623CA.59AE3CCD@india.hp.com>
	<20040127184345.GD11844@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040127184345.GD11844@parcelfarce.linux.theplanet.co.uk>
Cc: parisc-linux@lists.parisc-linux.org, Naresh Kumar <knaresh@india.hp.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Jan 27, 2004 at 06:43:45PM +0000, Matthew Wilcox wrote:
> > 2. Can these changes be propagated to 2.6 also?
> 
> You should be developing against 2.6 in the first place.

Should - but they don't about 2.6.  At least not yet.
I'll deal with forward porting the changes once your comments are integrated.
Naresh, can you take care of that and resubmit?

thanks,
grant
