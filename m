Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pop007pub.verizon.net (unknown [206.46.170.234])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3BAC8482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 08:37:55 -0700 (MST)
Received: from verizon.net (pool-151-201-226-132.pitt.east.verizon.net [151.201.226.132])
	by pop007pub.verizon.net  with ESMTP
	for <parisc-linux@lists.parisc-linux.org>; id g0BFblSM026261
	Fri, 11 Jan 2002 09:37:48 -0600 (CST)
Message-ID: <3C3F06DD.6050409@verizon.net>
Date: Fri, 11 Jan 2002 10:38:05 -0500
From: Rafael Herrera <vze26vn8@verizon.net>
Reply-To: raffo@neuronet.pitt.edu
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] How to configure EISA network card in 715/80
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

I'm currently testing the distribution from 0.9.3 on a 715/80 machine. 
I'm running the latest CVS kernel and I have it networked, using the AUI 
port, and also running an X server.

The computer has an EISA slot with a network card that I can't identify. 
The main chips appear to be:

LUCENT/Hewlett Packard
100 VG
1821 - 1400

LUCENT
2X01 MC
Regatta 100

Intel
N82503
L7201918

The card has two ports, a 10 Mbit/sec and a 100Mbit/sec.

Is there a driver for this card?

Thanks.

-- 
      Rafael
