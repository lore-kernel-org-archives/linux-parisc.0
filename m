Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9FDF54829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Oct 2002 23:26:38 -0600 (MDT)
Date: Sun, 20 Oct 2002 01:26:23 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Message-ID: <20021020052623.GA1577@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] GSP on A500 - Level 14 Alert - Output overvoltage?
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

parisc,

Just a quick flitting question that has been in
the back of my mind. When working with an A500
that I have, during a GSP powerdown using "PC", 
I get the following error:

************* SYSTEM ALERT **************
SYSTEM NAME: firin
DATE: 10/19/2002 TIME: 00:24:23
ALERT LEVEL: 14 = Fatal power or environmental problem prevents
operation

REASON FOR ALERT
SOURCE: 4 = power
SOURCE DETAIL: 4 = high voltage DC power   SOURCE ID: FF
PROBLEM DETAIL: 5 = output overvoltage

LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       OFF      OFF           OFF       OFF        FLASH
System Power is Off.

0x002000E544FF404F 00000000 00000000 - type  0 = Data Field Unused
0x582008E544FF404F 00006609 13001817 - type 11 = Timestamp 10/19/2002
00:24:23
A: ack read of this entry - X: Disable all future alert messages
Anything else skip redisplay the log entry
->Choice:

Is this bad for my hardware :} It was ever so 
nice when I was kernel hacking and I could remotely
control the box's power. However, after such an error
I'm told that:


  The system did not respond to the Power-On command.
  Turn the system power switch Off and On again to reset the system.

Which means I need to be there physically :(
Any help on the matter would be much appreciated.

c.
