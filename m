Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (unknown [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8DEF64839
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 May 2003 00:31:03 -0600 (MDT)
Date: Wed, 21 May 2003 08:30:59 +0200
Message-ID: <3EC76170000016C4@ocpmta1.freegates.net>
In-Reply-To: <20030521020908.GE10485@systemhalted>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] 2.4 and semtimedop - need kernel compat?
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: "Matthew Wilcox" <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
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

>
>> In the very last Andrea's patch 2.4.21rc2aa1.bz2, I read that Andrea already
>> back port this stuff :)
>> 
>> At a first glance, the job is also applied for hppa. Would you like that
>> I have a look to see if it is applicable with your patch in p-l cvs tree?
>
>Seeing as how our glibc 2.3.2 is highly unstable and non-functional, it
>won't help very much :(
>
>It should be easy enough to connect our syscall to semtimedop when the
>code is backported.
>
Ok

J.

---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
