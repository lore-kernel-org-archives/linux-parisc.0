Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA18829
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Jan 2001 15:36:05 -0700
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel2.hp.com (Postfix) with ESMTP id EFB7B844
	for <parisc-linux@thepuffingroup.com>; Mon, 22 Jan 2001 17:39:54 -0500 (EST)
To: parisc-linux@thepuffingroup.com
Cc: taggart@carmen.fc.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 22 Jan 2001 15:41:52 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010122224152.13E5038379@carmen.fc.hp.com>
Subject: [parisc-linux] Pinout for 712 AUI/RS232 Y-cable
List-ID: <linux-parisc.vger.kernel.org>


Pinout for RS232/AUI cable(A2263-62045) for 712 card (A2263-66536)
------------------------------------------------------------------
There is a card for the 712(HP part #A2263-66536) that provides 2nd AUI lan
and 2nd DB9 RS232 port. The back of the card has a 26 pin connector and the
15pin AUI and 9pin RS232 connectors are provided by a special Y cable
(A2263-62045) which are pretty hard to find. Here is the pinout of this cable
in case you need to make one.

These diagrams are looking at the end of the connector not the back. Make
sure to take that into account if building a cable. Pin numbering is taken
from the numbers on the plastic in the cable. If a pin is not connected it
is represented as an "o". The numbers outside the bottom connectors are the
pin numbers that that pin is connected to on the top connector.


                 ---------------------------------
                 \     o  o  3  o  o  o  7  8  9 /
                  \  10 11 12 13  o  o 16 17 18 /
                   \  19 20 21 22  o 24 25 26  /
                     -------------------------

               12 13    20 19                 18  9  8  7  24
       ---------------------------           -----------------
  AUI   \ o  o  6  5  o  3  2  o /           \ 1  2  3  4  5 / RS232
         \  o 10 11 12  o 14 15 /             \  6  7  8  9 /
          ---------------------                ------------
              22 21  3    11 10                 26 25 17 16


Send questions or problems to Matt Taggart <taggart@fc.hp.com>
