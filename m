Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA07518
	for <parisc-linux@puffin.external.hp.com>; Wed, 12 Apr 2000 01:11:39 -0600
Received: from localhost (funnyguy@localhost)
	by morph.localdomain (8.9.3/8.9.3) with ESMTP id DAA13836
	for <parisc-linux@thepuffingroup.com>; Wed, 12 Apr 2000 03:11:27 -0400
Date: Wed, 12 Apr 2000 03:11:27 -0400 (EDT)
From: Mike Brancato <funnyguy@digitalsmackdown.net>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.10.10004120254090.13750-100000@morph.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] booting from lan error...
List-ID: <linux-parisc.vger.kernel.org>


Hey Everyone,

Well, I've gone and researched the 735/125 we have again.  Everytime I try
to install HPUX on it, the HD is reporting 0 disk space.  I low-level
format it on my x86 machine, and it starts reporting fine.  I switch the
HD back to the 735 and it reports 0 capacity again, so HPUX won't allow me
to install.  But the real problem is not being able to LAN boot.

bootp won't work with our 735/125.  Search/Autoselect doesn't see
lan.x.x.x as a bootable device.  Is that a problem?  Shouldn't LAN be one
of the boot paths?  I have lan.x.x.x with appropriate values set as the
primary boot path, it requests bootp from one of the j282 machines which
serves as the bootpd for all the netstations in our lab.  If I allow it to
boot to LAN with running "BOOT lan.x.x.x", no packets are being sent, but
it thinks they are. I will double check the cables, but I doubt that is
the problem.  The machine has the Intel slider card, with the HP
transciever on the back.  Even if the cables were bad, wouldn't the
firmware see the lan.x.x.x as a bootable path?  It should be "P0" since it
is the primary path, correct?
Would the slider card be bad?  Everything lights up fine.
Is this a known problem?
Any ideas are welcomed!

Thanks!
mike
