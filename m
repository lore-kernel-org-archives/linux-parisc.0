Return-Path: <ajwalker@broadpark.no>
Received: from mail.broadpark.no (mail.broadpark.no [217.13.4.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8CB3348F3
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  8 Mar 2004 03:55:37 -0700 (MST)
Received: from tolstoy.puszczka.com (47.80-202-73.nextgentel.com
	[80.202.73.47])
	by mail.broadpark.no (Postfix) with ESMTP id 9E785774F
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  8 Mar 2004 11:55:35 +0100 (MET)
Message-ID: <42526.193.161.152.244.1078743801.squirrel@www.puszczka.com>
Date: Mon, 8 Mar 2004 12:03:21 +0100 (CET)
From: "Andy Walker" <ajwalker@broadpark.no>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Subject: [parisc-linux] No PS2 keyboard/mouse on B132L, 2.6.[34]
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

I've a B132L running Gentoo. With 2.4 I had the PS/2 keyboard working fine
throught a Raritan Compuswitch KVM, but the mouse (wireless Intellimouse
clone - 2 buttons pluss roller/middle) was dead. Decided to try out 2.6
partly to excercise udev, but mostly in the hope that all the input layer
work and pS/2 changes would bring the mouse to life. I should probably add
that there are two more machines on the KVM - a PC running 2.6.3 which runs
the mouse and keyboard flawlessly, and another PC running 2.4.24 that also
has no problems.

To the point - 2.6.3-pa0 from Gentoo hppa-dev-kernel leaves both keyboard
and mouse dead. 2.6.4-rc1-pa2 fetched by hand does exactly the same. Some
info below:
