Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (ottawa.linuxcare.com [216.208.98.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id A14AD482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 27 Jul 2001 07:24:19 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id A3F04B00C; Fri, 27 Jul 2001 14:26:01 +0100 (BST)
Date: Fri, 27 Jul 2001 14:26:01 +0100
From: 'Richard Hirst' <rhirst@linuxcare.com>
To: "Scammell, David" <David.Scammell@uk.wmmercer.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 715/33 disk and kernel make dep problems
Message-ID: <20010727142601.L1252@linuxcare.com>
References: <99F41EF55D11D511818600D0B74749C496F42B@wchrntms01.uk.wmmercer.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <99F41EF55D11D511818600D0B74749C496F42B@wchrntms01.uk.wmmercer.com>; from David.Scammell@uk.wmmercer.com on Wed, Jul 25, 2001 at 04:52:54PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jul 25, 2001 at 04:52:54PM +0100, Scammell, David wrote:
> Will try that tonight.
> 
> I managed to compile 2.4.6-pa21 out of cvs a few days ago,
> same problem. A new version of make came down from debian
> a few days ago which may of helped the make dep problems,
> however it still stops, the scsi problems may affect make
> dep possibly, even though i'm compling over nfs.
> 
> I've not had time to change the sync speed between crashes
> but i'll get there.
> 
> Sorry there is no oops yet, I'm using an X terminal with
> the serial line plugged in for the console.
> 
> BTW 2.4.6-pa21 does not appear to listen for console input,
> at least not during the interactive fsck phase following a
> crash, did that break recently?

There are some problems with console input atm.  Graphical console
k/b doesn't work on several machines, and when I tried a 2.4.6 based
installer the other day with serial console, the k/b was dead at
the start of stage two install (could have been the installer had
just crashed, of course).

I'll be trying to track down the serial console problem with the
installer next week.

Richard
