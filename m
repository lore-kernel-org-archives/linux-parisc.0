Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from elvis.franken.de (dns.franken.de [193.175.24.33])
	by dsl2.external.hp.com (Postfix) with ESMTP id 96ED04847
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Jul 2002 03:24:55 -0600 (MDT)
Date: Wed, 10 Jul 2002 11:24:20 +0200
From: Thomas Bogendoerfer <tsbogend@elvis.franken.de>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: Jeremy Drake <jeremyd@apptechsys.com>,
	Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP (in)stability
Message-ID: <20020710092420.GA11862@elvis.franken.de>
Reply-To: tsbogend@alpha.franken.de
References: <Pine.LNX.4.44.0207100032050.19290-100000@garibaldi.apptechsys.com> <2DB6E156-93E2-11D6-BEE2-0030656F07A2@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <2DB6E156-93E2-11D6-BEE2-0030656F07A2@esiee.fr>
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

On Wed, Jul 10, 2002 at 10:51:09AM +0200, Thibaut VARENE wrote:
> It also seems to me (though i cannot confirm atm) that the 'PIO mode' in
> SYM53C8XX driver improves stability.

I always use sym-2 now, because I had this strange harddisk slow down problem
with the old sym driver. That might be worth a try, too.

Thomas.
