Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5B8BF483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 08:30:55 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A2tcS-0001F1-3B; Fri, 26 Sep 2003 15:30:52 +0100
Date: Fri, 26 Sep 2003 15:30:52 +0100
From: Matthew Wilcox <willy@debian.org>
To: "David S. Miller" <davem@redhat.com>
Cc: Matthew Wilcox <willy@debian.org>, santosha@india.hp.com,
	sct@redhat.com, santosh.abraham@hp.com, randolph@tausq.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Fwd:  Problems with raw interface.
Message-ID: <20030926143052.GL24824@parcelfarce.linux.theplanet.co.uk>
References: <20030926053805.63bda07a.davem@redhat.com> <200309261311.SAA27414@redsea.india.hp.com> <20030926055652.32ddbbc2.davem@redhat.com> <20030926132901.GJ24824@parcelfarce.linux.theplanet.co.uk> <20030926062143.20d85a72.davem@redhat.com> <20030926140948.GK24824@parcelfarce.linux.theplanet.co.uk> <20030926070450.603c5c33.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030926070450.603c5c33.davem@redhat.com>
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

On Fri, Sep 26, 2003 at 07:04:50AM -0700, David S. Miller wrote:
> On Fri, 26 Sep 2003 15:09:48 +0100
> Matthew Wilcox <willy@debian.org> wrote:
> 
> > > You have to find a way to walk all the address spaces to figure out
> > > where the page is mapped.
> > 
> > That's ridiculous.  For a start, pages can't be mapped into multiple
> > address spaces without being in the page cache.
> 
> How in the world can anonymous pages work then?  Of course anonymous
> pages can be in multiple address spaces without being in the page
> cache.

How?  By fork()?  If so, that's not a problem -- the pages stay at the same
address in both processes, and flushing one will flush any inherited pages.
Otherwise you'll have to be more explicit.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
