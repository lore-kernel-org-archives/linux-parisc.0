Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from omta05.mta.everyone.net (sitemail3.everyone.net [216.200.145.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9759D4832
	for <parisc-linux@lists.parisc-linux.org>; Sat, 25 May 2002 13:54:24 -0600 (MDT)
Received: from sitemail.everyone.net (dsnat [216.200.145.62])
	by omta05.mta.everyone.net (Postfix) with ESMTP id D04E147EB5
	for <parisc-linux@lists.parisc-linux.org>; Sat, 25 May 2002 12:54:23 -0700 (PDT)
Content-Type: text/plain
Mime-Version: 1.0
Date: Sat, 25 May 2002 12:54:23 -0700 (PDT)
From: Stacy Olivas <olivas@eurisko.ws>
To: parisc-linux@lists.parisc-linux.org
Reply-To: olivas@eurisko.ws
Message-Id: <20020525195423.BE4A636F9@sitemail.everyone.net>
Subject: [parisc-linux] Getting a 750 to boot
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

Hello,
I recently acquired an Apollo 9000/750 system and would like to load up PALINUX on it.  Unfortunately, I do not have anything other than the system (with a serial console).  No documentation, etc.

When I boot the system up it has the following:

(c) Copyright.  Hewlett-Packard Company.  1991.
All rights reserved

PDC ROM rev. 1.2
IODC ROM rev. 1.0
128 MB of memory configured and tested.


Selecting a system to boot.

Hard booted.

ISL Revision A.00.38 OCT 26, 1994

ISL booting  hpux
Exec failed: Cannot find /stand/vmunix or /vmunix.

ISL> 

I've attempted to hookup a SCSI cd-rom drive to the system, and it briefly looks at it before going to the screen above.

How can I get this beast to boot?  It has 2 HD's in it and a tape backup/floppy unit on it as well.  It also has a network card in it, (a TPT 92 series 802.3 10BASE-T Transciever with Lanview hooked into the AUI port on the back).

Any help will be greatly appreciated.
