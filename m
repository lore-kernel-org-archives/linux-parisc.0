Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep13-int.chello.at (viefep13-int.chello.at [213.46.255.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 588404846
	for <parisc-linux@parisc-linux.org>; Sat,  6 Jul 2002 01:57:43 -0600 (MDT)
Message-ID: <3D26A2E8.2636FB7E@gmx.at>
Date: Sat, 06 Jul 2002 09:57:28 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Thibaut VARENE <varenet@esiee.fr>
Cc: "SEMETEYS Raphael - MTR ( rsemeteys@mtr.sema.slb.com )" <rsemeteys@mtr.sema.slb.com>,
	"'parisc-linux@parisc-linux.org'" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Linux on HP9000/E25 ?
References: <A3191AF2-8F62-11D6-B92C-0030656F07A2@esiee.fr>
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

Hello !

It is NOT correct. I have success ! But ONLY as DISKLESS server.

Botting via network and using the PDC console works really well.
The machine is quite fast and in this setup stable.
I run the full SID debian on this machine, it can execute near
all executables, even X applications run (remote of course !).

Only three devices are not supported:
- MUX 8-way serial (except the PDC console using this polling 
	PDC driver)
- Parallel interface
- SCSI disks (which makes this machine to a diskless server !?!)

With getting more documentations and experiences, I will further
work on this (in background load, I am only hacking in my private
spare time ...).

First I will start on SCSI, Ryan works on the MUX of a K-serie
server, and I will try to port this driver. Every help is
welcome. I think we are a "bigger" group now, wishing E-class
support for Linux !!

Christoph


Thibaut VARENE wrote:
> 
> Le jeudi 4 juillet 2002, à 05:31 , SEMETEYS Raphael - MTR
> ( rsemeteys@mtr.sema.slb.com ) a écrit :
> 
> > Hi there,
> >
> > I'd like to know if somedy already got througth installing Linux on a
> > HP9000/E25 server.
> Well, nothing that I heard of.
> Anyway, Christoph Plattner is working on his E55, but with no real
> success (eh Christoph ? :)
> We are actually working on E35, with nothing more than booting the
> kernel via network, and no real success.
> > I'm trying to convinced my boss to do so but I'd like to know possible
> > limitations or known problems before beginning any installation.
> errr; looks like E-class wasn't a good choice :)
> It's not supported actually, and fwiw not a priority
> 
> Thibaut VARENE
> PA/Linux ESIEE Team
> http://pateam.esiee.fr/
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
