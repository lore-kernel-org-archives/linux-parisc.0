Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep13-int.chello.at (viefep13-int.chello.at [213.46.255.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 88EC0482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Nov 2001 12:16:42 -0700 (MST)
Message-ID: <3BFBFD98.29F4D69A@gmx.at>
Date: Wed, 21 Nov 2001 20:16:40 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Ryan Bradetich <ryan_bradetich@uswest.net>
Cc: marteaut@esiee.fr, grundler@puffin.external.hp.com,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: E55 status - THE DRIVER !
References: <3BF99676.2A291CDD@gmx.at> <1006299638.4898.16.camel@beavis>
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

Hello again,

Are you able to write the drivers ?
Do you have the documentation for that ?
I have problems with my spare time, but I am also interested in writing
drivers (especially for my machine !)

Which drivers will you write ?
MUX ?, SCSI ? (parallel port ?)

Bye
Christoph



Ryan Bradetich wrote:
> 
> Hello Christoph,
> 
> I have integrated your patch into my tree, and have been testing out the
> patch on my C200+ and the K460.  With the PDC console patch, I do get to
> the console on the K460 which is great news.  I am still going to work
> on the driver for the actual hardware (in my case the Eole CAP/MUX, and
> in your case the Sahp Baat Kiuh AP/MUX), but this is a nice work around
> until that work is finished.
> 
> When integrating your patch into my tree, I made the following changes:
> 
> * Dropped the LCD support.
>         I do not understand this portion of the code very well, and it  had
> some uglyness that made me feel uneasy to commit to the tree.   Someone
> else should look at this and integrate it properly.
> 
> * Renamed the pdc_drv to pdc_console.
>         Just seemed more accurate to me .. I am open for other opinions
>         on this.
> 
> * Added the configure option and help text for the PDC software console.
> * Inegerated CONFIG_PDC_CONSOLE into the drivers/char/Makefile.
> * Integrated CONFIG_PDC_CONSOLE into arch/parisc/kernel/pdc_cons.c and
>         performed some minor cleanups.
> 
> * probably other things I've forgotten :)
> 
> Overall I though the patch looked great, but I still have 1 concern left
> and that is about the major number.
> 
> According to Documentation/devices.txt major number 30 is reserved for:
>  30 char        iBCS-2 compatibility devices
> 
> I understand about --><-- much about how major numbers are handled and I
> know this is a topic of debate among the main stream kernel developers.
> If we ever want to move this driver into the mainstream kernel this
> issue will probably need to be resolved ... and I have no idea on how to
> proceed.  Maybe others on this list will have an idea, or when the time
> comes we will need to address this on the lkml.  Before I commit this
> patch to the CVS repository, I'd like to get some concensus on this list
> about what is right.  (ie for the debian installer to work with this
> device, /dev/ttyB0 will need to be added to the MAKEDEV package, etc).
> 
> Anyways the patch is available for feedback at:
> ftp://ftp.parisc-linux.org/patches/pdc_console.diff
> 
> I am still working on testing this driver ... I would be very happy to
> see install the K460 using the debian installer using this patch.  I am
> currently working on making that happen.
> 
> Thanks,
> 
> - Ryan

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
