Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA14657
	for <parisc-linux@puffin.external.hp.com>; Wed, 9 Feb 2000 15:06:03 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.16.124.11])
	by palrel1.hp.com (Postfix) with ESMTP id 951338EC
	for <parisc-linux@thepuffingroup.com>; Wed,  9 Feb 2000 12:59:03 -0800 (PST)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0.1) id NAA13944 for parisc-linux@thepuffingroup.com; Wed, 9 Feb 2000 13:00:00 -0800 (PST)
Date: Wed, 9 Feb 2000 13:00:00 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200002092100.NAA13944@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
Subject: [parisc-linux] CONFIG_SERIAL_GSC
List-ID: <linux-parisc.vger.kernel.org>

Hi folks,
Can someone explain why "#define CONFIG_SERIAL_GSC" is in serial.h?

Users of asm/serial.h are:

grundler <765>find . -name '*.[ch]' | xargs fgrep "asm/serial.h"
./arch/mips/baget/vacserial.c:#include <asm/serial.h>
./drivers/char/ip2main.c:#include <asm/serial.h>
./drivers/char/mac_SCC.h:/* MSch: gone to <asm/serial.h> */
./drivers/char/serial.c:#include <asm/serial.h>
./drivers/char/synclink.c:#include <asm/serial.h>
./drivers/gsc/lasi.c:#include <asm/serial.h>


I have the impression it's going to be difficult to build a "PCI"
serial driver with CONFIG_SERIAL_GSC defined.

thanks,
grant
