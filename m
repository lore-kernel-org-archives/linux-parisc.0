Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id C11C04829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 May 2003 11:34:01 -0600 (MDT)
Date: Tue, 6 May 2003 19:33:28 +0200
Message-ID: <3EB7766A000003D3@ocpmta7.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Oops on 2.4.20-pa33
To: "Randolph Chung" <tausq@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
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

>> That is ok for me (even if I don't understand very well :( ; afaik the
>previous
>> code works fine for gcc<=3.1 and do not seems to concern 64bits? )
>
>The point is that if the new code is always correct, then littering
>the code with #ifdef's makes the code hard to read and maintain. If
>you really need to make the code different for the two cases, it's
>better to conditionally define a function/macro in a single place
>(header file) and use that in the source, rather than having ifdef's
>in many places.
>
>HTH,

Very clear now, but not easy to implement:
- which name to give to such a macro
- where to implement it:
    the temptation to change the definition of SIG_IGN and SIG_DFL in asm-parisc/signal.h
is great but it will solve comparison pb but will broken variable affectation.
    So may be better to define something like:
#define CMP_SIG( (x), (cmp), (y) ( (x) (cmp) (void*)(y) )

(but care have to be taken to always place SIG_... at the right (y) place?)

then change all occurences of SIG_... comparison??

There must be better idea else where but I ignore it :(
Also suggestion is welcome.

Thanks again,
    Joel



---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
