Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from wolf.alaskatech (207-5-237-24-cable.anchorageak.net [24.237.5.207])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8A3A04829
	for <parisc-linux@parisc-linux.org>; Wed, 13 Nov 2002 12:26:28 -0700 (MST)
Received: from wolf.alaskatech (palinux@wolf.alaskatech [24.237.5.207])
	by wolf.alaskatech (8.12.3/8.12.3/Debian -4) with ESMTP id gADJQhRO028207
	for <parisc-linux@parisc-linux.org>; Wed, 13 Nov 2002 10:26:43 -0900
Date: Wed, 13 Nov 2002 10:26:43 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.44.0211131022210.26859-100000@wolf.alaskatech>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] LONG pause on boot
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

Having brought the C180 back to life... Kernel 2.4.18-pa59 looks, boots
and works normally. I downloaded and compiled 2.4.19-pa24, which froze at
"branching to kernel entry point...". Rechecked config, recompiled, same
result. I left it hung for a few minutes, as I've seen delays here before,
then while searching the web and the list archives for solutions it
started again. Delay was over 10 minutes, pushing 20 perhaps. After it
came up, I ssh'd in and restarted it. Same delay, same place...

Does anyone have an idea as to why such a long delay would occur there?
PDC has console to serial_1, which had a terminal on it. There was no
errors or complaints anywhere in the boot process, and none visible during
the kernel compile. I can provide System.map, config file, etc. if
desired...
