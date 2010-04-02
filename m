From: NIIBE Yutaka <gniibe@fsij.org>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Fri, 02 Apr 2010 12:48:11 +0900
Message-ID: <4BB568FB.1090908@fsij.org>
References: <4BA43CE5.4020807@fsij.org> <87hbo4ek8l.fsf@thialfi.karme.de>	 <4BB18B46.2070203@fsij.org> <4BB53D26.60601@fsij.org>	 <4BB5594C.8050505@fsij.org> <1270179025.18981.19.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org,
	pkg-gauche-devel@lists.alioth.debian.org, 561203@bugs.debian.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1270179025.18981.19.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Thanks for your quick reply.

James Bottomley wrote:
> In COW breaking, the page table entry is copied, so A and B no longer
> have page table entries at the same physical location.  If the COW is
> intact, A and B have the same physical page, but it's also accessed by
> the same virtual address, hence no aliasing.

Let me explain more.

In the scenario, I assume:

	No aliasing between A and B.
	We have aliasing between kernel access and user access.

Before COW breaking A and B share same data (with no aliasing same
space identifier color), and B sees data in cache, while memory has
stale data.

At COW breaking, kernel copies the memory, it doesn't see new data
in cache because of aliasing.

Isn't it possible?
-- 
