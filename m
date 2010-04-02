From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Thu, 01 Apr 2010 23:30:25 -0400
Message-ID: <1270179025.18981.19.camel@mulgrave.site>
References: <4BA43CE5.4020807@fsij.org> <87hbo4ek8l.fsf@thialfi.karme.de>
	 <4BB18B46.2070203@fsij.org> <4BB53D26.60601@fsij.org>
	 <4BB5594C.8050505@fsij.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org,
	pkg-gauche-devel@lists.alioth.debian.org, 561203@bugs.debian.org
To: NIIBE Yutaka <gniibe@fsij.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BB5594C.8050505@fsij.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2010-04-02 at 11:41 +0900, NIIBE Yutaka wrote:
> (9) Process B does read-access on memory, which gets *NEW* data in
>     cache (if process space identifier color is same).
>     Process B does write-access on memory which causes memory fault,
>     as it's COW memory.
> 
>     Note: Process B sees *NEW* data because it's VIPT-WB cache.
>     It shares same memory in this situation.

So I think the bug here is that you're confusing aliasing with SMP cache
coherence.  In an alias situation, the same physical line is mapped to
multiple lines in a processor's cache (at different virtual addresses),
which means you can get a different answer depending on which alias you
read.

In COW breaking, the page table entry is copied, so A and B no longer
have page table entries at the same physical location.  If the COW is
intact, A and B have the same physical page, but it's also accessed by
the same virtual address, hence no aliasing.

In an SMP incoherent system, A and B could get different results (if on
different CPUs) because the write protect is in the cache of A but not
B.  However, PA is SMP coherent, so the act of B reading a line which is
dirty in A's cache causes a flush before the read completes via the
cache chequerboard logic and B ends up reading the same value A would
have read.

James


