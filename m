Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA25989
	for <parisc-linux@puffin.external.hp.com>; Fri, 2 Jul 1999 07:26:29 -0600
Message-ID: <377CBE08.741968BC@gmx.de>
Date: Fri, 02 Jul 1999 15:26:32 +0200
From: Helge Deller <deller@gmx.de>
MIME-Version: 1.0
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting the kernel
References: <BF0601275C6FD211B04900A0C9E9205241D111@mailsrvr.hq.celltech.com> <19990702005613.B30362@mencheca.ch.genedata.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox schrieb:

> On Thu, Jul 01, 1999 at 03:41:40PM -0700, Davin Petersen wrote:
> > After downloading the goodies available from the FTP site I gather that
> > rbootd is the way to spit the linux kernel to a HP box.  Am I wrong?  Is
> > there no way of using the ISL?  I tried using the ISL (on my H60), got
> > an error message and was dumped back to the ISL prompt.
>
> rbootd is the way for older machines like my 715.  Later models like
> the A180 tftp their kernel, I think you need bootparamd set up as well.

That's not 100% correct, since my 715/64 uses bootpd/tftpd too.
David, you may start tftpd -d 0 (=zero) in etc/inetd.conf, so you can see
warnings & transfers on the Log-Console.
---snip---
#
tftp    dgram   udp     wait    nobody  /usr/sbin/tcpd  in.tftpd /tftpboot
bootps dgram udp wait root /usr/sbin/bootpd bootpd -d 0 -c /tftpboot
#
---snip---

Helge Deller.
