From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: self-assignment in dino_card_setup
Date: Tue, 29 Dec 2015 12:51:54 -0800
Message-ID: <1451422314.2346.6.camel@HansenPartnership.com>
References: <87k2nx3tuz.fsf@rasmusvillemoes.dk> <5682EB8B.30308@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5682EB8B.30308@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2015-12-29 at 21:22 +0100, Helge Deller wrote:
> Hi Rasmus,
> 
> On 29.12.2015 21:03, Rasmus Villemoes wrote:
> > Line 474 of drivers/parisc/dino.c reads
> > 
> >         res->name = dino_dev->hba.lmmio_space.name;
> > 
> > but res is &dino_dev->hba.lmmio_space, so this seems to just assign
> > NULL
> > again to res->name. Presumably the allocation of <= 128 bytes never
> > fails, but I wonder what the purpose was, and if the confusing else
> > branch couldn't just be deleted (and then one should just do res
> > ->name =
> > kmemdup(name, size+1, GFP_KERNEL); and delete the if as well).
> 
> I'd suggest to just delete the else branch.
> Do you want to send a patch with signed-off ?

Actually, I'd guess the intention was to put back whatever the contents
of lmmio_space.name originally was ... it's usually some default static
string.

James


