Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA23106
	for <parisc-linux@puffin.external.hp.com>; Wed, 13 Dec 2000 02:51:57 -0700
Received: from mail.de.origin-it.com (localhost.origin-it.com [127.0.0.1])
          by gw-nl1.origin-it.com with ESMTP id KAA24585
          for <parisc-linux@thepuffingroup.com>; Wed, 13 Dec 2000 10:54:37 +0100 (MET)
          (envelope-from Matthias.Wientapper@de.origin-it.com)
Received: from mailhub.de.origin-it.com (mailhub.de.origin-it.com [172.16.189.20])
	by mail.de.origin-it.com (8.9.3/8.8.5-1.2.2m-19990317) with ESMTP id KAA28926
	for <parisc-linux@thepuffingroup.com>; Wed, 13 Dec 2000 10:54:36 +0100 (MET)
Received: from acehp4.hbg.de.origin-it.com (root@acehp4.hbg.de.origin-it.com [172.16.189.139])
	by mailhub.de.origin-it.com (8.11.1/8.11.1/hmo23oct00) with ESMTP id eBD9sWH53562
	for <parisc-linux@thepuffingroup.com>; Wed, 13 Dec 2000 10:54:36 +0100 (CET)
	(envelope-from Matthias.Wientapper@de.origin-it.com)
Received: from de.origin-it.com (wientapp@acehp4.hbg.de.origin-it.com [172.16.189.139]) by acehp4.hbg.de.origin-it.com with ESMTP (8.8.6 (PHNE_17135)/8.7.1) id KAA05767 for <parisc-linux@thepuffingroup.com>; Wed, 13 Dec 2000 10:54:35 +0100 (MET)
Sender: wientapp@acehp4.hbg.de.origin-it.com
Message-ID: <3A37475A.958F2830@de.origin-it.com>
Date: Wed, 13 Dec 2000 10:54:34 +0100
From: Matthias Wientapper <Matthias.Wientapper@de.origin-it.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 712/60 booting problem
References: <3A37452B.B5D1BCC2@tellabs.com>
Content-Type: text/plain; charset=iso-8859-15
List-ID: <linux-parisc.vger.kernel.org>

Same on a 715/64 here.

(ASIC-Designers love their HPs, eh?)


Regards,

Matthias

Robin Theander wrote:
> 
> > Marko.T.Niskanen@nokia.com wrote:
> > > kernel BUG at pci-dma.c:400!
> > > kernel BUG at pci-dma.c:391!
> > > kernel BUG at pci-dma.c:400!
> > > kernel BUG at pci-dma.c:391!
> > > kernel BUG at pci-dma.c:400!
> > > ISO 9660 Extensions: RRIP_1991A
> > > VFS: Mounted root (iso9660 filesystem) readonly.
> > Those are actually messages that are perfectly normal.
> > I wonder if Marko's problems are specific to the 712/60, does anyone
> > else with a 712/60 have such kernel panics? I don't on my 712/80.
> 
> I have a 712/60 and I see the same. The box works quite well.
> The same messages also appear when mounting/unmounting filesystems.
> 
> Robin.
> 
> --
> ASIC Design Engineer
> Tellabs Denmark A/S
> 
> Direct: +45 4473 2942
> robin.theander@tellabs.com
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

--
Matthias Wientapper                   We're all pretty geeky people....
AtosOrigin ASIC CENTRE                I think you'll find that your      
Billstrasse 80, D-20536 Hamburg       average rock star is a dork.      
Phone: +49-(0)40-7886-699 Fax: -691   - Adam Duritz of Counting Crows
