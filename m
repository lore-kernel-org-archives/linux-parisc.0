Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lxorguk.ukuu.org.uk (pc2-cwma1-4-cust86.swan.cable.ntl.com [213.105.254.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1CCE74829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 09:39:54 -0600 (MDT)
Received: from dhcp22.swansea.linux.org.uk (dhcp22.swansea.linux.org.uk [127.0.0.1])
	by lxorguk.ukuu.org.uk (8.12.8/8.12.5) with ESMTP id h3GEfeRN030101;
	Wed, 16 Apr 2003 15:41:40 +0100
Received: (from alan@localhost)
	by dhcp22.swansea.linux.org.uk (8.12.8/8.12.8/Submit) id h3GEfYgL030099;
	Wed, 16 Apr 2003 15:41:34 +0100
Subject: RE: [parisc-linux] Re: Presicionbook success
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: "\"Beerse," =?ISO-8859-1?Q?Corn=E9=22?= <c.beerse@torex-hiscom.nl>,
	Matthew Wilcox <willy@debian.org>,
	Gavin Hubbard <ghub005@xtra.co.nz>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.44.0304161504230.28370-100000@sal.ucc.ie>
References: <Pine.LNX.4.44.0304161504230.28370-100000@sal.ucc.ie>
Content-Type: text/plain
Message-Id: <1050504092.28591.97.camel@dhcp22.swansea.linux.org.uk>
Mime-Version: 1.0
Date: 16 Apr 2003 15:41:33 +0100
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

On Mer, 2003-04-16 at 15:09, M. Grabert wrote:
> The hard disks are removeable, but there is no obvious IDE-SCSI bridge
> visible. It is build-in inside the laptop (i.e. non-removeable), and it's
> obviously visible from the OS (at least linux sees the IDE chip). Whether
> you can make any sensible use of it is a different question though ...

That means the system either has seperate IDE and SCSI controllers or
has an IDE controller and an IDE_SCSI bridge for scsi disk. I suspect
the former
> > For what its worth, I think the IRQ is hooked to the scsi interface, not to
> > the processor.
> 
> This would make sense.

It would be common sense for two exclusive items to use the same IRQ,
but if pio works so does the IRQ line

> comes with two 4GB hard disks, both with HP-UX installed, but I have to
> ask for the password (or does anybody know how to easily gain root access?),
> which I haven't done yet.

There are several ways but that would be subverting a rights management
system and I don't wish to get the list owners in trouble.
