Return-Path: <cbeerse@lycos.nl>
Received: from lmfilto02.st1.spray.net (lmfilto02.st1.spray.net
	[212.78.202.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9776148F7
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 22 Mar 2004 09:41:50 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by lmfilto02.st1.spray.net (Postfix) with ESMTP id C7A1F1213F
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 22 Mar 2004 16:41:48 +0000 (GMT)
Received: from lmsmtp01.st1.spray.net ([212.78.202.111])
	by localhost (lmfilto02.st1.spray.net [212.78.202.32]) (amavisd-new,
	port 10024)
	with ESMTP id 06367-06 for <parisc-linux@lists.parisc-linux.org>;
	Mon, 22 Mar 2004 17:41:48 +0100 (CET)
Received: from lycos.nl (unknown [193.172.135.148])
	by lmsmtp01.st1.spray.net (Postfix) with ESMTP id 7A8BEE1
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 22 Mar 2004 16:41:46 +0000 (GMT)
Message-ID: <405F1749.9010809@lycos.nl>
Date: Mon, 22 Mar 2004 17:41:45 +0100
From: =?ISO-8859-1?Q?Corn=E9_Beerse?= <cbeerse@lycos.nl>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] HP D370, kernel 2.6.x and configuration file
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello,

I'm intending to build kernel 2.6.4 for a HP D370 and I'm running into some 
problems. The major one is the next error while doing the `make`:

arch/parisc/kernel/pdc_cons.c:102: `CON_BOOT' undeclared here (not in a function)
arch/parisc/kernel/pdc_cons.c:102: initializer element is not constant
arch/parisc/kernel/pdc_cons.c:102: (near initialization for `pdc_cons.flags')


I've tried to build without any console except for a serial console maily 
because there is no other console on this hardware but also without success.

Hence my questions:

Does someone happen to have a configuration file for the D370? Can I get it 
somewhere?
Is there a reason NOT to build 2.6.x on this D300 hardware?

My major reason is to get the second processor in the machine also do some work, 
I don't care about 64 bits, hence 32 bits will do.




Thanks

CBee
