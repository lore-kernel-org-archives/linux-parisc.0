Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel13.hp.com (palrel13.hp.com [156.153.255.238])
	by dsl2.external.hp.com (Postfix) with ESMTP id 70C0F4858
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 13:37:41 -0700 (MST)
Message-ID: <3C8E6704.81F14945@cup.hp.com>
Date: Tue, 12 Mar 2002 12:37:24 -0800
From: Gururaj Ananthateerta <gururaj@cup.hp.com>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Switch console error.
References: <3C8E5DCD.942E6278@cup.hp.com> <20020312201309.H30538@parcelfarce.linux.theplanet.co.uk>
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

Matthew Wilcox wrote:

> On Tue, Mar 12, 2002 at 11:58:06AM -0800, Gururaj Ananthateerta wrote:
> > I guess that I may have ommitted some console drivers during building my
> > kernel.
> > Anyine has nay clue about this.
>
> I would assume CONFIG_SERIAL_CONSOLE is the option you're missing.
> Another option might be CONFIG_SERIAL, but I suspect you turned on
> support for your serial ports :-)
>

both of them are set to 'y'


>
> > I am using the following machines.
> > HP-N Class server.
>
> N class isn't supported.  There are a number of problems which need to
> be solved to support N class...

Yes I am aware of it.
I am trying to work on some of those problems.


>
> > I searched the mailing list, but didn't get anything specific.
>
> I'm surprised, I thought this was in the FAQ.
>

Yes, this isn't  in the FAQ  yet.


>
> --
> Revolutions do not require corporate support.
