Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7A9A84840
	for <parisc-linux@parisc-linux.org>; Wed, 26 Nov 2003 11:52:01 -0700 (MST)
Date: Wed, 26 Nov 2003 18:51:57 +0000
Message-ID: <3FB25B9600008F91@ocpmta1.freegates.net>
In-Reply-To: <20031126154213.GO975@tausq.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] gcc-3.3.2 - 64bit failled to build?
To: "Randolph Chung" <randolph@tausq.org>
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

>try this:
>../gcc-3.3/configure --host=hppa-linux --build=hppa-linux --target=hppa64-linux

> --disable-shared --disable-nls --enable-languages=c --prefix=/opt/palinux

> --enable-sjlj-exceptions --disable-threads

Well I test it first and as mentionned to Carlos it allow me to obtain a
kernel 2.4.23-rc5-pa17 64 bits (not yet test your last patch sorry) which
boot fine on my b2k :))

Many thanks,
    Joel

PS: Next step, see i can boot 2.6.0-test10-pa1 64bit on the N4K (b2k still
have a pb iirc)

-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
