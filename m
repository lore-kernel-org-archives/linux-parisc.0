From: Helge Deller <deller@gmx.de>
Subject: Re: self-assignment in dino_card_setup
Date: Tue, 29 Dec 2015 21:22:35 +0100
Message-ID: <5682EB8B.30308@gmx.de>
References: <87k2nx3tuz.fsf@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: linux-parisc@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <87k2nx3tuz.fsf@rasmusvillemoes.dk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Rasmus,

On 29.12.2015 21:03, Rasmus Villemoes wrote:
> Line 474 of drivers/parisc/dino.c reads
> 
>         res->name = dino_dev->hba.lmmio_space.name;
> 
> but res is &dino_dev->hba.lmmio_space, so this seems to just assign NULL
> again to res->name. Presumably the allocation of <= 128 bytes never
> fails, but I wonder what the purpose was, and if the confusing else
> branch couldn't just be deleted (and then one should just do res->name =
> kmemdup(name, size+1, GFP_KERNEL); and delete the if as well).

I'd suggest to just delete the else branch.
Do you want to send a patch with signed-off ?

Helge

