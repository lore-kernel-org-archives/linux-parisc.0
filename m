Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout02.sul.t-online.com (mailout02.sul.t-online.com [194.25.134.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id F030D482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Dec 2001 07:54:17 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: H_Aue@t-online.de (Hinrich Aue)
To: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] DSL on a 715/80 with rp-pppoe
Date: Sat, 29 Dec 2001 15:57:53 +0100
Cc: Grant Grundler <grundler@dsl2.external.hp.com>
MIME-Version: 1.0
Message-ID: <16KKs9-1CicwSC@fwd05.sul.t-online.com>
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

I read another posting, that pppd misses the /sbin/hotplug script.
First I made a script like discribed in the posting, after that I installed 
the hotplug package, both versions had the same problem.

if I do pppd call dsl-privider:
//---------------------------------------
Serial connection established.
using channel 2
Using interface ppp0
Connect: ppp0 <--> /dev/pts/1
read: Resource temporarily unavailable
read /dev/ppp: Resource temporarily unavailable
read: Resource temporarily unavailable
read /dev/ppp: Resource temporarily unavailable
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <magic 0x7c5d0821>]
read: Resource temporarily unavailable
read /dev/ppp: Resource temporarily unavailable
rcvd [LCP ConfReq id=0x66 <mru 1492> <auth pap> <magic 0x3ddff70f>]
sent [LCP ConfRej id=0x66 <auth pap>]
rcvd [LCP ConfAck id=0x1 <asyncmap 0x0> <magic 0x7c5d0821>]
rcvd [LCP ConfReq id=0x67 <mru 1492> <magic 0x3ddff70f>]
sent [LCP ConfAck id=0x67 <mru 1492> <magic 0x3ddff70f>]
sent [LCP EchoReq id=0x0 magic=0x7c5d0821]
kernel does not support PPP filtering
sent [IPCP ConfReq id=0x1 <addr 0.0.0.0> <ms-dns1 0.0.0.0> <ms-dns3 0.0.0.0>]
rcvd [LCP TermReq id=0x68]
LCP terminated by peer
sent [LCP TermAck id=0x68]
Script pppoe -I eth1 finished (pid 297), status = 0x0
Modem hangup
Connection terminated.
//---------------------------------------

It seems strange to me, that the missing hotplug script causes the trap 15.
As I see, there some send and reciieve things done like <auth pap> and stuff.

Q:
Does anybody know why:
"read /dev/ppp: Resource temporarily unavailable"
and
"kernel does not support PPP filtering" ?
What the hell is PPP filtering? Do I have to activate it in the Kernel?
I think that "read /dev/ppp: Resource temporarily unavailable" Is not the 
Problem, perhaps it takes time to init or stuff, but after a while it seems 
to be available, because some messages are recieved and sent.
