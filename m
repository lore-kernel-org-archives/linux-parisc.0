Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9B3294844
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  6 Apr 2004 05:27:42 -0600 (MDT)
Date: Tue, 6 Apr 2004 12:46:54 +0200
Message-ID: <40711E5600000D4E@ocpmta1.freegates.net>
In-Reply-To: <20040402180356.GG1081@baldric.uwo.ca>
From: "Joel Soete" <soete.joel@tiscali.be>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	"Matthew Wilcox" <willy@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] RE: [PATCH] glibc-2.3.3 error with debian unstable
	compiler...
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Carlos,

I just apply your patch against the glibc cvs dated 20040405 (yesterday for
me).
It compiles well with last updated gcc (3.3.3-6 dpkg iirc) :)

I just complete the 'make -k check' (on chroot disk) which finished with
nothing more then well known bug :)

... And the compile (always in the chroot disk) of the last k-2.6.5-pa3 just
finishes with success :)

hth,
    Joel

----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
