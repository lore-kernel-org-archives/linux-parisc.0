Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 169944829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 May 2003 09:05:09 -0600 (MDT)
Date: Tue, 6 May 2003 17:04:55 +0200
Message-ID: <3EB7766A00000308@ocpmta7.freegates.net>
In-Reply-To: <20030506140425.GF18309@tausq.org>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Oops on 2.4.20-pa33
To: "Randolph Chung" <randolph@tausq.org>
Cc: "Jan-Benedict Glaw" <jbglaw@lug-owl.de>,
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
>is wrong.. just do
>
>> +		if (ka->sa.sa_handler == (void *)SIG_IGN) {
>
>unconditionally. don't put the ifdef's in.
>
That is ok for me (even if I don't understand very well :( ; afaik the previous
code works fine for gcc<=3.1 and do not seems to concern 64bits? )

That said, I will try to prepare a new patch asap.

Joel


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
