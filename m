Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8A37F4840
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  4 Feb 2004 06:40:31 -0700 (MST)
Date: Wed, 4 Feb 2004 14:39:58 +0100
Message-ID: <400CB8A10000CC1F@ocpmta3.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] Kernel driver/feature support
To: "M. Grabert" <xam@cs.ucc.ie>, parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Max,

>I'd be interested if somebody else has success (or failure) reports of
>drivers/fs not listed here, and reports from what's working with 2.6
>(since I can't test it here)

what was also working for me (I tested intensively on 2.4 only, not yet on
2.6):
- lvm (1 and now 2 aka devmapper)
- evms (tested till 1.2)
- jfs (tested till 1.0.23)
- xfs (tested till some cvs a bit outdated of Oct 2002 :( )
- ppp (still operational over a simple pstn and a 38000 bauds modem :) )

what failled to me:
- a hp 8port serial mux (afaik an Equinox product) even though that actualy
works fine plug in a hp i386 (and used as some kind console concentrator
for parisc boxes :) )
- an aty graphic card (in fact I don't know the actual status of this card,
should be broken :( )
- Tachion FC (driver should be re-write according its maintainer)

hth,
    Joel




-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
