Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA07056
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Feb 2000 14:37:31 -0700
Received: from hpdst41.cup.hp.com (hpdst41.cup.hp.com [15.16.128.62])
	by palrel3.hp.com (Postfix) with ESMTP id 1BD6713EB
	for <parisc-linux@thepuffingroup.com>; Fri, 11 Feb 2000 11:17:59 -0800 (PST)
Received: from cup.hp.com (hpdst231.cup.hp.com [15.16.129.192]) by hpdst41.cup.hp.com with ESMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id LAA27357 for <parisc-linux@thepuffingroup.com>; Fri, 11 Feb 2000 11:17:58 -0800 (PST)
Message-ID: <38A460A1.42E46FC6@cup.hp.com>
Date: Fri, 11 Feb 2000 11:18:57 -0800
From: Ullas Ponnadi <uponnadi@cup.hp.com>
MIME-Version: 1.0
Cc: parisc-linux@thepuffingroup.com
References: <200002111838.NAA12763@vorlon.dynacan.org>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Building the PA-RISC 2.0 kernel with the GCC tool chain
List-ID: <linux-parisc.vger.kernel.org>

John Curry and myself have been looking at the PA-RISC 2.0 Port. Here are
some things that I have tried using the latest GCC tool chain.

- I have been able to build an ELF-64 binary using the tool chain. The tools
that
  I have used are:
        - gcc version 2.9-hppa-991112
        - GNU ld version 2.9-hppa-991112 (with BFD 2.9-hppa-991112)
        - GNU Make version 3.77

- I have used a bare bone kernel for the build.

- Most of the assembly files are stubbed out since the assembler directives and
in
  some cases, assembly tricks do not work on the 64 bit architecture.

- The purpose of the build was to test the tool chain and deal with any 64 bit
issues,
   so no tests have been done:-).

Hope this information is useful for anyone trying to work on a PA-RISC 2.0
Port.

Ullas
