Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from apate.telenet-ops.be (apate.telenet-ops.be [195.130.132.57])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1052C482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Jul 2003 07:58:19 -0600 (MDT)
From: "Mark Mestdagh" <Mark.Mestdagh@Icon-Europe.com>
To: "Matthew Wilcox" <willy@debian.org>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Kernel compilation for J5600
Date: Tue, 1 Jul 2003 16:00:31 +0200
Message-ID: <HOEDKHACIIOGKPMMFMCGKEKFCOAA.Mark.Mestdagh@Icon-Europe.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20030701132146.GD23597@parcelfarce.linux.theplanet.co.uk>
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

Hi Matthew

it was 2.4.21-pa0, but I cvs'ed to 2.4.21-pa1 and now it's fixed :)

Thanks

Mark

-----Original Message-----
From: willy@www.linux.org.uk [mailto:willy@www.linux.org.uk]On Behalf Of
Matthew Wilcox
Sent: dinsdag 1 juli 2003 15:22
To: Mark Mestdagh
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel compilation for J5600


On Tue, Jul 01, 2003 at 10:10:24AM +0200, Mark Mestdagh wrote:
> Grant & others
>
> thanks already for the support. One little problem though is setting up
the
> CDROM. I followed the settings like the c3000 kernel but still I get a
> problem while compiling:
>
> drivers/ide/idedriver.o(.text.probe_hwif+0xfc): undefined reference to
> `local_irq_set'

This is 2.4.21-pa1?

--
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead
bodies.
Do you think I want to have an academic debate on this subject?" -- Robert
Fisk
