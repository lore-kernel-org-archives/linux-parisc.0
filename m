Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from netlx010.civ.utwente.nl (netlx010.civ.utwente.nl [130.89.1.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id D42014829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Dec 2002 09:14:27 -0700 (MST)
Received: from kabel209080 (kabel209080.kabel.utwente.nl [130.89.232.79])
          by netlx010.civ.utwente.nl (8.11.4/HKD) with SMTP id gB2GEKV14206
          for <parisc-linux@lists.parisc-linux.org>; Mon, 2 Dec 2002 15:14:20 -0100
Message-ID: <003a01c29a1d$cd94b800$4fe85982@kabel.utwente.nl>
From: "Tim Kemna" <t.kemna@student.utwente.nl>
To: <parisc-linux@lists.parisc-linux.org>
References: <3DA3DE6600007D28@ocpmta4.be.tiscali.com> <003101c299e1$9b2e7680$4fe85982@kabel.utwente.nl> <20021202105023.GL24337@sleepie.demon.co.uk>
Subject: Re: [parisc-linux] lifimage
Date: Mon, 2 Dec 2002 17:13:50 +0100
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

I need the lifimage to setup my console to be the serial device. So I can't
use netboot. Am I right?

----- Oorspronkelijk bericht -----
Van: "Richard Hirst" <rhirst@linuxcare.com>
Aan: "Tim Kemna" <t.kemna@student.utwente.nl>
CC: <parisc-linux@lists.parisc-linux.org>
Verzonden: maandag 2 december 2002 11:50
Onderwerp: Re: [parisc-linux] lifimage


> On Mon, Dec 02, 2002 at 10:02:56AM +0100, Tim Kemna wrote:
> > The HOWTO only says how to make a lifimage (with NFSROOT or RAMDISK). It
> > doesn't say how I should use it.
>
> You can netboot it, or use dd to dump it to a spare scsi disk and boot
> that disk, or write it to a cd (just the lifimage itself, not as a file
> in a file system), and boot from that.  Personally I'd netboot it.
>
> Richard
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
