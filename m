From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Yet another ccio fix idea?
Date: Wed, 12 Mar 2008 15:52:16 -0400 (EDT)
Message-ID: <20080312195217.9CBF84E4F@hiauly1.hia.nrc.ca>
References: <20080312125104.AE1C54E4F@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@HansenPartnership.com, rubisher@scarlet.be,
	soete.joel@scarlet.be, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org, kyle@parisc-linux.org, matthew@wil.cx
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080312125104.AE1C54E4F@hiauly1.hia.nrc.ca> from "John David Anglin" at Mar 12, 2008 08:51:03 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> In this situation, the alignment of pdir's depends on how they
> were originally declared.  If declared as long long, GCC will give
> them 8 byte alignment, so the two words should always be in the
> same cache line.  On the otherhand, if the pdir is declared as
> a pair of 32-bit words, the pdir might span two cache lines.

It looks to me like pdirs should be 8 byte aligned and thus always
should lie in a cache line.

The following insn appears to put hints in the wrong place on
a 64-bit kernel since `pa' is then a 64-bit type:

        asm volatile("depw  %1,31,12,%0" : "+r" (pa) : "r" (hints));

The depw will operate on the left word.  Looks like it should be

        asm volatile("depw  %1,31,12,%R0" : "+r" (pa) : "r" (hints));

when __LP64__ is defined.  Think the same is true for the following
depw as well.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
