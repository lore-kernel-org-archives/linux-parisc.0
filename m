Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sisko.scot.redhat.com (82-41-9-220.cable.ubr02.edin.blueyonder.co.uk [82.41.9.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id 268B4483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 08:30:47 -0600 (MDT)
Subject: Re: [parisc-linux] Fwd:  Problems with raw interface.
From: "Stephen C. Tweedie" <sct@redhat.com>
To: Matthew Wilcox <willy@debian.org>
Cc: "David S. Miller" <davem@redhat.com>, santosha@india.hp.com,
	santosh.abraham@hp.com, randolph@tausq.org,
	parisc-linux@lists.parisc-linux.org, Stephen Tweedie <sct@redhat.com>
In-Reply-To: <20030926140948.GK24824@parcelfarce.linux.theplanet.co.uk>
References: <20030926053805.63bda07a.davem@redhat.com>
	 <200309261311.SAA27414@redsea.india.hp.com>
	 <20030926055652.32ddbbc2.davem@redhat.com>
	 <20030926132901.GJ24824@parcelfarce.linux.theplanet.co.uk>
	 <20030926062143.20d85a72.davem@redhat.com>
	 <20030926140948.GK24824@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Message-Id: <1064586395.4227.154.camel@sisko.scot.redhat.com>
Mime-Version: 1.0
Date: 26 Sep 2003 15:26:36 +0100
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

On Fri, 2003-09-26 at 15:09, Matthew Wilcox wrote:

> That's ridiculous.  For a start, pages can't be mapped into multiple
> address spaces without being in the page cache.

fork().  At least we know the pages aren't dirty or writable in that
case, though.  But because of sys_mremap(), we don't know the VA for all
possible mappings, and the pages are _not_ necessarily in the page
cache.

There's only one place where anon pages get into the page cache, and
that's via swap cache.  Note that we don't have to worry about
kernel-context access to such pages: the contents are only ever seen
from user-space process context.  The fork case still means there are
multiple such referencing contexts, though.

--Stephen
