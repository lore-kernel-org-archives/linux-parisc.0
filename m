Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep16-int.chello.at (viefep16-int.chello.at [213.46.255.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 66F92482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jan 2002 14:52:17 -0700 (MST)
Message-ID: <3C435308.19B3FA00@gmx.at>
Date: Mon, 14 Jan 2002 22:52:08 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Rodolfo Baselli <rodolfo.baselli@deaprofessionale.it>
Cc: parisc-linux@lists.parisc-linux.org, willy@debian.org
Subject: Re: [parisc-linux] Installation console problem
References: <3C42D90E.20909@deaprofessionale.it>
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

Hello !

Your machine needs a very new kernel with my new driver handling
the console. The multi-serial board, which is used on the server 
(I have an E55) is not supported by Linux yet, but you can use
the PDC console driver on the server to boot.

For the SCSI and the parallel port, you have no chance, yet, to
boot the machine. So you can only boot the machine diskless via
NFS root, but it runs OK (ok, diskless server is quite a bit for
hackers only ...)

You need a current kernel (I don't know, if the PCD console driver
is already installed on the 0.9.3, so fetch a kernel, and activate
the PDC console driver under non-standard serial devices under the
character device stuff. There you also get a help, how to setup all
that stuff (mknod /dev/ttyB0, etc....). The hole configuration is
quite simple to do, if you know some basics.

But the problem you see, is not directly the problem concerning the
serial console (but you will come to this problem some seconds later
...). Very often my PA RISC boxes block after the sentence
"If this is the last message you see, ...", but simple wait here,
half a minute or some. But after a couple of further lines, you
will have the console problem, and then you need the setup with
the PDC console driver.

With friendly regards
Christoph P.


Rodolfo Baselli wrote:
> 
> Hi out there!
> I'm trying to install the 0.9.3 CD on a HP9000/E45/A3130AW.
> I managed to boot the image, but then I got this message on the serial
> line console:
> "If this is the last message you see, you may need to switch your
> console. This is a common symptom - search the FAQ and mailing lists"
> but I found nothing, since I'm asking you... :-(
> What's happened?
> 
> Thank you for your patience.
> 
> Rudy
> (Italy)
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
