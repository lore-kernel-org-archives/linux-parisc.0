Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id 217EE4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Oct 2002 08:27:09 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel9.hp.com (Postfix) with ESMTP id E3305E0119B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Oct 2002 10:27:02 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id IAA27522
	for parisc-linux@lists.parisc-linux.org; Tue, 8 Oct 2002 08:27:02 -0600 (MDT)
Date: Tue, 8 Oct 2002 08:27:02 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200210081427.IAA27522@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ksoftirqd eats 100% cpu :-(
Mime-Version: 1.0
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

> It's a bug/feature related to the HIL drivers.
> Since we have to poll the HIL ports the whole time
> the bunch of running timers increase the ksoftirqd load a lot.

I understand that polling is necessary while sending commands out
to hil devices, but input should be interrupt driven. What is the
reason for all of the polling?

John Marvin
jsm@fc.hp.com
