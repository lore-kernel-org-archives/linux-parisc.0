From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: still nfs problems [Was: Linux 2.6.37-rc8]
Date: Wed, 5 Jan 2011 12:48:32 -0800
Message-ID: <AANLkTimzzBsdtWcZtP5E_CH1hUZugGMoaHOiMdQJf764@mail.gmail.com>
References: <1294254337.16957.13.camel@mulgrave.site> <AANLkTi=VZUxNFd7n-qwf5aiOeK5rkk8qBmo+kOpgg7up@mail.gmail.com>
 <1294256169.16957.18.camel@mulgrave.site> <20110105200008.GJ8638@n2100.arm.linux.org.uk>
 <1294259637.16957.25.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>,
	Trond Myklebust <Trond.Myklebust@netapp.com>,
	linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	=?ISO-8859-1?Q?Uwe_Kleine=2DK=F6nig?=
	<u.kleine-koenig@pengutronix.de>,
	Marc Kleine-Budde <m.kleine-budde@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Parisc List <linux-parisc@vger.kernel.org>,
	linux-arch@vger.kernel.org
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <1294259637.16957.25.camel@mulgrave.site>
List-ID: <linux-arch.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Jan 5, 2011 at 12:33 PM, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> well, that depends. =A0For us on parisc, kmap of a user page in !HIGH=
MEM
> sets up an inequivalent aliase still ... because the cache colour of =
the
> user and kernel virtual addresses are different. =A0Depending on the
> return path to userspace, we still usually have to flush to get the u=
ser
> to see the changes the kernel has made.

Umm. Again, that has nothing to do with kmap().

This time it's about the user space mapping.

Repeat after me: even without the kmap(), the kernel access to that
mapping would have caused cache aliases.

See? Once more, the kmap() is entirely innocent. You can have a
non-highmem mapping that you never use kmap for, and that you map into
user space, and you'd see exactly the same aliases. Notice? Look ma,
no kmap().

So clearly kmap() is not the issue. The issue continues to be a
totally separate virtual mapping. Whether it's a user mapping or
vm_map_ram() is obviously immaterial - as far as the CPU is concerned,
there is no difference between the two (apart from the trivial
differences of virtual location and permissions).

(You can also force the problem with vmalloc() an then following the
kernel page tables, but I hope nobody does that any more. I suspect
I'm wrong, though, there's probably code that mixes vmalloc and
physical page accesses in various drivers)

                    Linus
