Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA10613
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Sep 1999 18:36:55 -0600
Received: from milano.cup.hp.com (grundler@milano.cup.hp.com [15.16.124.11])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id RAA22045
	for <parisc-linux@thepuffingroup.com>; Fri, 3 Sep 1999 17:38:47 -0700 (PDT)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id RAA09488 for parisc-linux@thepuffingroup.com; Fri, 3 Sep 1999 17:36:18 -0700 (PDT)
Date: Fri, 3 Sep 1999 17:36:18 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <199909040036.RAA09488@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
Subject: [parisc-linux] milli.S and 0xd's
List-ID: <linux-parisc.vger.kernel.org>


make[2]: Entering directory `/linux/linux/arch/parisc/lib'
gcc -D__KERNEL__ -I/linux/linux/include -D__ASSEMBLY__  -traditional -c milli.S -o milli.o
milli.S: Assembler messages:
milli.S:16: Error: Rest of line ignored. First ignored character valued 0xd.
milli.S:19: Error: Rest of line ignored. First ignored character valued 0xd.
milli.S:21: Error: Rest of line ignored. First ignored character valued 0xd.
...


I stripped the ^M characters out of the file and it compiles.
Could others explain how they got past this error message?
Could the gcc I'm using be the wrong one?

thanks,
grant
