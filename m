Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id D7B404829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Jun 2003 04:19:53 -0600 (MDT)
Date: Mon, 30 Jun 2003 12:19:49 +0200
Message-ID: <3ED70CF10000B8FE@ocpmta2.freegates.net>
In-Reply-To: <20030629213301.GA24957@dsl2.external.hp.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] byte swapping redux
To: "Grant Grundler" <grundler@parisc-linux.org>,
	"Matthew Wilcox" <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
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

> BTW, Prelimary diff on ftp://ftp.p-l.o/patches/diff-2.4.21-pa1
> attempts to fix the byteorder.h mess and first cut at trying
> to get intermezzo to build. But intermezzo won't assemble because
> it has field alignment (ldd 52(x) instruction) problems.

Hmm here no pb to build intermezzo (as a module) neither for 2.4.21-pa1 neither
2.4.22-pre2-pa1 (gcc-3.3 32bits at least). So I suspect that it is a pb with
binutils (I still have to downgrade it to binutils-2.13.90.0.18-1.7_hppa.deb)
which Dave fixed in upstream a time ago but (I don't know why) not yet included
in debian dpkg.

hth,
    Joel


---------------------------------
Tiscali ADSL: 19,50 euros/mois...abonnez-vous sur www.tiscali.be
