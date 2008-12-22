From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Mon, 22 Dec 2008 17:46:55 -0500
Message-ID: <20081222224655.GD30144@bombadil.infradead.org>
References: <20081221172742.C1BB54E99@hiauly1.hia.nrc.ca> <494EC89A.9000802@gmx.de> <1229985816.3345.43.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	kyle@infradead.org, linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1229985816.3345.43.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Dec 22, 2008 at 04:43:36PM -0600, James Bottomley wrote:
> Actually, it should bug more often.  This function:
> flush_user_cache_page_non_current() is very rarely called (which is
> hopefully why you don't see an increase in bugs).  However, this is a
> kernel function ... if you call load_context() here, you'll get the user
> protection IDs in the register and it will immediately fault when it
> returns to the kernel.  All it should be doing (which is what it
> currently does) is to set up sr3 to allow the kernel to poke into a user
> address space, which is the design of the function.
> 

Well, it will work by accident, since the other 3 (or 7) prot id
registers will still be zeroed, since we only ever touch %cr8...
