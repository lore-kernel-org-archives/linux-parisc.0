Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.comcast.net (smtp.comcast.net [24.153.64.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 94FA748A2
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Mar 2002 12:55:27 -0700 (MST)
Received: from kenny (pcp944901pcs.cstltn01.in.comcast.net [68.58.113.28])
 by mtaout01.icomcast.net (iPlanet Messaging Server 5.1 (built Feb  6 2002))
 with SMTP id <0GSO00IKS7CDM1@mtaout01.icomcast.net> for
 parisc-linux@lists.parisc-linux.org; Fri, 08 Mar 2002 14:55:26 -0500 (EST)
Date: Fri, 08 Mar 2002 14:55:23 -0500
From: James S <smithjames@comcast.net>
Subject: Re: [parisc-linux] 'foreign' PCI cards in an rp2430
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
Reply-To: James S <smithjames@comcast.net>
Message-id: <001f01c1c6db$30c467c0$02c1a8c0@james.co.uk>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
References: <E16jLrI-0006Qt-00@the-village.bc.nu>
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

> > Alpha happens to work because its firmware includes a simple x86
> > simulator that executes the BIOS code on the card.  That way you can
> > configure your disk setup, etc.
> 
> There is btw a passable x86 emulator for free in the XFree86 code that
> is used to do things like boot video cards.
> 
> > Unfortunately the 3ware management utility is 386 binary-only.
> > I.e. you can't configure the card once you get Linux up and running
> > either.
> 
> Bochs 8)
> 

out of sheer curiosity, i installed bochs on my 712/60

running the linux demo that comes with it, i got a bogoMIPS rating of 0.82 

hehe :)

James S
