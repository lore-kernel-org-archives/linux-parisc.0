Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from netlx010.civ.utwente.nl (netlx010.civ.utwente.nl [130.89.1.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id E76244829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Dec 2002 10:42:28 -0700 (MST)
Received: from kabel209080 (kabel209080.kabel.utwente.nl [130.89.232.79])
          by netlx010.civ.utwente.nl (8.11.4/HKD) with SMTP id gB9HgMk21137
          for <parisc-linux@lists.parisc-linux.org>; Mon, 9 Dec 2002 16:42:22 -0100
Message-ID: <001801c29faa$48b25a60$4fe85982@kabel.utwente.nl>
From: "Tim Kemna" <t.kemna@student.utwente.nl>
To: <parisc-linux@lists.parisc-linux.org>
References: <000b01c29f8b$554745c0$4fe85982@kabel.utwente.nl> <20021209140747.I20336@parcelfarce.linux.theplanet.co.uk>
Subject: Re: [parisc-linux] kernel compilation error
Date: Mon, 9 Dec 2002 18:42:02 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

----- Oorspronkelijk bericht -----
Van: "Matthew Wilcox" <willy@debian.org>
Aan: "Tim Kemna" <t.kemna@student.utwente.nl>
CC: <parisc-linux@lists.parisc-linux.org>
Verzonden: maandag 9 december 2002 15:07
Onderwerp: Re: [parisc-linux] kernel compilation error


> On Mon, Dec 09, 2002 at 03:00:29PM +0100, Tim Kemna wrote:
> > Hi,
> >
> > I'm trying to compile a kernel on a 712/80, but I get the following
error
> > when I do 'make vmlinux':
> >
> > scsi_merge.c: In function `__count_segments':
> > scsi_merge.c:225: warning: implicit declaration of function
`page_to_phys'
> > scsi_merge.c: In function `initialize_merge_fn':
> > scsi_merge.c:1198: `PCI_DMA_BUS_IS_PHYS' undeclared (first use in this
> > function)
>
> where did you get your kernel from?

ftp.kernel.org
