Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2EE3A4841
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Nov 2003 02:47:39 -0700 (MST)
Date: Mon, 10 Nov 2003 10:47:33 +0100
Message-ID: <3F969FFE00009D22@ocpmta2.freegates.net>
In-Reply-To: <200311100525.hAA5Pg2V002251@hiauly1.hia.nrc.ca>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] fdisk problems 2.4 <-> 2.6
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>, tausq@debian.org
Cc: grundler@parisc-linux.org, willy@debian.org,
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

Dave,

Thanks a lot you explain all better I while I was trying to find a sleep
(too coffee even if not java :) ).

Just to remaind the following of the tread that Grant mentioned before:
<http://lists.parisc-linux.org/pipermail/parisc-linux/2002-November/018443.html>

>  I think it would be if the mode/type for the input/output was specified
> correctly.  This can be done with a cast in the asm.

Yes, that is why I need cast in this case.

That says, obviously I just had enough time to test it with success before
submit it :)

Finaly, for the history, before 'BLKGETSIZE64' was used in evms and xfs,
I tried to write it as a macro because there was (as there are still) macro
for 32bit world on a pa1.1 and also for 64bits on pa2.0 and so I would like
to continue the same style :)

Thanks again to all for your attention,
    Joel

-------------------------------------------------------------------------
Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.

http://reg.tiscali.be/default.asp?lg=fr
