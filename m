Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep14-int.chello.at (viefep14-int.chello.at [213.46.255.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2247A483E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Jun 2002 17:16:08 -0600 (MDT)
Message-ID: <3D053341.571CF331@gmx.at>
Date: Tue, 11 Jun 2002 01:16:17 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] SCSI driver for E-class servers - SPIFI ?
References: <3D050639.B9F9695D@gmx.at> <20020610215312.29D2C483A@dsl2.external.hp.com>
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

Ok, the URL of NetBSD CVS repository:

http://cvsweb.netbsd.org/bsdweb.cgi    (CVS web interface)

This is the full CVS web path of this driver.

http://cvsweb.netbsd.org/bsdweb.cgi/syssrc/sys/arch/newsmips/apbus/

I have checked out the NetBSD tree on my disk, CVS ROOT was
:pserver:anoncvs@anoncvs.netbsd.org:/cvsroot

I hope we can have progress on this machine ...
Christoph P.


Grant Grundler wrote:
> 
> Christoph Plattner wrote:
> > Hello to all !
> >
> > Is the HP E55 SCSI controller a HP SPIFI ?
> > I found that on the mailing archive ...Is this correct ?
> 
> Yes. HP-PB SE SCSI uses SPIFI-3.
> HP-PB FWD SCSI uses i860 + SPIFI-4.
> 
> > Does anyone know, if this driver can help use for the E55 or
> > similar machines.
> >
> > The driver is in the file:
> >      ./syssrc/sys/arch/newsmips/apbus/spifi.c
> > and
> >      ./syssrc/sys/arch/newsmips/apbus/spifireg.h
> 
> I need a URL. AFAIK, SPIFI if the only family of SCSI
> chips made by HP.
> 
> grant

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
