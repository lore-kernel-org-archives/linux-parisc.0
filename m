Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA24793
	for <parisc-linux@puffin.external.hp.com>; Thu, 1 Jul 1999 17:19:42 -0600
Received: from hub-fue by rachael.franken.de
	via rmail with uucp
	id <m10zq7K-0027VQC@rachael.franken.de>
	for thepuffingroup.com!parisc-linux; Fri, 2 Jul 1999 01:19:42 +0200 (MET DST)
	(Smail-3.2 1996-Jul-4 #4 built DST-Sep-8)
Message-ID: <19990702011517.A3692@alpha.franken.de>
Date: Fri, 2 Jul 1999 01:15:17 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        Davin Petersen <davinp@celltech.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting the kernel
References: <BF0601275C6FD211B04900A0C9E9205241D111@mailsrvr.hq.celltech.com> <19990702005613.B30362@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19990702005613.B30362@mencheca.ch.genedata.com>; from Matthew Wilcox on Fri, Jul 02, 1999 at 12:56:13AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jul 02, 1999 at 12:56:13AM +0200, Matthew Wilcox wrote:
> rbootd is the way for older machines like my 715.  Later models like
> the A180 tftp their kernel, I think you need bootparamd set up as well.

for the A180 you need a proper setup bootpd/tftpd combo.

Thomas.

-- 
   This device has completely bogus header. Compaq scores again :-|
It's a host bridge, but it should be called ghost bridge instead ;^)
                                        [Martin `MJ' Mares on linux-kernel]
