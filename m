Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cce.ru (sr1.cce.ru [80.79.64.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id D67CF4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Aug 2002 00:18:00 -0600 (MDT)
Received: from [80.79.64.37] (account nsem HELO kahuna.cce.ru)
  by cce.ru (CommuniGate Pro SMTP 3.5.9)
  with ESMTP id 277742 for parisc-linux@lists.parisc-linux.org; Fri, 16 Aug 2002 10:18:06 +0400
Message-Id: <5.1.0.14.0.20020816100459.00a76008@mail.cce.ru>
Date: Fri, 16 Aug 2002 10:18:07 +0400
To: parisc-linux@lists.parisc-linux.org
From: Nikolay Semenov <nsem@cce.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: [parisc-linux] 10-pin modular jack on 75/100 and a mouse in X
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

Hi there,

I've install Woody on 75/100 workstation with 10-pin modular jack for 
keyboard and mouse connection and cannot get the mouse working in X.
Can someone tell me how to configure X to get it working?

  (i) if I try /dev/input/mice -- device cannot be open.
  (ii) if I try /dev/psaux -- device be opened but the mouse not working.

Keyboard is working all the time.

Thanks in advance,

Nikolay 
