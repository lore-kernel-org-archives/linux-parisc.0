Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id C5911483F
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 May 2003 00:08:57 -0600 (MDT)
Date: Mon, 5 May 2003 08:08:53 +0200
Message-ID: <3EA84287000032CA@ocpmta2.freegates.net>
In-Reply-To: <3EB42B20.1010504@tiscali.be>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Program counter from sigcontext, constructurs and -fPIC
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
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

Hi Carlos,

>
>That said, I suspect more another hw pb (it is not the first time with 
>this b2k model on which hp had already have to replace the cpu) or a bug
>
Definitely it must be a HW pb: I read back the very last pim info that I
grab with minicom I find:
...
Memory/IO Controller Error Analysis Information:

                 Occurs
...
        Runway Addr = 0xc13ff0 f0f000cd0a
...

Even thought this messages seems to be OS independant (PDC only IMHO?), I
will so come back to hpux with the hope that pb re-occurs and that I can
open a HW call neer HP.

Regards,
    Joel

---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
