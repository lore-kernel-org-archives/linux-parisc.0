Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-3.cisco.com (sj-msg-core-3.cisco.com [171.70.157.152])
	by dsl2.external.hp.com (Postfix) with ESMTP id 42645482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 12:38:18 -0700 (MST)
Received: from mira-sjc5-9.cisco.com (mira-sjc5-9.cisco.com [171.71.163.32])
	by sj-msg-core-3.cisco.com (8.11.3/8.9.1) with ESMTP id g0BJbok07182
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 11:37:50 -0800 (PST)
Message-Id: <4.3.2.7.2.20020111113403.03f1b330@mira-sjc5-9.cisco.com>
Date: Fri, 11 Jan 2002 11:38:02 -0800
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
From: Christian Suder <csuder@cisco.com>
Subject: Re: [parisc-linux] How to configure EISA network card in 715/80
In-Reply-To: <3C3F0DD1.4040508@verizon.net>
References: <3C3F06DD.6050409@verizon.net>
 <20020111154337.D26644@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

I do see those same messages :


>PCI or EISA Host Bus Adapter 0 not registered. in16(0x100) returning -1

running newer kernels on a C110 with a NE1000 NIC. With 2.4.9-pa23 it works 
nicely. Here is the output with a newer kernel 2.4.17-pa3 :

15. Raven T' Wax EISA BA (11) at 0xfc000000 [8/20/5], versions 0x1e, 0x0, 
0x90,
  additional addresses: 0xf4000000
16. U2-IOA BC GSC+ Port (7) at 0xf5fbf000 [8/63], versions 0x501, 0x1, 0xc
17. U2-IOA BC Runway Port (12) at 0xfff8a000 [10], versions 0x580, 0x7, 0xb
18. Coral SGC Graphics (10) at 0xf6000000 [10/20], versions 0x4, 0x0, 0x77
19. U2-IOA BC GSC+ Port (7) at 0xf5fff000 [10/63], versions 0x501, 0x1, 0xc
20. Raven 120 T' (0) at 0xfffa0000 [32], versions 0x58e, 0x0, 0x4
21. SkyHawk 100/120 (1) at 0xfffb1000 [49], versions 0x49, 0x0, 0x9
CPU(s): 1 x PA7200 (PCX-T') at 120.000000 MHz
ccio found U2 at 0xfff88000
ccio found U2 at 0xfff8a000
Lasi version 0 at 0xffd00000 found.
Wax at 0xffe00000 found.
Wax: HIL Keyboard-NMI registered.
Wax EISA Adapter found at 0xfc000000
EISA: failed to claim EISA Bus address space!

Note the message in the last line !

Maybe that gives some hint what its going on,

         Christian
