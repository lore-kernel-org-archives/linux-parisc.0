Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id A694F4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Apr 2003 00:39:29 -0700 (MST)
Message-ID: <3E89E39F.B544BCFA@india.hp.com>
Date: Tue, 01 Apr 2003 13:08:15 -0600
From: Naresh <knaresh@india.hp.com>
Reply-To: knaresh@india.hp.com
MIME-Version: 1.0
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PDC console problem.
References: <3E89DBF4.102AC68A@india.hp.com> <1049181423.24319.17.camel@beavis.ybsoft.com>
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

A small correction to the original mail: the kernel source that was compiled
was the one thats listed as latest ( cvs/linux_latest.tar.gz), which I guess
is 2.4.20-pa22. I have booted this very same kernel off an L-Class machine
with the PDC console option off.

Regards
Naresh.

Ryan Bradetich wrote:

> > I was going through some of the FAQ and the mailing list archive and
> > understand that the PDC console is not a full blown console and can only
> > display output. Is is true that the PDC console cannot accept keyboard
> > input? Or am I missing something?
>
> Hmm.. The pdc_console has both read and write capabilities.  We used the
> PDC console for K/E class systems before the SerialMux driver was
> written.  I am not familiar with the PDC simulator, but I would be
> willing to test the pdc console again on K-Class.
>
> Which kernel are you using?
>
> Thanks,
>
> - Ryan
>
> --
> Ryan Bradetich <rbradetich@uswest.net>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
