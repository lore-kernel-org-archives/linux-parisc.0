From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] fix compile failure with non-modular builds
Date: Thu, 11 Sep 2008 12:01:01 -0400
Message-ID: <20080911160101.GA31713@phobos.i.cabal.ca>
References: <1221148575.3330.4.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1221148575.3330.4.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Sep 11, 2008 at 10:56:15AM -0500, James Bottomley wrote:
> commit deac93df26b20cf8438339b5935b5f5643bc30c9
> Author: James Bottomley <James.Bottomley@HansenPartnership.com>
> Date:   Wed Sep 3 20:43:36 2008 -0500
> 
>     lib: Correct printk %pF to work on all architectures
> 
> Broke the non modular builds by moving an essential function into
> modules.c.  Fix this by moving it out again and into asm/sections.h as
> an inline.
> 
> Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>

Ack. Want to just fire it off to the big penguin, or should I submit it
with the unwind fix in the meantime?

r, Kyle
