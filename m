Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 99F31482A
	for <parisc-linux@parisc-linux.org>; Fri, 13 Apr 2001 09:09:31 -0600 (MDT)
Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by atlrel1.hp.com (Postfix) with ESMTP id AC6A8D1D
	for <parisc-linux@parisc-linux.org>; Fri, 13 Apr 2001 11:09:30 -0400 (EDT)
Received: from noam.fc.hp.com (mail@noam.fc.hp.com [15.1.52.69])
	by hpfcla.fc.hp.com (8.9.3 (PHNE_22672)/8.9.3 SMKit7.01) with ESMTP id JAA22719
	for <parisc-linux@parisc-linux.org>; Fri, 13 Apr 2001 09:09:29 -0600 (MDT)
Received: from localhost
	([127.0.0.1] helo=fc.hp.com ident=bame)
	by noam.fc.hp.com with esmtp (Exim 3.12 #1 (Debian))
	id 14o5CT-0004yC-00
	for <parisc-linux@parisc-linux.org>; Fri, 13 Apr 2001 09:09:29 -0600
To: parisc-linux@parisc-linux.org
Date: Fri, 13 Apr 2001 09:09:29 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E14o5CT-0004yC-00@noam.fc.hp.com>
Subject: [parisc-linux] floating point
List-ID: <linux-parisc.vger.kernel.org>

Yesterday I committed a bunch of floating-point stuff, so if you have
a floating-point app (SETI?) which was failing before, grab a new
set of kernel sources and give it a try.

	-P
