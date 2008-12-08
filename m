From: Kyle McMartin <kyle@infradead.org>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Mon, 8 Dec 2008 00:15:21 -0500
Message-ID: <20081208051521.GI9092@bombadil.infradead.org>
References: <4932FFB7.4040506@gmx.de> <20081201000013.349294DF8@hiauly1.hia.nrc.ca> <7d01f9f00812010254s3bf845cr8e2b35fe2dedc125@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Helge Deller <deller@gmx.de>, gmsoft@tuxicoman.be,
	carlos@systemhalted.org, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7d01f9f00812010254s3bf845cr8e2b35fe2dedc125@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Dec 01, 2008 at 11:54:25AM +0100, Thibaut VARENE wrote:
> On Tue, Dec 2, 2008 at 1:00 AM, John David Anglin
> <dave@hiauly1.hia.nrc.ca> wrote:
> 
> >
> > Are there some standard 32 and 64 bit defines for format strings?  Or, do we
> > always want 16 hex digits?
> 
> In traps.c we used to do this for the regs dump:
> 
> #ifdef __LP64__
> #define RFMT "%016lx"
> #else
> #define RFMT "%08lx"
> #endif
> 
> and then sprintf(p, " " RFMT, (i+j) == 0 ? 0 : regs->gr[i + j]);
> 
> I guess a similar trick could do, to some extent?

The prettiest way to do it would be to add a %p handler for
resource_size_t args, cheat on the pointing bit, and clean up the
in-tree users of %llx/ull-casts.
