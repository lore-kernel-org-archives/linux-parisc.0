From: Helge Deller <deller@gmx.de>
Subject: Re: resource_size_t printk woes...
Date: Thu, 01 Jan 2009 18:32:16 +0100
Message-ID: <495CFE20.2000702@gmx.de>
References: <20090101171442.5BF174EDA@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: kyle@infradead.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090101171442.5BF174EDA@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
> Hi Helge,
> 
> I just want to say that I like Kyle's approach.  There already exists
> the 'R' modifier for %p.  This outputs a pair of resource_size_t values.
> We just need a modifier to handle the printing of the start value in
> a manner similar to that for the 'R' modifier.  So, I think this issue
> needs another go around.

Sadly none of the approaches is really nice, as with Kyle's approach we'd
loose the type-checking of printk.
But yes, maybe that's the best choice of all bad ones.
Will you try/come up with a patch to vsprintf.c?

Helge
