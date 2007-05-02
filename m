From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] unaligned access using bash on glibc 2.5
Date: Wed, 2 May 2007 14:15:51 -0400 (EDT)
Message-ID: <200705021815.l42IFqYS018776__3060.60149237073$1416624347$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440705021021i35132820we4338ae3ca1862cd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: aurelien@aurel32.net,
 parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440705021021i35132820we4338ae3ca1862cd@mail.gmail.com>
	from "Carlos O'Donell" at May 2, 2007 01:21:28 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > The same is true of the asm.
> 
> You told me that listing r19 as input was problematic. Is this no longer true?

If I said that, it was wrong.  It's never wrong to correctly specify
asm and rtl dependencies.  I think the issue is pic versus non-pic.

> I noticed that the tie_load tgd_load and tld _load patterns in pa.md
> are broken and don't specify a dependency on r19 or r27.
> 
> Would you be able to cook up a possible fix? :-)

They are definitely broken.  I've been very busy lately, and
have a couple of things I should do first.  I'll get to it sometime.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
