Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 08699482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  9 Aug 2001 09:50:37 -0600 (MDT)
From: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Message-Id: <200108091550.IAA08745@chrome.rose.hp.com>
Subject: Re: [parisc-linux] more serial console problems on D310 
To: grundler@puffin.external.hp.com
Date: Thu, 09 Aug 2001 8:50:31 PDT
Cc: djweis@sjdjweis.com, parisc-linux@lists.parisc-linux.org
In-Reply-To: <200108091522.JAA13437@puffin.external.hp.com>; from "Grant Grundler" at Aug 9, 101 8:25 am
List-ID: <linux-parisc.vger.kernel.org>

| I look at the HW database and it seems the D310 has two LASI (core_adapter)
| chips (and WAX, no PCI). I suspect the detection of serial ports misnumbers
| them (ie parisc-linux finds them in the wrong order) or we only properly
| handle one of the two LASI's.

It may seem like that in the HW database, but there is never more than one
LASI in a d-class system, the LASI is on the main system board, so it's always
there regardless of which processor asssembly gives the d-class its flavor,
and no processor board or add-in card ever contained a second LASI.

The serial port labeled console is attached to the LASI rs-232 unless an
access port card is plugged into the access port capable slot. If an 
access port card is present, then the RS-232 signals from it are routed
to the console connector instead.

Check the system to see if there is an AP card. If there is, then you 
might need to remove it. When I played with some d-classes very early on 
in the port, I had to take the AP card out.  The inside door of your 
d-class system should have a nice diagram showing you how to find the 
AP card. It's an HSC card with two small extra connectors and on the
bulkhead is an LED, a small switch, an serial connector and a tiny
modem connector.

KMB
--
+======================================================================+
|       Kirk Bresniker          (916) 748-2393                         |
|       8000 Foothills Blvd                                            |
|       Roseville, CA 95747-5731                                       |
|       kirkb@rose.hp.com                                              |
