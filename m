Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7CDED4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 24 Sep 2002 06:56:24 -0600 (MDT)
Message-ID: <3D90606C.6000500@esiee.fr>
Date: Tue, 24 Sep 2002 14:54:04 +0200
From: Thibaut VARENE <varenet@esiee.fr>
MIME-Version: 1.0
To: joachim.weller@philips.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Help wanted: XF86Config (B2600)
References: <OF52713812.E62609E7-ONC1256C3E.0044B75D@diamond.philips.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

joachim.weller@philips.com wrote:

> The BusID was determined by  "cat /proc/pci" :
>   Bus  1, device   3, function  0:
>     3D controller: PCI device 103c:108b (Hewlett-Packard Company) (rev 5).
>       IRQ 258.
>       Master Capable.  Latency=255.
>       Prefetchable 64 bit memory at 0xfffffffffb000000 
> [0xfffffffffbffffff].
>       Non-prefetchable 64 bit memory at 0xfffffffffa000000 
> [0xfffffffffaffffff].
it's a FXE card, unsupported.
Only Vis-EG are.
Support for these cards is planned to be worked on ;)


HTH,

Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/
