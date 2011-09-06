From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Boot failure with 3.0.3: swapper (pid 0): Protection id trap
 (code 7)
Date: Tue, 6 Sep 2011 09:46:11 -0400
Message-ID: <20110906134611.GA25825@bombadil.infradead.org>
References: <201108191958.35802.eike-kernel@sf-tec.de>
 <a53708ae6c6247c7ce45d4e5b8131ea7.squirrel@webmail.sf-mail.de>
 <20110831154820.GH22818@bombadil.infradead.org>
 <20110831160419.GI22818@bombadil.infradead.org>
 <65eae6bb26716d64e7f5959302b26fa9.squirrel@webmail.sf-mail.de>
 <74797e028a4c070f42df834f9b0b0079.squirrel@webmail.sf-mail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <74797e028a4c070f42df834f9b0b0079.squirrel@webmail.sf-mail.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Sep 06, 2011 at 09:40:13AM +0200, Rolf Eike Beer wrote:
> >> I suspect bootmem changes have broken somewhere on 32-bit... try
> >> inserting a few printk between each of the function calls at the start
> >> of paging_init to try to narrow down exactly where it fails.
> >
> > It's flush_cache_all_local() that fails.
> 
> 2.6.39.4 works.
> 

Well... that's weird.

--Kyle
