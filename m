Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep12-int.chello.at (viefep12-int.chello.at [213.46.255.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id DFA024835
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Jun 2002 14:03:59 -0600 (MDT)
Received: from gmx.at ([62.178.92.247]) by viefep12-int.chello.at
          (InterMail vM.5.01.03.06 201-253-122-118-106-20010523) with ESMTP
          id <20020610200356.HNRF10704.viefep12-int.chello.at@gmx.at>
          for <parisc-linux@lists.parisc-linux.org>;
          Mon, 10 Jun 2002 22:03:56 +0200
Message-ID: <3D050639.B9F9695D@gmx.at>
Date: Mon, 10 Jun 2002 22:04:09 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] SCSI driver for E-class servers - SPIFI ?
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

Hello to all !

Is the HP E55 SCSI controller a HP SPIFI ?
I found that on the mailing archive ...
Is this correct ?

Further I found out, that NetBSD has one HP SPIFI SCSI driver ?
Does anyone know, if this driver can help use for the E55 or
similar machines.

The driver is in the file:
     ./syssrc/sys/arch/newsmips/apbus/spifi.c 
and
     ./syssrc/sys/arch/newsmips/apbus/spifireg.h

Answer is welcome

Christoph


-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
