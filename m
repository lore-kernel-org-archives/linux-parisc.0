From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Boot failure with 3.0.3: swapper (pid 0): Protection id trap
 (code 7)
Date: Tue, 06 Sep 2011 09:15:07 -0500
Message-ID: <1315318507.6567.2.camel@dabdike.int.hansenpartnership.com>
References: <201108191958.35802.eike-kernel@sf-tec.de>
	 <a53708ae6c6247c7ce45d4e5b8131ea7.squirrel@webmail.sf-mail.de>
	 <20110831154820.GH22818@bombadil.infradead.org>
	 <20110831160419.GI22818@bombadil.infradead.org>
	 <65eae6bb26716d64e7f5959302b26fa9.squirrel@webmail.sf-mail.de>
	 <74797e028a4c070f42df834f9b0b0079.squirrel@webmail.sf-mail.de>
	 <20110906134611.GA25825@bombadil.infradead.org>
	 <20110906140029.GB25825@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110906140029.GB25825@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2011-09-06 at 10:00 -0400, Kyle McMartin wrote:
> On Tue, Sep 06, 2011 at 09:46:11AM -0400, Kyle McMartin wrote:
> > > >> I suspect bootmem changes have broken somewhere on 32-bit... try
> > > >> inserting a few printk between each of the function calls at the start
> > > >> of paging_init to try to narrow down exactly where it fails.
> > > >
> > > > It's flush_cache_all_local() that fails.
> > > 
> > > 2.6.39.4 works.
> > > 
> > 
> > Well... that's weird.
> > 
>    0:	43 ff ff 40 	ldb 7fa0(r31),r31
> 
> Is the faulting insn, and %r31 is 00000000... so
> we're looking at 32672, which looks suspiciously like
> a negative offset from 32768.
> 
> Looks like it's a null pointer dereference, there shouldn't be anything
> useful at this address, if I remember our address space map correctly.

It's possible that one of the flushing patches is to blame; I just can't
see how.  Most likely is

commit d7dd2ff11b7fcd425aca5a875983c862d19a67ae
Author: James Bottomley <James.Bottomley@HansenPartnership.com>
Date:   Thu Apr 14 18:25:21 2011 -0500

    [PARISC] only make executable areas executable

Least likely:

commit b7d45818444a31948cfc7849136013a0ea54b2fb
Author: James Bottomley <James.Bottomley@HansenPartnership.com>
Date:   Fri Apr 15 12:37:22 2011 -0500

    [PARISC] prevent speculative re-read on cache flush

James



