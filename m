Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel2.hp.com (palrel2.hp.com [156.153.255.234])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1F1D3482A
	for <parisc-linux@parisc-linux.org>; Mon, 14 May 2001 14:04:45 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Bjorn Helgaas <bjorn_helgaas@hp.com>
To: Matthew Wilcox <matthew@wil.cx>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] broken toolchain?
Date: Mon, 14 May 2001 09:18:18 -0600
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
References: <20010513021522.B28266@parcelfarce.linux.theplanet.co.uk> <200105130123.VAA25847@hiauly1.hia.nrc.ca> <20010513022857.D28266@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20010513022857.D28266@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <01051409181800.21483@eeyore>
List-ID: <linux-parisc.vger.kernel.org>

> IASQ: 00000185 00000185 IAOQ: 000127ab 000127af
>  IIR: 4835082e    ISR: 00000185  IOR: 000312e7
> ORIG_R28: bff00000

If you trust IIR:

$ echo 0x4835082e=i | adb
                LDW             1047(r1),r21
