Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id C97B34840
	for <parisc-linux@parisc-linux.org>; Wed, 26 Nov 2003 11:46:40 -0700 (MST)
Date: Wed, 26 Nov 2003 18:46:37 +0000
Message-ID: <3FB25B9600008F85@ocpmta1.freegates.net>
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

[...]

>You need the userspace headers for 64-bits. They don't exist so I
>normally hack them into place. Please try to use Kegel's crosstools and

The first time I hear about do you have more ref (an url) or I will googelize
it tomorrow :)

>see if you can get them building our cross-compiler? :)
>
>If you want a quick fix, grab a current debian libc6-dev package, unpack
>it using -x and move the /usr/include d
>rectory to your
>$PREFIX/hppa64-linux directory so that the target headers are there.

That is easiest, I will also check it.

Thanks,
    Joel

PS: Randolph tips works also, I obtain a hppa64-linux-gcc (3.3.2-ds5) which
allow me  to obtain a kernel 2.4.23-rc5-pa17 64bit which boot fine on my
b2k :)

-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
