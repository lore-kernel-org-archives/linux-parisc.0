Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 17E604840
	for <parisc-linux@parisc-linux.org>; Wed, 19 Nov 2003 01:21:38 -0700 (MST)
Date: Wed, 19 Nov 2003 09:21:29 +0100
Message-ID: <3FB265EC00003DBD@ocpmta3.freegates.net>
In-Reply-To: <Pine.LNX.4.58.0311181432590.11677@brain.fop.ns.ca>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] Processes stuck in D state on 715/100XC with 2.4.22-pa17
To: "Steve Bromwich" <lists@fop.ns.ca>
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

>-- Original Message --
>From: Steve Bromwich <lists@fop.ns.ca>
>To: Joel Soete <soete.joel@tiscali.be>
>Cc: parisc-linux@parisc-linux.org
>Date: Tue, 18 Nov 2003 14:34:49 -0400 (AST)
>Subject: RE: [parisc-linux] Processes stuck in D state on 715/100XC with
> 2.4.22-pa17
>
>
>Hi Joel,
>
>Just to clarify, this is happening during operation, not bootup. Next time
>it happens (probably tomorrow morning) I'll break on serial and try
>piminfo - is there anything else useful in there that might be worth
>looking at?
>
May be if you can, run hp diag tools?

(I have no clue about 715 model but well running 2.4.22 (and above) on various
b180, b2k, c110, N4000 and i have never encounter such pb?)

>I'm using Debian stable, with the 2.2.5-11.5 libc package installed.

Hmm, may be Carlos could help here, I know that glibc 2.3 need a kernel >
2.4.18  iirc but what is about a kernel 2.4.22? (does 2.4.22 need then glibc
2.3 for user space prgm operate correctly?)

Joel

-------------------------------------------------------------------------
Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.

http://reg.tiscali.be/default.asp?lg=fr
