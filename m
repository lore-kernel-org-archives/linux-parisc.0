Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from opus.allegro.com (opus.allegro.com [209.10.39.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id 91F2F486C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Feb 2002 08:43:06 -0700 (MST)
From: Stan Sieler <sieler@allegro.com>
Message-Id: <200202211542.HAA04641@opus.allegro.com>
Subject: Re: [parisc-linux] HP3000 model 937
To: willy.schriemer@philips.com
Date: Thu, 21 Feb 2002 07:42:38 -0800 (PST)
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <OFD0B612F9.F1BF32FB-ONC1256B67.004FBA94@diamond.philips.com> from "willy.schriemer@philips.com" at Feb 21, 2002 03:34:50 PM
MIME-Version: 1.0
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

Re:

> Is it possible to use PaRisc on HP3000 model 937RX. This machine is a good 
> old MPE/iX wich I want to use for testing PaRisc0Linux.

Sorry, it's not supported by the current port.  It's the same
hardware as the HP 9000s of the F/G/H x0 series.  The I/O is a little
bit different, and HP hasn't release documentation for it (IIRC).

However, if you want to get rid of it, I saw a post from a user in
Poland last week, asking for an HP 3000 for their personal use.

> Sender:       HP-3000 Systems Discussion <HP3000-L@RAVEN.UTC.EDU>
> From:         Janusz <JRodzewicz@POCZTA.ONET.PL>
> Subject:      Want to buy HP3000 for personal use at home
> 
> Hi,all.
> 
> Looking for used 9xx, <= 5 users.
> 
> Regards
> Janusz.

Stan Sieler
