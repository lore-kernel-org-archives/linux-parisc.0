Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from inca.herrera.edu (pool-151-201-36-107.pitt.east.verizon.net [151.201.36.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 849D6482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Mar 2002 20:43:57 -0700 (MST)
Received: from neuronet.pitt.edu (localhost [127.0.0.1])
	by inca.herrera.edu (8.11.6/8.11.6/SuSE Linux 0.5) with ESMTP id g2M3Gmj03094
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Mar 2002 22:16:48 -0500
Message-ID: <3C9AA220.6030201@neuronet.pitt.edu>
Date: Thu, 21 Mar 2002 22:16:48 -0500
From: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] EISA 100/10 add-on card on a 715/80
References: <3C92DD15.4060008@neuronet.pitt.edu>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
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

Hello,

This time a brought a 715/80 model to test the EISA network card. I do 
not get a kernel BUG.

The network interface is brought up, but I can't connect to the rest of 
the machines in my lan.

I connected the card's 10 BaseT port to my switch.

While trying to ping from the parisc box to my linux PC I get this from 
tcpdump, *.2 is the PC and *.21 is the parisc:

22:04:31.926833 192.168.0.21 > 192.168.0.2: icmp: echo request (DF)
22:04:31.926903 192.168.0.2 > 192.168.0.21: icmp: echo reply [tos 0x10]
22:04:32.926816 192.168.0.21 > 192.168.0.2: icmp: echo request (DF)
22:04:32.926913 192.168.0.2 > 192.168.0.21: icmp: echo reply [tos 0x10]
22:04:33.926793 192.168.0.21 > 192.168.0.2: icmp: echo request (DF)
22:04:33.926885 192.168.0.2 > 192.168.0.21: icmp: echo reply [tos 0x10]
22:04:34.926769 192.168.0.21 > 192.168.0.2: icmp: echo request (DF)
22:04:34.926858 192.168.0.2 > 192.168.0.21: icmp: echo reply [tos 0x10]

Any comments?

P.S. Is there a way to make the hp100 driver bind to eth1 and the built 
in interface bind to eth0?

Thanks.
-- 
      Rafael
