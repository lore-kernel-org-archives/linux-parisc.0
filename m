Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc2-hem11-4-cust120.bre.cable.ntl.com [213.107.176.120])
	by dsl2.external.hp.com (Postfix) with ESMTP id E48E54829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Aug 2002 14:38:40 -0600 (MDT)
Date: Thu, 15 Aug 2002 20:33:19 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Cc: Harri Haataja <harri.haataja@cs.helsinki.fi>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Additional Network Cards for 712
Message-ID: <20020815193318.GB897@sleepie.demon.co.uk>
References: <20020812211608.B37236@azrael.smilehouse.com> <20020812185633.86255.qmail@web12506.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020812185633.86255.qmail@web12506.mail.yahoo.com>
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

On Mon, Aug 12, 2002 at 11:56:33AM -0700, Derek Engelhaupt wrote:
> Quick search of the parisc/linux yeilded:
>                  ---------------------------------
>                  \     o  o  3  o  o  o  7  8  9 /
>                   \  10 11 12 13  o  o 16 17 18 /
>                    \  19 20 21 22  o 24 25 26  /
>                      -------------------------
> 
>                12 13    20 19                 18  9  8  7  24
>        ---------------------------           -----------------
>   AUI   \ o  o  6  5  o  3  2  o /           \ 1  2  3  4  5 / RS232
>          \  o 10 11 12  o 14 15 /             \  6  7  8  9 /
>           ---------------------                ------------
>               22 21  3    11 10                 26 25 17 16

I believe that diagram is wrong; note how the numbering on the AUI
connector is shown as going right to left on the top row, and left to
right on the bottow row.  D-type connectors are normally numbered in the
same direction on all rows, as the other two in the above are numbered.
Anyway, I reversed the bottom row of the AUI diagram, built a cable, and
it worked.  My notes are below.

Many thanks to Matt for the original info anyway, without that I'd have
been stuck.

Richard



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

<pre>

                 ---------------------------------
                 \   .o .o .3 .o .o .o .7 .8 .9  /
                  \ 10 11 12 13 .o .o 16 17 18 /
                   \ 19 20 21 22 .o 24 25 26  /
                     -------------------------

                12 13    20 19         18  9  8  7 24
        ---------------------------  -----------------
  AUI   \ .o .o .6 .5 .o .3 .2 .o /  \ .1 .2 .3 .4 .5 / RS232
         \ .o 14 13 12 .o 10 .9 /     \ .6 .7 .8 .9  /
          ---------------------         ------------
              22 21  3    11 10         26 25 17 16 

26 way		15 way		26 way		9 way

3	white	12		7	black	4
10	yellow	9		8	brown	3
11	blue	10		9	purple	2
12	black	6		16	yellow	9
13	brown	5		17	red	8
19	grey	2		18	green	1
20	red	3		24	grey	5
21	pink	13		25	liblue	7
22	green	14		26	pink	6

</pre>
