Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from easy.in-chemnitz.de (www.in-chemnitz.de [213.187.65.136])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4E333482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 02:43:03 -0600 (MDT)
Received: (from uucp@localhost)
	by easy.in-chemnitz.de (8.10.2/8.10.2/SuSE Linux 8.10.0-0.3) with UUCP id f8L8h1T04833
	for parisc-linux@lists.parisc-linux.org; Fri, 21 Sep 2001 10:43:01 +0200
Received: from genesis (genesis [192.168.80.3]) by malcolm.in-chemnitz.de (8.7.6/8.7.3) with SMTP id KAA00532 for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 10:35:44 +0200
From: =?iso-8859-1?Q?Andreas_H=E4rtel?= <andreas@malcolm.in-chemnitz.de>
To: "Parisc-Linux (E-Mail)" <parisc-linux@lists.parisc-linux.org>
Date: Fri, 21 Sep 2001 10:38:24 +0200
Message-ID: <000401c14278$c79760e0$0350a8c0@genesis>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] 712/60 boots fine
List-ID: <linux-parisc.vger.kernel.org>

Hi,

my 712 is running now. I've found my own mistake after many hours...

It is difficult to understand for a newbie, that PALO needs file system type
'F0' but this type is unknown by fdisk.
Or the 2. mistake, the partition where vmlinux is located must be lower or
equal 2 GByte.

Thanks

Andreas
