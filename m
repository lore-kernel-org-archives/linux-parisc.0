Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4F136482D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jun 2003 04:16:17 -0600 (MDT)
Date: Thu, 19 Jun 2003 12:16:15 +0200
Message-ID: <3ED70CF1000077D4@ocpmta2.freegates.net>
In-Reply-To: <3EF17DEF.1050803@bluehash.de>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Some 2.5-testing
To: =?ISO-8859-1?Q?R=FCdiger=20Scholz?= <r.scholz@bluehash.de>,
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

Hi,

> >Do you already try to rebuild and re-try a kernel without this support?
> >
> this was also my thought, so recompiled kernel without md-support. I 
> just rebooted the machine with the new kernel.... Same problem at 
> another place:

Sorry.

My best idea now is try a TOC (I presume that such a special swicth exist
on 715 model) (may be first cleanup PIMinfo with "ser clearpim" at bootprompt
before booting the kernel). Then during the 'bad loop' puch the TOC button
and at the bootprompt again collect (with minicom for instance) piminfo ("ser
pim") and try to submit it to analyse to 'dump_analyser.sh' (you can grabbe
it with a.c into cvs build-tools dir).
And report its result to this ml.

Hope this will help,
    Joel

PS: Edit dump_analyser.sh to change DUMPTYPE to TOC (default is kernel).
btw, I am impatient that hp release its p4 tools :-)


---------------------------------
Tiscali ADSL: 19,50 euros/mois...abonnez-vous sur www.tiscali.be
