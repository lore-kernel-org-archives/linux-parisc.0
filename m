From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Sun, 21 Dec 2008 16:33:03 -0500
Message-ID: <20081221213303.GE12880@bombadil.infradead.org>
References: <20081221152017.102C84F19@hiauly1.hia.nrc.ca> <20081221172742.C1BB54E99@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@infradead.org, deller@gmx.de, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081221172742.C1BB54E99@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Dec 21, 2008 at 12:27:42PM -0500, John David Anglin wrote:
> > I think the bug may be in flush_user_cache_page_non_current.  It hijacks
> > sr3 temporarily and I don't think cr8 is updated when this is done.  The
> > switch may need to be atomic.
> 
> The following might fix the protection ID bug.
> 

I'm not convinced... this doesn't explain why we don't see this on
64-bit...
