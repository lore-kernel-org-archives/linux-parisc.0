Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 792894829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Mar 2003 11:07:09 -0700 (MST)
Date: Tue, 18 Mar 2003 19:07:02 +0100
Message-ID: <3E68A396000020CC@ocpmta7.freegates.net>
In-Reply-To: <200303181743.h2IHhtaI010636@hiauly1.hia.nrc.ca>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] squid pb with glibc-2.3.1 and pthread (pb reproduced now)
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
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

>> I presume that this patch is not yet into libc6_2.3.1-15 dpkg (I also
run
>> the test case with the same pb on an unstable debian running on b2k);
so
>> my question is: does it exist somewhere a patch against this dpkg src
which
>> I can test?
>
>I just checked.  The patch is in -15.  It wasn't in -14.  I haven't tried
>-15.
>
So it doesn't yet help here. Never the less I think that I reach to produce
enough simple material which Carlos could analyse (in its time) :)

Thanks a lot,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
