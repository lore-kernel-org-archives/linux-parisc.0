From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [bug] gcc-4.3 miscompiling causing networking to bugger up
Date: Sat, 31 May 2008 00:10:10 -0400
Message-ID: <20080531041010.GA27970@phobos.i.cabal.ca>
References: <20080528234110.GD30501@phobos.i.cabal.ca> <20080529000059.9C6434E77@hiauly1.hia.nrc.ca> <20080529000219.GE30501@phobos.i.cabal.ca> <119aab440805281707o78b19a65ke45692f67b6f542@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440805281707o78b19a65ke45692f67b6f542@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, May 28, 2008 at 08:07:00PM -0400, Carlos O'Donell wrote:
> On Wed, May 28, 2008 at 8:02 PM, Kyle McMartin <kyle@mcmartin.ca> wrote:
> > I tried 4.4 from svn a few days (more like 2 weeks maybe) ago. Is that
> > recent enough or should I try 4.3-head as well (no problem to do.)
> 
> Yes, please try 4.3-head.
> 

I've found the solution to the bug, it seems something is going wonky
because of ip_fast_csum missing a "memory" clobber.

This should fix it, but I have no idea whether this is a legitimate bug,
or masking a problem with gcc due to too much inlining.

diff --git a/include/asm-parisc/checksum.h b/include/asm-parisc/checksum.h
index cc3ec1b..1916ebe 100644
--- a/include/asm-parisc/checksum.h
+++ b/include/asm-parisc/checksum.h
@@ -65,7 +65,7 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 "2:\n"
 	: "=r" (sum), "=r" (iph), "=r" (ihl)
 	: "1" (iph), "2" (ihl)
-	: "r19", "r20", "r21" );
+	: "r19", "r20", "r21", "memory" );
 
 	return (__force __sum16)sum;
 }
