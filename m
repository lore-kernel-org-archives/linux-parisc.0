Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12506.mail.yahoo.com (web12506.mail.yahoo.com [216.136.173.198])
	by dsl2.external.hp.com (Postfix) with SMTP id 9A1954829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Aug 2002 12:56:34 -0600 (MDT)
Message-ID: <20020812185633.86255.qmail@web12506.mail.yahoo.com>
Date: Mon, 12 Aug 2002 11:56:33 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] Additional Network Cards for 712
To: Harri Haataja <harri.haataja@cs.helsinki.fi>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020812211608.B37236@azrael.smilehouse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

--- Harri Haataja <harri.haataja@cs.helsinki.fi> wrote:
> On Mon, Aug 12, 2002 at 07:12:47PM +0100, Matthew Wilcox wrote:
> > On Mon, Aug 12, 2002 at 07:46:49PM +0200, Thomas Schmid wrote:
> > > 1) Are there any add-on NICs for the 712 available (preferably
> for
> > > only little money) ?
> > they're very specialised and quite rare.
> > 
> > > 2) More important, are they supported by the kernel ?
> > yes, they're the same chip as is on the motherboard, and the driver
> > handles multiple devices.
> 
> Did 712 have EISA? Anyway, 715 does. Are there any (E)ISA cards
> supported by the linux kernel? Is there an HCL for cards?
> 
If you are interested in the part# here it is A2263-66536 HP list price
from our internal site is $410.00.

Quick search of the parisc/linux yeilded:

Pinout for RS232/AUI cable(A2263-62045) for 712 card (A2263-66536)
------------------------------------------------------------------
There is a card for the 712(HP part #A2263-66536) that provides 2nd AUI
lan
and 2nd DB9 RS232 port. The back of the card has a 26 pin connector and
the
15pin AUI and 9pin RS232 connectors are provided by a special Y cable
(A2263-62045) which are pretty hard to find. Here is the pinout of this
cable
in case you need to make one.

These diagrams are looking at the end of the connector not the back.
Make
sure to take that into account if building a cable. Pin numbering is
taken
from the numbers on the plastic in the cable. If a pin is not connected
it
is represented as an "o". The numbers outside the bottom connectors are
the
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

Hope this helps......by the way if you can find a V-Class test station
console that is a 712, it has the additional LAN/RS-232 card.

derek

__________________________________________________
Do You Yahoo!?
HotJobs - Search Thousands of New Jobs
http://www.hotjobs.com
