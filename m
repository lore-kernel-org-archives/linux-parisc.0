Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 547FF485B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Jul 2002 16:48:49 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: Carlos O'Donell <carlos@baldric.uwo.ca>,
	Jeremy Drake <jeremyd@apptechsys.com>
Subject: Re: [parisc-linux] HOWTO: Using HIL keyboard and HIL mouse on PARISC
Date: Wed, 10 Jul 2002 00:45:10 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <200206301931.58043.deller@gmx.de> <Pine.LNX.4.44.0207090933560.19290-200000@garibaldi.apptechsys.com> <20020709220437.GA31678@systemhalted>
In-Reply-To: <20020709220437.GA31678@systemhalted>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200207100045.10930.deller@gmx.de>
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

On Wednesday 10 July 2002 00:04, Carlos O'Donell wrote:
> > When trying to build my kernel (-pa52) with the new HIL support I got
> > this while building vmlinux:
> >
> > drivers/hil/hil.o: In function `.L1369':
> > drivers/hil/hil.o(.text.hil_kbd_connect+0x4f8): undefined reference to
> > `register_ps2_keybfuncs'
> >
> > Could someone please let me know what I am doing wrong (leaving out)?  I
> > have attached my .config (for a J5k).
> >
> > Thanks
>
> J,
>
> Until the hp_psaux.c driver is converted to input layer, you'll
> have to compile in the GSC PS2 driver code to get it all right.
>
> CONFIG_GSC_PS2=y
>
> I'm currently working with Thomas to make the conversion.
>
> Helge, any idea why we even call that function from hil_kbd?
> I'm at a loss to explain the reasoning...

Hi Carlos,
