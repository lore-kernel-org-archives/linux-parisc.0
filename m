Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.centraltx.com (gapserver.centraltx.com [64.209.39.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE0634829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Sep 2002 10:41:53 -0600 (MDT)
Date: Mon,  2 Sep 2002 11:38:20 -0500
Message-Id: <200209021138.AA3341287994@mail.centraltx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: "marc " <marc@centraltx.com>
Reply-To: <marc@centraltx.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] Network Problems
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

Anyone have any ideas why I get innundated with these messages on
startup and have to do a control-c to get past this part and continue booting?

Configuring network interfaces: eth0: Transceiver problem.
ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
skb: pf=2 (unowned) dev=lo len=328
PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
skb: pf=2 (unowned) dev=lo len=328
PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
skb: pf=2 (unowned) dev=lo len=328
PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
skb: pf=2 (unowned) dev=lo len=328
PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
skb: pf=2 (unowned) dev=lo len=328
PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16

ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
skb: pf=2 (unowned) dev=lo len=328
PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
