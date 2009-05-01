From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] fix ldcw inline assembler
Date: Fri, 1 May 2009 18:39:40 -0400
Message-ID: <20090501223940.GA10501@bombadil.infradead.org>
References: <49FA1AA1.3060104@gmx.de> <119aab440905011118lbc3bcectfd5862477c2598a8@mail.gmail.com> <20090501213717.GA19522@hiauly1.hia.nrc.ca> <20090501214632.GD18899@bombadil.infradead.org> <1241215392.3302.43.camel@mulgrave.int.hansenpartnership.com> <20090501222540.GE18899@bombadil.infradead.org> <1241217374.3302.50.camel@mulgrave.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Carlos O'Donell <carlos@systemhalted.org>,
	Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Thibaut VARENE <varenet@debian.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1241217374.3302.50.camel@mulgrave.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, May 01, 2009 at 05:36:14PM -0500, James Bottomley wrote:
> 
> OK, now I'm confused.  Barriers are used to inform the compiler about
> interlocks it isn't aware of (like when an asm changes a variable).  The
> ldcw and the *a both mention a which is sufficient an interlock for the
> compiler to get it right without any barrier.
> 
> Added to which, *a is declared volatile, which is enough of a cautionary
> note to make the compiler behave in a very straightforward fashion.
> 

I guess... I don't understand the gcc clobber semantics on asm()
anymore, I'm just thinking of that stupid bug with ip_fast_csum we saw
on parisc a few years ago...

Don't mind me.

--Kyle
