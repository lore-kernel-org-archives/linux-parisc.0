Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id B30F14850
	for <parisc-linux@parisc-linux.org>; Wed,  6 Mar 2002 13:06:11 -0700 (MST)
Received: from eiger.apptechsys.com (ats198.apptechsys.com [207.14.35.198])
	by mail.apptechsys.com (Postfix) with ESMTP id 92BC47BC4C
	for <parisc-linux@parisc-linux.org>; Wed,  6 Mar 2002 12:05:52 -0800 (PST)
Date: Wed, 6 Mar 2002 12:05:52 -0800 (PST)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] SMP support
In-Reply-To: <02030609103100.00899@localhost.localdomain>
Message-ID: <Pine.LNX.4.33L2.0203061147470.6941-100000@eiger.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

HP J5000 running 2.4.17-32-smp package

> > > cpu  599904 33379482 34656795 68636319
> > > cpu0 0 0 64 68636186
> > > cpu1 599904 33379482 34656731 133
> > >

> for comparison: (2.4.17 on an x86 smp-box)
>
> cpu  2867 96 1822 231717
> cpu0 1400 37 671 116143
> cpu1 1467 59 1151 115574
>

I wasn't seeing any proof anywhere on the system, other than cpuinfo, that
this box was using 2 processors, so I was looking for some.  This looks to
me like smp is broken.  It sees 2 processors, but only one is used.  I
just tried 2.4.16-32-smp and it is like this too.
