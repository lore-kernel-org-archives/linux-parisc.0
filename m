Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from opus.allegro.com (opus.allegro.com [209.10.39.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id E5F444829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 19:18:43 -0600 (MDT)
From: Stan Sieler <sieler@allegro.com>
Message-Id: <200304170118.h3H1IR011309@opus.allegro.com>
Subject: Re: [parisc-linux] Re: Presicionbook success
To: alan@lxorguk.ukuu.org.uk (Alan Cox)
Date: Wed, 16 Apr 2003 18:18:26 -0700 (PDT)
Cc: xam@cs.ucc.ie (M. Grabert),
	c.beerse@torex-hiscom.nl ("\"Beerse," =?ISO-8859-1?Q?Corn=E9=22?=),
	willy@debian.org (Matthew Wilcox),
	ghub005@xtra.co.nz (Gavin Hubbard),
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <1050504092.28591.97.camel@dhcp22.swansea.linux.org.uk> from "Alan Cox" at Apr 16, 2003 03:41:33 PM
MIME-Version: 1.0
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

Re:

> > The hard disks are removeable, but there is no obvious IDE-SCSI bridge
> > visible. It is build-in inside the laptop (i.e. non-removeable), and it's
...

> That means the system either has seperate IDE and SCSI controllers or
> has an IDE controller and an IDE_SCSI bridge for scsi disk. I suspect

The IDE to SCSI converter is a small board inside the "cartridge" 
(or "case") that forms the removable hard drive.   If you remove a hard
drive, and then open its case up, you'll see the converter board clearly.

It is indeed highly similar to the Acard SCSIIDE product (although possibly
from a different vendor).  

BTW, I would not expect either disk to show up as IDE at all.

-- 
Stan Sieler                                           sieler@allegro.com
www.allegro.com/sieler/wanted/index.html                  www.sieler.com
