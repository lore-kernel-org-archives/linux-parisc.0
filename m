Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0F665483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 05:47:41 -0600 (MDT)
Reply-To: <santosh.abraham@hp.com>
From: "Santosh Abraham" <santosha@india.hp.com>
To: "'Matthew Wilcox'" <willy@debian.org>,
	"'David S. Miller'" <davem@redhat.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Fwd:  Problems with raw interface.
Date: Fri, 26 Sep 2003 17:17:34 +0530
Message-ID: <001801c38423$fb443960$e5624c0f@india.hp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20030926112400.GA24824@parcelfarce.linux.theplanet.co.uk>
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

The flush_dcache_page () might be required in cases when the
same user buffer is being used for both reads and writes in an
alternating fashion, right ?

-----Original Message-----
From: willy@www.linux.org.uk [mailto:willy@www.linux.org.uk]On Behalf Of
Matthew Wilcox
Sent: Friday, September 26, 2003 4:54 PM
To: David S. Miller
Cc: Matthew Wilcox; santosh.abraham@hp.com; randolph@tausq.org;
parisc-linux@lists.parisc-linux.org; sct@redhat.com
Subject: Re: [parisc-linux] Fwd: Problems with raw interface.


On Thu, Sep 25, 2003 at 06:08:48PM -0700, David S. Miller wrote:
> On Thu, 25 Sep 2003 15:26:23 +0100
> Matthew Wilcox <willy@debian.org> wrote:
>
> > I think you're right.  flush_dcache_page is for page cache pages, not
for
> > random user addresses.  Would something like this make sense?
>
> The flush_dcache_page() is needed in case the platform has deferred
> the flushing for a kernel cpu store to a page cache page.

But this isn't a page cache page.

> You cannot just delete this call and replace it with a flush_cache_range()
> call, that simply won't work.

--
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead
bodies.
Do you think I want to have an academic debate on this subject?" -- Robert
Fisk
