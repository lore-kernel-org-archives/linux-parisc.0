Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA26886
	for <parisc-linux@puffin.external.hp.com>; Fri, 2 Jul 1999 12:38:54 -0600
Message-ID: <19990702183858.25389.qmail@mailserv2.iuinc.com>
From: Alex Apostolopoulos <alex@assyst-intl.com>
Subject: Re: [parisc-linux] Booting the kernel
To: deller@gmx.de (Helge Deller)
Date: Fri, 2 Jul 99 20:27:13 MESZ
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <377CBE08.741968BC@gmx.de>; from "Helge Deller" at Jul 02, 99 3:26 pm
List-ID: <linux-parisc.vger.kernel.org>

Hi 
> 
> Matthew Wilcox schrieb:
> 
> > On Thu, Jul 01, 1999 at 03:41:40PM -0700, Davin Petersen wrote:
> > > After downloading the goodies available from the FTP site I gather that
> > > rbootd is the way to spit the linux kernel to a HP box.  Am I wrong?  Is
> > > there no way of using the ISL?  I tried using the ISL (on my H60), got
> > > an error message and was dumped back to the ISL prompt.
> >
> > rbootd is the way for older machines like my 715.  Later models like
> > the A180 tftp their kernel, I think you need bootparamd set up as well.
> 
> That's not 100% correct, since my 715/64 uses bootpd/tftpd too.
> David, you may start tftpd -d 0 (=zero) in etc/inetd.conf, so you can see
> warnings & transfers on the Log-Console.
> ---snip---

just for the record:
boot via rbootd
	715/33/50/75
	735/99/125

boot via bootptab
	715/64/80/100 ..
	712/60/80/100 

not at all
	B1000 (just a joke)

cheers alex
> #
> tftp    dgram   udp     wait    nobody  /usr/sbin/tcpd  in.tftpd /tftpboot
> bootps dgram udp wait root /usr/sbin/bootpd bootpd -d 0 -c /tftpboot
> #
> ---snip---
> 
> Helge Deller.
> 
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 
