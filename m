Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 72DDF482D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 10 Oct 2002 00:32:22 -0600 (MDT)
Received: from iws1pb05.france.hp.com (unknown [15.124.72.14])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 7D116525
	for <parisc-linux@lists.parisc-linux.org>; Thu, 10 Oct 2002 08:32:18 +0200 (METDST)
Message-ID: <3DA51F44.1898AA4@hpfrcu81.france.hp.com>
Date: Thu, 10 Oct 2002 08:33:40 +0200
From: phi <phi@hpfrcu81.france.hp.com>
MIME-Version: 1.0
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] boot (micro) hang
References: <3DA2945D.7010301@visoel.de> <3DA2E27B.5708975E@hpfrcu81.france.hp.com> <20021008170152.AD42D4839@dsl2.external.hp.com>  <3DA424C6.58F6806C@hpfrcu81.france.hp.com> <20021009175717.A5B184829@dsl2.external.hp.com>
Content-Type: text/plain; charset=us-ascii
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

Grant Grundler wrote:
> 
> phi wrote:
> > My Firmware is
> >
> > Firmware Version  5.2
> 
> sorry - I forgot to mention the FAQ explains how to determine
> what the latest available rev is.
> 

The FAQ also say it is dangerous to update a firware and you do it only if
absolutly necessary.

In my situation I had the proof that booting the prev kernel was ok, so the FW
was good enough for this.

I own only 1 c180, and will not have another one, also based on your
recomandation I prefered discover what made the C180 hanging at boot, at least
I learned a bit more about the iotree discovery, while upgrading the firmware
to 6.1 would have learned me nothing and I could have lost my machine.

So all in all I am happy with my temp solution, I am glad that Ryan will
revisit his code and fix this regression for the benefit of all.

So apparently FW5.2 is good enough for what I am doing, the patch catalog only
give the latest version number and doesn't tell what diff there is between 5.2
and 6.1, without good explanation, there is no reason to upgrade.

The link 'HPUX-11 Patch Management' is obso and don't work (for me).

Thanx for your help and pointers.
Cheers,
Phi
