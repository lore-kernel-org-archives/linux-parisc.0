Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA22072
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Oct 1999 00:04:42 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id CAA25046
	for <parisc-linux@thepuffingroup.com>; Mon, 4 Oct 1999 02:24:08 -0400
Sender: adevries@thepuffingroup.com
Message-ID: <37F84808.D8E48C4C@thepuffingroup.com>
Date: Mon, 04 Oct 1999 02:24:08 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] ethernet driver...
List-ID: <linux-parisc.vger.kernel.org>


I've cleaned up dino.c sufficiently that tulips are detected, although
somewhat broken still:

  The PCI BIOS has not enabled this device!  Updating PCI command
1011->1015.   
tulip.c:v0.89H 5/23/98
becker@cesdis.gsfc.nasa.gov                              
eth0: Digital DS21140 Tulip at 0x82223800, EEPROM not present, 00 4c 69
6e 75 7.
eth0: Old style EEPROM -- no media selection
information.                       
  PCI latency timer (CFLT) is unreasonably low at 0.  Setting to 64
clocks.     
  The PCI BIOS has not enabled this device!  Updating PCI command
1011->1015.   
eth1: Digital DS21142/3 Tulip at 0xff00, EEPROM not present, 00 4c 69 6e
75 7a,.
eth1: Old style EEPROM -- no media selection
information.                       
  PCI latency timer (CFLT) is unreasonably low at 0.  Setting to 64
clocks.     

Two things to note here:
- I'm not running pcibios_fixup (or whatever) yet, haven't figured out
what this is supposed to do
- in tulip.c, there's really only one addition having to do with EEPROM
detection, and I think I've messed that up.  The MACs shown are
incorrect.

We're getting to the point where most PCI devices will start to be
detected.

- Alex
-- 
Alex deVries
Vice President of Engineering
The Puffin Group
