From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH] parisc: report inequivalent aliases only for writeable
 mappings
Date: Wed, 22 Jan 2014 15:39:44 -0500 (EST)
Message-ID: <alpine.LRH.2.02.1401221535290.25455@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1401221402190.12739@file01.intranet.prod.int.rdu2.redhat.com> <1390418695.2372.86.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: John David Anglin <dave.anglin@bell.net>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1390418695.2372.86.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Wed, 22 Jan 2014, James Bottomley wrote:

> On Wed, 2014-01-22 at 14:11 -0500, Mikulas Patocka wrote:
> [no comment on the merits of the patch, just the wording of the change
> log]
> > This patch changes it so that INEQUIVALENT ALIASES are only reported for
> > writeable mappings. PA-RISC specification allows inequivalent aliases for
> > read-only mappings, so there's no need to report them as an error.
> 
> No, it doesn't.  The spec says no inequivalent aliases at all for
> certain types of CPU (that was the cause of the inability to boot on the
> CPU with the combined PIPT/VIPT cache) ... we believe we skirted the
> requirements with some judicious flushing but we can't say it was
> supported by the docs.
> 
> James

A citation from Parisc 2.0 specification, Appendix F, section Address 
Aliasing:

"Software is allowed to have any number of read-only non-equivalently 
aliased translations to a physical page, as long as there are no other 
translations to the page. This is referred to as read-only non-equivalent 
aliasing."

Mikulas
