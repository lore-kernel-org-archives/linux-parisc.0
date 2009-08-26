From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: unaligned accesses in apply_relocate_add
Date: Wed, 26 Aug 2009 09:17:49 -0400
Message-ID: <20090826131749.GE19494@bombadil.infradead.org>
References: <4A94F439.6010301@stromasys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Artem Alimarine <artem.alimarine@stromasys.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A94F439.6010301@stromasys.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Aug 26, 2009 at 10:37:13AM +0200, Artem Alimarine wrote:
> Hi guys,
>
> I see unaligned access happening in apply_relocate_add. Is this normal  
> expected behavior?
>
> Kernel 2.6.26.2, single CPU (Standard Debian 5.0.2). Address 0x4011f968.
>

No, definitely not. relocations are applied to instructions, which
should always be instruction-width (4 bytes) aligned... Since we do
modify-replace on placeholders, it should never be using anything other
than a store-word to do it... do you have any more data on this?

regards, Kyle
