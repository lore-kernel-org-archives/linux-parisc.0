Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 121254848
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 11:49:08 -0600 (MDT)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by atlrel2.hp.com (Postfix) with ESMTP id A3114C4C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 13:49:07 -0400 (EDT)
Received: from there (eeyore.fc.hp.com [15.1.54.199])
	by ldl.fc.hp.com (Postfix) with SMTP id 6513D43FA
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 11:48:57 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Bjorn Helgaas <bjorn_helgaas@hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] More strange problems
Date: Thu, 27 Sep 2001 11:51:15 -0600
References: <20010927113453.F16693@hp.is> <20010927143556.K16693@hp.is> <20010927155752.D16096@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20010927155752.D16096@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <20010927174857.6513D43FA@ldl.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> > r0-3     00000000 00000008 0007c7b7 bff00938
> > ...
> >  IIR: 48340038    ISR: 00000014  IOR: 00000024
> >  CPU:        0   CR30: 29164000 CR31: 10350000
> >  ORIG_R28: 00206000
>
> The truly dedicated will decode IIR to see what instruction it was,
> cross-check which register in the dump was wrong then try to debug
> the program.

Decoding IIR is actually pretty easy if you have an HP-UX system with adb:

$ echo "0x48340038=i" | adb
                LDW             28(r1),r20

adb prints the offset in decimal, so this is 0x1c(0x8) = 0x24, which 
matches the IOR.  I wish I knew how to do the same with gdb.
