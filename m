Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailhost.sporbeck-family.de (pD9E1DC06.dip.t-dialin.net [217.225.220.6])
	by dsl2.external.hp.com (Postfix) with ESMTP id E0788482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 12 Jul 2003 05:58:04 -0600 (MDT)
Received: from [192.168.100.101] (helo=sporbeck-family.de)
	by mailhost.sporbeck-family.de with esmtp (Exim 4.14)
	id 19bJ2s-0000Pk-B8
	for parisc-linux@lists.parisc-linux.org; Sat, 12 Jul 2003 14:00:06 +0200
Message-ID: <3F0FF827.10107@sporbeck-family.de>
Date: Sat, 12 Jul 2003 13:59:35 +0200
From: Jan Sporbeck <jan@sporbeck-family.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Chassis LCD on D200 supported?
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

I am just wondering if the chassis lcd is supported on 9000/801/D200.

I compiled  2.4.21-pa2 with CONFIG_CHASSIS_LCD_LED=y but still I only 
get the /proc/pdc/led node.
did I get that right, that there should a lcd node showing up when an 
lcd is detected?

the start-up log only states

LED display at f010c000 registered

this is my first hp9000, so I appreciate any hints


/jan.
