Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id D7D66483F
	for <parisc-linux@lists.parisc-linux.org>; Fri, 29 Aug 2003 01:28:47 -0600 (MDT)
Date: Fri, 29 Aug 2003 09:27:27 +0200
Message-ID: <3F4D78B00000007F@ocpmta3.freegates.net>
In-Reply-To: <012d01c36d82$40d6c960$f463f40f@jh733133>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] Re: [parisc-linux-cvs] linux carlos
To: "Jim Hull" <jim.hull@hp.com>, parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Jim,

Well come :)
> I haven't really been following this thread, so I don't know what
>problem you're actually trying to solve, but I'd like to point out a few
>aspects of the PA-RISC processor architecture.
>
To be short, the pa linux kernel boot well on A model as SMP (Multiprocessor
mode) but panic on L/N model. And a pb in tlb management is suspected.

>Comments mixed with the original text, below.
>
> -- Jim
>   
>> HP Itanium/PA-RISC Processor Architect

>If you use fdc, fic, or pdc, then they are broadcast to other
>processors, but fdce and fice are not.

Thanks I will check if such a code is used.

>While you can use ldda and stda to access memory using absolute
>(physical) addresses instead of virtual, these instructions do *not*
>bypass the cache.  And because PA processors use virtually-indexed
>caches, the rules for mixing virtual and absolute accesses, and have
>them all remain cache-coherent, are complicated.  If you really need to
>do this, then you'll have to read and understand all of Appendix F, "TLB
>and Cache Control", in the PA-RISC 2.0 Architecture manual (the "Kane"
>book).

Yes, very accurate reference, but imo it is not a course on PA-RISC asm (I
mean, as a beginner, as i am, would like to find with some trial example
showing what is good and trivial errors to not commit).

Thanks for your clear comments,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL, seulement 35 eur/mois et le modem est inclus...abonnez-vous!
http://reg.tiscali.be/default.asp?lg=fr 
