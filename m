Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA31592
	for <parisc-linux@puffin.external.hp.com>; Wed, 13 Dec 2000 14:16:28 -0700
Received: from lxplus015.cern.ch (IDENT:root@lxplus015.cern.ch [137.138.161.112])
	by smtp1.cern.ch (8.9.3/8.9.3) with ESMTP id WAA06642
	for <parisc-linux@thepuffingroup.com>; Wed, 13 Dec 2000 22:18:04 +0100 (MET)
Sender: Jes.Sorensen@cern.ch
To: parisc-linux@thepuffingroup.com
From: Jes Sorensen <jes@linuxcare.com>
Date: 13 Dec 2000 22:18:03 +0100
In-Reply-To: Grant Grundler's message of "Wed, 06 Dec 2000 15:34:37 -0800"
Message-ID: <d3snnsyq9g.fsf@lxplus015.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] ld.so fix
List-ID: <linux-parisc.vger.kernel.org>

Hi

I checked in one more fix for ld.so earlier today, with that and my
previous patches I am now able to rebuild glibc with shared libraries
natively.

I think there have been some ABI changes inbetween the current glibc
and the stuff that was distributed as .deb's earlier so there might be
compat changes.

However at least glibc seems to work now (I think).

Jes
