Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA22264
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Jan 2000 16:26:50 -0700
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id RAA28990
	for parisc-linux@thepuffingroup.com; Fri, 14 Jan 2000 17:27:21 -0500
Date: Fri, 14 Jan 2000 17:27:21 -0500
From: Matthew Wilcox <willy@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000114172721.V11300@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Minutes
List-ID: <linux-parisc.vger.kernel.org>


Summary of the IRC meeting held 14/Jan/2000

Participants:

Michael Ang
Paul Bame
Grant Grundler
R. Scott Holbrooke
David Kennedy
Dave O'Neill
Martin Peterson
Philipp Rumpf
Matthew Wilcox

1. The 2.3 configuration needs some work.  David will investigate.

2. The decision was taken to not forward-port the real-exe code from 2.2
   to 2.3.  Philipp will write some documentation about how to debug
   real-mode assembler code.

3. PCI has been tested to a limited extent.  It enumerates devices, but
   an unrelated bug is preventing further testing.

4. Martin has cleaned up the serial and console code.  He will commit his
   changes tomorrow after he's tested it.

5. Scott has looked at the checksumming code and will hopefully get some
   time to work on it this coming week.

6. Paul has been looking at ftr's debug code.

7. Matthew will describe the new __initcall feature in an email to the list.

8. Paul is thinking about a wide-mode bootloader.

9. Dave is working on getting the SOM linker to work on i386 Linux.  philipp
   has some additional patches he will send.

10. Signals were discussed and no-one felt that they wanted to deal with
    them.

11. Deb was nominated to draw a martini glass.
