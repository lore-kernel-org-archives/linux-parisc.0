Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep11-int.chello.at (viefep11-int.chello.at [213.46.255.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6632C4829
	for <parisc-linux@parisc-linux.org>; Mon, 30 Sep 2002 12:31:42 -0600 (MDT)
Message-ID: <3D98988D.A0B86B5F@gmx.at>
Date: Mon, 30 Sep 2002 20:31:41 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Beerse@dsl2.external.hp.com,
	=?iso-8859-1?Q?Corn=E9?= <c.beerse@torex-hiscom.nl>
Cc: 'parisc-linux maillist' <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Serial MUX
References: <02Sep30.171511cest.119078@ns.hiscom.nl>
Content-Type: text/plain; charset=iso-8859-1
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

Hello,

yes, I want to have E55 (and familiy) supported fully,
and I try to help in development (so far it is possible,
it is hard to get access to HP documentation).

To use the E55 (or family) as a diskless server, it works
(so you can reduce noise at the meantime, the disks cannot
be accessed in Linux - yet !).

For such a diskless operation, you need
	- serial console
	- ethernet
	- core system
All three things are running under Linux.
Again, you can use the PDC CONSOLE driver OR the MUX driver.
Both are accessed via ttyB0 at the moment.

Christoph



> "Beerse, Corné" wrote:
> 
> > -----Original Message-----
> > From: Christoph Plattner [mailto:christoph.plattner@gmx.at]
> >
> > this driver is under development !
> > This driver can be used on machines having a non-supported
> > multi-serial interface like a E35/45/55 or some K-series
> > machines.
> 
> Does this indicate someone is trying to make linux on a E45 usefull?
> I've one next to my desk (terrible noise from the disks or fan).
> 
> Unfortunately I cannot help developping, but I can do some testing.
> 
> >
> > The first and already tested driver is the PDC console
> > driver, to use only port-0 of the multi serial board
> > as console. Now an alternative native MUX driver
> > is under development, but this driver can currently
> > ONLY access port-0 (first port). The multi-line support
> > is not coded yet, and some short tests by me show
> > problems (machine hangs up !).
> >
> > So you cannot access the multiple serial ports, so sorry.
> >
> I only need it for console.
> 
> CBee

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
