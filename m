Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pizda.ninka.net (pizda.ninka.net [216.101.162.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 64870483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 08:18:18 -0600 (MDT)
Date: Fri, 26 Sep 2003 07:04:50 -0700
From: "David S. Miller" <davem@redhat.com>
To: Matthew Wilcox <willy@debian.org>
Cc: willy@debian.org, santosha@india.hp.com, sct@redhat.com,
	santosh.abraham@hp.com, randolph@tausq.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Fwd:  Problems with raw interface.
Message-Id: <20030926070450.603c5c33.davem@redhat.com>
In-Reply-To: <20030926140948.GK24824@parcelfarce.linux.theplanet.co.uk>
References: <20030926053805.63bda07a.davem@redhat.com>
	<200309261311.SAA27414@redsea.india.hp.com>
	<20030926055652.32ddbbc2.davem@redhat.com>
	<20030926132901.GJ24824@parcelfarce.linux.theplanet.co.uk>
	<20030926062143.20d85a72.davem@redhat.com>
	<20030926140948.GK24824@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 26 Sep 2003 15:09:48 +0100
Matthew Wilcox <willy@debian.org> wrote:

> > You have to find a way to walk all the address spaces to figure out
> > where the page is mapped.
> 
> That's ridiculous.  For a start, pages can't be mapped into multiple
> address spaces without being in the page cache.

How in the world can anonymous pages work then?  Of course anonymous
pages can be in multiple address spaces without being in the page
cache.
