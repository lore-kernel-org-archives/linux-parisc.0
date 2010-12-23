From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: parisc: flush pages through tmpalias space
Date: Wed, 22 Dec 2010 19:07:12 -0500
Message-ID: <AANLkTimoaw7HAqJTjejHf52Qw0zdtGJZK6bWbzgfLLU6@mail.gmail.com>
References: <1293034931.3019.8.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1293034931.3019.8.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 22, 2010 at 11:22 AM, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> The kernel has an 8M tmpailas space (originally designed for copying
> and clearing pages but now only used for clearing). =A0The idea is
> to place zeros into the cache above a physical page rather than into
> the physical page and flush the cache, because often the zeros end up
> being replaced quickly anyway.
>
> We can also use the tmpalias space for flushing a page. =A0The differ=
ence
> here is that we have to do tmpalias processing in the non access data=
 and
> instruction traps. =A0The principle is the same: as long as we know t=
he physical
> address and have a virtual address congruent to the real one, the flu=
sh will
> be effective.
>
> In order to use the tmpalias space, the icache miss path has to be en=
hanced to
> check for the alias region to make the fic instruction effective.

James,

Given that you are currently maintaining the parisc tree, do you have
a public branch that we can pull from to test things?

I've normally been using:
git://git.kernel.org/pub/scm/linux/kernel/git/kyle/parisc-2.6.git

I would like to test this patch, and the next one you posted, and I
was wondering if you have them on a public branch.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
