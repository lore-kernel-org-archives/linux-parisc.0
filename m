Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.alcatel.at (atusks01.alcatel.at [212.183.9.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6B2F9482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Jul 2001 07:14:19 -0600 (MDT)
Sender: christoph.plattner@alcatel.at
Message-ID: <3B44681E.21176E17@alcatel.at>
Date: Thu, 05 Jul 2001 15:14:06 +0200
From: Christoph Plattner <christoph.plattner@alcatel.at>
MIME-Version: 1.0
To: "Pengelly, Raymond" <RPengelly@ati.stlawrencec.on.ca>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] problems with burning iso's
References: <CC7EB40D4455D51191850090270C43801038B1@ati.ati.stlawrencec.on.ca>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

As far as I understand your description, this is correct !
You see about file lines, describing, where the modules
(kernel, ramdisk image, etc) is loaded. And now you must be
patient. In former Linux Releases I had to wait up to half or
full minute to get up. The current kernel on the 0.9.1 is
faster and takes 5-10 seconds (depending on the machine ...)

Wait for a longer time...

By the way. You wrote "series 700". Is this a 9000/720 with
50Mhz or a 730 with 66Mhz (my 720 has the model number A1094).
For those "old" machine you might need a patch in the kernel
to handle an old method of page fault, etc.., handling.
A line must be added then in the `arch/parisc/kernel/trap.c'.
This is true for the old PA7000 CPUs.

If your are intersted I will give you more hints to this point.

With friendly regards
	Christoph P.


"Pengelly, Raymond" wrote:
> 
> Hello everyone
> 
> I'm trying to set up a lab of HP series 700 and 735 workstations with
> PA-Linux. I've downloaded the sti-32 iso and burned it but when I try to
> boot from the cd drive all i get is five lines of what looks like a memory
> dump? Anybody had this problem or ca offer any suggestions? I am able to
> mount the CD drive and access the files normally.
> 
> Also I was wondering what the md5checksums are all about?
> Do I have to change anything in the iso before I burn it?
> 
> Ray Pengelly
> rpengelly@ati.stlawrencec.on.ca
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux


------------------------------------------------------------------
private:  christoph.plattner@gmx.at
company:  christoph.plattner@alcatel.at
