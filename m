Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2D2A84848
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Jul 2002 07:03:45 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17Ruec-0005br-00; Tue, 09 Jul 2002 14:03:42 +0100
Date: Tue, 9 Jul 2002 14:03:42 +0100
From: Matthew Wilcox <willy@debian.org>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Stephan Trajkoff <stephan@itp.bg>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] k210/819 Zalon driver
Message-ID: <20020709140342.X27706@parcelfarce.linux.theplanet.co.uk>
References: <3D2A9711.4030207@itp.bg> <20020709072916.GH6681@sleepie.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020709072916.GH6681@sleepie.demon.co.uk>; from rhirst@linuxcare.com on Tue, Jul 09, 2002 at 08:29:16AM +0100
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

On Tue, Jul 09, 2002 at 08:29:16AM +0100, Richard Hirst wrote:
> On Tue, Jul 09, 2002 at 10:56:01AM +0300, Stephan Trajkoff wrote:
> > Hi,
> > why I need to enable PCI/EISA to make available option zalon driver in 
> > SCSI drivers?
> > My HP K210 don't have PCIs and EISA?!!?!?!?
> 
> At the moment you have to enable PCI because that is the way the config
> script is organised.  I don't know if zalon support would build without
> PCI because it uses the ncr53c8xx driver which normally drives only PCI
> chips.  It is an area that needs attention anyway, because if you enable
> sym53c8xx_2 you wont get the zalon option at all (which is obviously
> wrong).
> 
> Richard?!!?!?!?

Something else is that even if you don't have PCI slots, some of the cards
you have may contain a GSC<->PCI adapter and a PCI device.  The 100Mbit
& Gigabit lan cards are definitely like this and there may be others.

It probably is possible to compile the zalon driver without having PCI
enabled but it'll take a small amount of work to verify.

-- 
Revolutions do not require corporate support.
