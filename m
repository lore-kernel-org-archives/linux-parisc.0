From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Yet another ccio fix idea?
Date: Wed, 12 Mar 2008 08:51:03 -0400 (EDT)
Message-ID: <20080312125104.AE1C54E4F@hiauly1.hia.nrc.ca>
References: <1205322442.2941.104.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: rubisher@scarlet.be, soete.joel@scarlet.be,
	grundler@parisc-linux.org, linux-parisc@vger.kernel.org,
	kyle@parisc-linux.org, matthew@wil.cx
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1205322442.2941.104.camel@localhost.localdomain> from "James Bottomley" at Mar 12, 2008 07:47:22 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> However, since it's contained in a u64 pointer, it must reasonably be on
> an 8 byte boundary (or be triggering an unaligned poiner error) and
> therefore shouldn't span multiple cache lines anyway.

It's not a hard rule that u64 objects be aligned on an 8 byte
boundary as the PA 1.x architecture doesn't have 64-bit integer
loads and stores.  A u64 object has to be loaded with two
32-bit loads and lives in a pair of 32-bit registers.  As a 
result, an unaligned u64 object will only trigger an unaligned
pointer error if it is not aligned on a 4 byte boundary.

However in GCC, we force u64 alignment (except in packed structs)
to a 8 byte boundary.  This allows casting pointers between long
longs and doubles.  It also simplifies the GCC backend as otherwise
special treatment would be needed for long longs.  There's been some
discussion of this for x86 recently.

In this situation, the alignment of pdir's depends on how they
were originally declared.  If declared as long long, GCC will give
them 8 byte alignment, so the two words should always be in the
same cache line.  On the otherhand, if the pdir is declared as
a pair of 32-bit words, the pdir might span two cache lines.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
