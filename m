Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 6A07F4831
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Jun 2002 00:57:14 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: joel.soete@freebel.net, Jeremy Drake <jeremyd@apptechsys.com>
Subject: Re: [parisc-linux] CVS kernel broken?
Date: Thu, 27 Jun 2002 08:56:41 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <Pine.LNX.4.44.0206262237000.17764-100000@garibaldi.apptechsys.com> <1025160385.3d1ab4c1b6078@webmail.tiscalinet.be>
In-Reply-To: <1025160385.3d1ab4c1b6078@webmail.tiscalinet.be>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200206270856.42032.deller@gmx.de>
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

On Thursday 27 June 2002 08:46, joel.soete@freebel.net wrote:
> Quoting Jeremy Drake <jeremyd@apptechsys.com>:
> > I am unable to build the current cvs kernel.  make oldconfig says
> > scripts/Configure: drivers/hil/Config.in: No such file or directory
> > make[1]: *** [oldconfig] Error 1
> >
> > and make menuconfig says
> > Preparing scripts: functions, parsingscripts/Menuconfig: line 1: 10304
> > Segmentation fault      awk "$1"
> > Awk died with error code 139. Giving up.
> > ...
> >
> > Is this just me, or is there some problem I don't know about?
>
> No problem for me.
> Do you try "make distclean" before oldconfig?
>
> Joel

Please checkout the CVS kernel again.
I've moved the HIL source to an own directory and updated some other
things.

Greetings,
Helge
