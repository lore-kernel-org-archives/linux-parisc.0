From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Boot failure with 3.0.3: swapper (pid 0): Protection id trap
 (code 7)
Date: Tue, 6 Sep 2011 10:20:25 -0400
Message-ID: <20110906142025.GC25825@bombadil.infradead.org>
References: <201108191958.35802.eike-kernel@sf-tec.de>
 <a53708ae6c6247c7ce45d4e5b8131ea7.squirrel@webmail.sf-mail.de>
 <20110831154820.GH22818@bombadil.infradead.org>
 <20110831160419.GI22818@bombadil.infradead.org>
 <65eae6bb26716d64e7f5959302b26fa9.squirrel@webmail.sf-mail.de>
 <74797e028a4c070f42df834f9b0b0079.squirrel@webmail.sf-mail.de>
 <20110906134611.GA25825@bombadil.infradead.org>
 <20110906140029.GB25825@bombadil.infradead.org>
 <1315318507.6567.2.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1315318507.6567.2.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Sep 06, 2011 at 09:15:07AM -0500, James Bottomley wrote:
> It's possible that one of the flushing patches is to blame; I just can't
> see how.  Most likely is
> 
> commit d7dd2ff11b7fcd425aca5a875983c862d19a67ae
> Author: James Bottomley <James.Bottomley@HansenPartnership.com>
> Date:   Thu Apr 14 18:25:21 2011 -0500
> 
>     [PARISC] only make executable areas executable
> 

This looks promising, the second commit doesn't touch the flush_*_local,
so I think it's probably not a candidate.

Rolf, can you revert d7dd2ff11b7fcd425aca5a875983c862d19a67ae and see
what happens?

Thanks James.

--Kyle

> Least likely:
> 
> commit b7d45818444a31948cfc7849136013a0ea54b2fb
> Author: James Bottomley <James.Bottomley@HansenPartnership.com>
> Date:   Fri Apr 15 12:37:22 2011 -0500
> 
>     [PARISC] prevent speculative re-read on cache flush
> 
> James
> 
> 
> 
> 
