Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bastion.qld.csiro.au (bastion.qld.csiro.au [140.253.122.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 65BE9482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Apr 2001 15:16:06 -0600 (MDT)
Received: from bastion.qld.csiro.au (localhost [127.0.0.1])
	by bastion.qld.csiro.au (8.9.3/8.9.3) with ESMTP id HAA25711
	for <parisc-linux@lists.parisc-linux.org>; Tue, 1 May 2001 07:16:02 +1000 (EST)
Received: from ntexchange.cat.csiro.au (ntexchange.cat.csiro.au [140.253.12.1])
	by bastion.qld.csiro.au (8.9.3/8.9.3) with ESMTP id HAA25706
	for <parisc-linux@lists.parisc-linux.org>; Tue, 1 May 2001 07:15:58 +1000 (EST)
Message-ID: <A8566E157F5FD411BCFB00D0B7816D51C7295E@ntexchange.cat.csiro.au>
From: "van de Werken, Matthew (DEM, PH)" <M.Vandewerken@cat.csiro.au>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Tue, 1 May 2001 07:15:51 +1000 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Getting documentation for Outfield
List-ID: <linux-parisc.vger.kernel.org>

Hi folks:

I've now been struggling with getting my HP735/99 going for a little while,
and the main hurdle I still have to overcome is getting the FW SCSI going.
The narrow SCSI works fine, but the FW SCSI has to go through the Outfield
interface chip. Is there any documentation kicking around for this chip,
particularly how to talk to it, that is available for public consumption. 

I believe Richard Hirst is probably the guy to write the driver, but he
doesn't actually have hardware, and I think it's a little unfair of me to
ask him to do it if it doesn't fit with his agenda. I'm happy for him to do
it if he wants to, but if he doesn't then I'd like to get some doco's to
give it a go myself. I'm not a guru by any means, but I can look at other
code (especially the Zalon driver) and learn; I know C and my background is
hardware so it should be possible (steep, maybe, but possible) if I have the
docs.

Cheers,
Matthew van de Werken
Electronics Engineer
CSIRO Exploration & Mining - Gravity Group
1 Technology Court - Pullenvale - Qld - AUSTRALIA - 4069
ph:  +61-7-3327-4685     fax:  +61-7-3327-4455
email:  m.vandewerken@cat.csiro.au (w), mvdw73@one.net.au (h)
