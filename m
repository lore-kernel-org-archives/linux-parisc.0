Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.65.60])
	by dsl2.external.hp.com (Postfix) with SMTP id 0F65A482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 24 Nov 2002 11:00:24 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Date: Sun, 24 Nov 2002 18:57:52 +0100
MIME-Version: 1.0
Message-Id: <200211241857.37851.deller@gmx.de>
Content-Type: text/plain;
  charset="us-ascii"
Subject: [parisc-linux] Problems booting kernels 2.5.4x on c3000
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

I've tracked down my bootproblems on a c3k with kernel 2.5.4x (e.g. 2.5.47-pa8)
to the functions
  pdc_suspend_usb()				[in arch/parisc/kernel/inventory.c]
and
  pdc_pci_irt_size(&num_entries, 0);  [in drivers/parisc/iosapic.c]
which are both defined in firmware.c and work without problems in the 2.4 kernels.

Anybody has an idea what's going on here ?

Helge
