From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 1/2] module.c: fix module loading failure of large	modules
 (take 2)
Date: Tue, 30 Dec 2008 19:18:23 +0100
Message-ID: <495A65EF.5050406@gmx.de>
References: <4959346E.7060600@gmx.de> <49593660.2010900@gmx.de> <20081230180724.GA15235@bombadil.infradead.org> <20081230181032.GB15235@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Randolph Chung <randolph@tausq.org>,
	Linus <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	rusty@rustcorp.com.au
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081230181032.GB15235@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Kyle McMartin wrote:
> Ugh, I fail at typing, resending for rusty's benefit.
> 
> On Tue, Dec 30, 2008 at 01:07:24PM -0500, Kyle McMartin wrote:
>> [Adding rusty to CC]
>>
>> On Mon, Dec 29, 2008 at 09:43:12PM +0100, Helge Deller wrote:
>>> +unsigned long module_additional_section_size(struct module *mod,
>>> +					     unsigned int section);
>>> +
>> I think this would be more palatable as
>>
>> #ifdef HAVE_MODULE_SECTION_STUBS
>> unsigned long module_additional_section_size(struct module *mod,
>> 	unsigned int section);
>> #else
>> static inline unsigned long module_additional_section_size(struct module *mod,
>> 	unsigned int section)
>> {
>> 	return 0;
>> }
>> #endif
>>
>> and removing the conditional in kernel/module.c, possibly the symbol
>> should be "arch_module_a..." just to make it clear to anyone reading.
>>
>> Anyway, it's up to rusty.
>>
>> Rusty, we'd like to get this patch in, so I can merge the dependent
>> parisc-specific patch.

Rusty, I think I've a cleaner patch for that and will send it soon...

Helge
