Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7E2174867
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Jun 2002 09:44:03 -0600 (MDT)
To: Joachim Steiger <roh@hyte.de>
Subject: Re: [parisc-linux] serial on hp712/80 buggy?
Message-ID: <1024587807.3d11f81f99d8d@webmail.tiscalinet.be>
Date: Thu, 20 Jun 2002 17:43:27 +0200 (CEST)
From: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
References: <Pine.LNX.4.21.0206201644330.4291-100000@reactor.hyte.de>
In-Reply-To: <Pine.LNX.4.21.0206201644330.4291-100000@reactor.hyte.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Quoting Joachim Steiger <roh@hyte.de>:

> 
> i just played around with my machine and stated that setting the
> baudrate
> on the serial(rs232) to 57600(8n1) didnt work...
> using 9600baud works ok
> 
> i was using minicom to connect to another machine (an embed. ppc) via
> nullmodem-cable
> 
> i was using minicom on my pc in the same config (debian unstable,
> 2.4.16-adc1 on the pc, debian unstable, 2.4.17-32 from debian on the
> hppa)
> 
> anybody noticed a similar behaviour?
> or are just all baudrates other than 9600 broken on the hppa-kernel?
> 
On my 712/80, I also experiment some problems when I try to connect my ISP via
ppp;
"pon MyIsp" failled as follow :
...
Jun 20 18:35:30 palinux2 chat[18284]: send (ATZ^M)
Jun 20 18:35:30 palinux2 chat[18284]: expect (OK)
Jun 20 18:36:15 palinux2 chat[18284]: alarm
Jun 20 18:36:15 palinux2 chat[18284]: send (AT^M)
Jun 20 18:36:15 palinux2 chat[18284]: expect (OK)
Jun 20 18:37:00 palinux2 chat[18284]: alarm
Jun 20 18:37:00 palinux2 chat[18284]: Failed
Jun 20 18:37:00 palinux2 pppd[18283]: Connect script failed
Jun 20 18:37:01 palinux2 pppd[18283]: Exit.
...

But do not find enough time to investigate in much detail this problem, sorry :(

Joel

PS: this same modem connection works perfectly from a pc?

-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
