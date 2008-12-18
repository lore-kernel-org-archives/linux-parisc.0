From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Thu, 18 Dec 2008 13:28:25 -0500
Message-ID: <20081218182825.GA1827@bombadil.infradead.org>
References: <20081218004329.GB30438@bombadil.infradead.org> <20081218030214.5CABB4E99@hiauly1.hia.nrc.ca> <20081218040400.GE30438@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081218040400.GE30438@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 17, 2008 at 11:04:00PM -0500, Kyle McMartin wrote:
> > There might be a problem restoring access IDs after a cache purge or
> > TLB insertion.
> > 
> 
> I honestly have no idea how the protection id registers are loaded... I
> thought it had something do with with space registers, but I can't
> remember off the top of my head.

For future reference, in mmu_context.h. Bloody tricky mtctl() macro
doesn't take a prefix, just the numeric cr #.
