Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from courbet.kerguelen.org (catv9055.extern.kun.nl [131.174.119.55])
	by dsl2.external.hp.com (Postfix) with ESMTP id 21596482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Jan 2002 09:47:51 -0700 (MST)
Received: from loranchet.kerguelen.org (loranchet.kerguelen.org [172.16.0.4])
	by courbet.kerguelen.org (8.11.3nb1/8.11.0) with ESMTP id g08GllV17503
	for <parisc-linux@lists.parisc-linux.org>; Tue, 8 Jan 2002 17:47:48 +0100 (CET)
Received: from loranchet.kerguelen.org (localhost [127.0.0.1])
	by loranchet.kerguelen.org (8.11.3nb1/8.11.0) with ESMTP id g08Gld801781
	for <parisc-linux@lists.parisc-linux.org>; Tue, 8 Jan 2002 17:47:40 +0100 (CET)
Message-Id: <200201081647.g08Gld801781@loranchet.kerguelen.org>
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 08 Jan 2002 17:47:39 +0100
From: Jaap Boender <jaapb@kerguelen.org>
Subject: [parisc-linux] Installing from network
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

Hi,

I've got a 712/60, on which I'd like to install Linux. So, being of simple
mind, I downloaded the palinux-0.9.3-base ISO image and set up DHCP so the
712 boots this file. This works quite well - up to a point. The image boots,
and the installer starts; however, when it wants to install a kernel and
drivers onto the hard drive, it hangs. I can restart the installer with Ctrl-C
at this point, but I can't get past this point in the installation. 

Manually unpacking the drivers.tgz file from a shell gives the same result.

So, am I doing something wrong, or is it simply lack of memory (the box only
has 16 Mb), or should I just boot another way? I'd appreciate any help.

Yours,

  Jaap Boender
---
Coffee, Coffee muﬂ ich haben,
Und wenn jemand mich will laben,
Ach, so schenkt mir Coffee ein!
  -- J.S. Bach / Picander, Kaffee-Kantate
