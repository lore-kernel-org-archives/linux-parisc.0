Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from femail4.sdc1.sfba.home.com (femail4.sdc1.sfba.home.com [24.0.95.84])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5068B482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Feb 2002 11:00:58 -0700 (MST)
Received: from kenny ([68.58.113.28]) by femail4.sdc1.sfba.home.com
          (InterMail vM.4.01.03.20 201-229-121-120-20010223) with SMTP
          id <20020222173127.ZIKO22968.femail4.sdc1.sfba.home.com@kenny>
          for <parisc-linux@lists.parisc-linux.org>;
          Fri, 22 Feb 2002 09:31:27 -0800
Message-ID: <005801c1bbc6$c1f59360$02c1a8c0@james.co.uk>
From: "James S" <smith-james@home.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: Fw: [parisc-linux] Printing on a 712/60
Date: Fri, 22 Feb 2002 12:31:26 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

----- Original Message -----
From: "James S" <smith-james@home.com>
To: "Michael Wood" <mwood@its.uct.ac.za>
Sent: Friday, February 22, 2002 10:46 AM
Subject: Re: [parisc-linux] Printing on a 712/60


> > On Tue, Feb 19, 2002 at 01:46:14PM -0500, James S wrote:
> > > Every time i send a printjob to the local printer port the
> > > machine locks solid
> > >
> > > anybody else having this problem ?
> > >
> > > i've got an HP deskjet 500 attached using a standard parallel
> > > cable using the cups printing system, although i tried lpd &
> > > got the same result
> >
> > I think this is the problem that happens when the kernel doesn't
> > find /sbin/hotplug or whatever.  Try searching for hotplug in
> > the archives.  Or just apt-get install hotplug and see if the
> > problem goes away :)
> >
> nope - same problem
>
> i was wondering how a usb package could affect a parallel printer.......
>
> i've also noticed that there is a bug in the ps printing renderer which
> causes the printjobs to bail out half way through, but this can be fixed
by
> adding the gimp printing filter & printing through that instead.
>
> so, printing to a windows shared printer 1, same printer on local port 0
>
> i'm using kernel 2.4.17-32, btw & all the latest cups packages
>
> Thanks
>
> James S
>
>
>
>
>
>
>
>
>
>
>
