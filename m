Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 604784845
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Dec 2003 03:43:21 -0700 (MST)
Date: Thu, 4 Dec 2003 11:38:12 +0100
Message-ID: <3FB25B960000DB0D@ocpmta1.freegates.net>
In-Reply-To: <20031204102038.GL16507@lug-owl.de>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 2.4.23 some tested backport (pgalloc.h)
To: "Jan-Benedict Glaw" <jbglaw@lug-owl.de>,
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

Yes, sorry that is a webmail interface pb which I already mentionned to my
ISP helpdesk but they couldn't help?

That is also why I also attatched the patch to help maintainers to apply
it :)

Appologies,
    Joel

>-- Original Message --
>From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
>To: parisc-linux@lists.parisc-linux.org
>Date: Thu, 4 Dec 2003 11:20:39 +0100
>Subject: Re: [parisc-linux] 2.4.23 some tested backport (pgalloc.h)
>
>
>On Thu, 2003-12-04 10:56:08 +0100, Joel Soete <soete.joel@tiscali.be>
wrote in message <3FB25B960000DA45@ocpmta1.freegates.net>:

> --- linux-2.4.23-pa1/include/asm-parisc/pgalloc.h	2003-03-10 08:02:19.000000000
> +0100
> +++ linux-2.4.23-rc5-pa17
>include/asm-parisc/pgalloc.h	2003-12-04 11:06:31.000000000
> +0100
> @@ -124,8 +124,9 @@

Your email client horribly mudged this...

MfG, JBG

-- 
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  ei
>em Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier Bürger" | im Internet! |   im Irak!
   ret = do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA));

>
>Attachment: signature.asc
>


-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
