Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 711014840
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Dec 2003 09:42:30 -0700 (MST)
Date: Tue, 2 Dec 2003 17:42:23 +0100
Message-ID: <3FB265250000C0DA@ocpmta2.freegates.net>
In-Reply-To: <200312011830.hB1IU7in003367@hiauly1.hia.nrc.ca>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [RFC] rewrite kernel spinlock code to work better with gcc
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, parisc-linux@lists.parisc-linux.org
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

Hi Dave,

I trust that I have to restart my test (32b smp, 64b smp; all seems to works
fine in 32b but some worries in 64b). With the new 2.4.23-pa1, I discover
that I let badly commented a small chunk a code (just involved toc) and I
wrongly merge Randolph's patch (just about a small #ifdef CONFIG_PA20 in
2.4: thanks for your comments :) ).

I will advise.

Thanks again,
    Joel

>-- Original Message --
>To: soete.joel@tiscali.be (Joel Soete)
>Date: Mon, 1 Dec 2003 13:30:07 -0500 (EST)
>From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
>Cc: randolph@tausq.org, parisc-linux@lists.parisc-linux.org
>Subject: Re: [parisc-linux] [RFC] rewrite kernel spinlock code to work better
>with gcc
>
>
>> (Just in case it would help) I backport your patch in 2.4 (just because
the
> only system on which I can test it is a b2k on which 2.6 doesn't boot yet)
> and build a smp 64bit kernel which boot and run fine (rebuild another kernel)
> on this b2k:
>

I'd forgotten about the "ldcw,co" errata for PA 2.0.  You only want/need
self-aligning locks for PA 1.x.  You should be able to test this on a
PA 2.0 machine if you don't define CONFIG_PA20.

Dave
-- 
J. David Anglin                          
>       dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)



-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
