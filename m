Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from reactor.hyte.de (reactor.hyte.de [212.84.215.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3958D4858
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Jun 2002 08:50:28 -0600 (MDT)
Received: from roh (helo=localhost)
	by reactor.hyte.de with local-esmtp (Exim 3.15 #8)
	id 17L3FI-00017Y-00
	for parisc-linux@lists.parisc-linux.org; Thu, 20 Jun 2002 16:49:12 +0200
Date: Thu, 20 Jun 2002 16:49:12 +0200 (CEST)
From: Joachim Steiger <roh@hyte.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.21.0206201644330.4291-100000@reactor.hyte.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] serial on hp712/80 buggy?
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

i just played around with my machine and stated that setting the baudrate
on the serial(rs232) to 57600(8n1) didnt work...
using 9600baud works ok

i was using minicom to connect to another machine (an embed. ppc) via
nullmodem-cable

i was using minicom on my pc in the same config (debian unstable,
2.4.16-adc1 on the pc, debian unstable, 2.4.17-32 from debian on the hppa)

anybody noticed a similar behaviour?
or are just all baudrates other than 9600 broken on the hppa-kernel?

TIA

roh
