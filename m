Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C88D4840
	for <parisc-linux@parisc-linux.org>; Thu, 27 Nov 2003 11:38:16 -0700 (MST)
Date: Thu, 27 Nov 2003 19:38:12 +0100
Message-ID: <3FB265EC000096CB@ocpmta3.freegates.net>
In-Reply-To: <20031126181935.GJ27674@systemhalted>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] gcc-3.3.2 - 64bit failled to build?
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: parisc-linux@parisc-linux.org
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

> You need the userspace headers for 64-bits. They don't exist
> so I normally hack them into place. Please try to use Kegel's crosstools
and
> see if you can get them building our cross-compiler? :)

Well I grab it from his site (http://www.kegel.com/crosstool/)

Don't have time to have more look but at first glance it didn't suport yet
hppa (so I will have to see more if there are patches; may be this week-end
;) )

>If you want a quick fix, grab a current debian libc6-dev package, unpack
>it using -x and move the /usr/include directory to your
>$PREFIX/hppa64-linux directory so that the target headers are there.

Sorry no time today but the package is already installed on the system, so
I could just find supplied include files and link it into '$PREFIX/hppa64-linux'?

Thanks,
    Joel

-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
