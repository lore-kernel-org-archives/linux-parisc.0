Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from esteban.rebellion (f04v-7-251.d1.club-internet.fr [212.194.66.251])
	by dsl2.external.hp.com (Postfix) with ESMTP id DAAA4482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Jun 2003 03:16:04 -0600 (MDT)
Received: from x-plorer.rebellion
	([192.168.10.1] helo=rebellion ident=badmax)
	by esteban.rebellion with smtp (Exim 3.36 #1 (Debian))
	id 19U0x6-0001kR-00
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Jun 2003 11:16:00 +0200
From: baddy@free.fr
To: parisc-linux@lists.parisc-linux.org
Date: Sun, 22 Jun 2003 10:17:06 +0200
Message-ID: <yam9303.300.149243336@esteban.rebellion>
MIME-Version: 1.0
Content-Type: text/plain
Subject: [parisc-linux] ARP resolution trouble
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

I've got a B132L+ under 2.4.20-pa23 and I am encountering with ARP 
request/resolution : sometimes my B132 become unreachable from some
machines of my LAN. Every host is concerned and it seems to happen
every times the host is idle on the LAN.

Here is what I saw :

    - the ARP mechanism flush the mac address table of the host (due
    to a timeout because the host was idle). If the host want to reach the
    B132, it has to make an ARP request.

    - this request is not see at all by the B132L which already have the
    mac address of the host in his mac address table (I think it is because
    the B132L keep it from a previous trafic).

    - the host must do a broadcast (a ping broadcast for example) to be
    beeing reachable again from the B132.

    - if I keep a connection open between the host and the B132 (like a
    ssh session for example), this never happen.

Any idea ?
