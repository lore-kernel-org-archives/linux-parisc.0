Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cscuxfw.cscploenzke.de (cscuxfw.cscploenzke.de [194.45.145.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 45E98482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Jan 2002 07:44:00 -0700 (MST)
Subject: RE: [linux-tr] Re: [parisc-linux] IBM TR patch
To: owner-linux-tr@linuxtr.net
Cc: linux-tr@linuxtr.net,
	HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Message-ID: <OF491E61C9.59D265B0-ONC1256B46.005081AA@LocalDomain>
From: drequena@cscploenzke.de
Date: Sat, 19 Jan 2002 15:39:52 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
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

unsubscribe linux-tr
end

Saludos cordiales,
   David Requena
   Computer Sciences Corporation
   http://www.csc.com
   drequena@csc.com

**********************************************************************
This email and any files transmitted with it are confidential and
intended solely for the use of the individual or entity to whom they
are addressed. If you have received this email in error please notify
the sender at drequena@csc.com
**********************************************************************

Mensaje original:  owner-linux-tr, 16/01/2002 09:20:12 p.m.

> Hi Daniel,
>
> > I think the driver was correct. The i/o layer should not try to
byteswap
> > the io requests, because it can not second-guess what the driver is
doing.
>
> I guess the 68000 code is the reference here as it was the first BE port,
> and they do the byteswap, as well.
>
> --jochen
>
