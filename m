Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA24398
	for <parisc-linux@puffin.external.hp.com>; Mon, 29 Nov 1999 19:56:33 -0700
Received: from mcn.net (cjohnson@cj-solutions.com [192.168.0.10])
	by cjs01.cj-solutions.com (8.9.3/8.9.3) with ESMTP id QAA08085
	for <parisc-linux@thepuffingroup.com>; Sun, 28 Nov 1999 16:23:38 -0100
Sender: cjohnson@cj-solutions.com
Message-ID: <3841651A.F66C387B@mcn.net>
Date: Sun, 28 Nov 1999 16:23:38 -0100
From: Carl Johnson <cjs@mcn.net>
MIME-Version: 1.0
To: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Machine Additions?
List-ID: <linux-parisc.vger.kernel.org>

Earlier I saw a message posted about adding machines and their
descriptions to the puffin site, so I went to do that and 
when I follow the instructions, etc, etc the addmachine.php3
kicks out an error, which is embedded and does not show up,
of:

	The IOSCAN output is not in the correct format. Please try
	that again. Exiting a  that is not open

anyhow I am including all the needed info and if someone can finger
out my problem please tell me:  __TIA__

Name: Carl Johnson
Email:
Machine Model: J200
Model Command Output: 9000/770/J200
Picture:
IOScan Output:
:pa:F:F:F:-1:-1:4294967295:bc:root:::0:root:root:CLAIMED:BUS_NEXUS::0
pa:pa:F:F:F:-1:-1:4294967295:bc:bus_converter:8:88 7 8 76 0 0 11 80 0 0 0 0 0 0
0 0 :1:root.ccio:ccio:CLAIMED:BUS_NEXUS:I/O Adapter:1
pa:wsio:F:F:F:0:0:0:ext_bus:c720:8/0:1 240 0 132 0 0 137 128 0 0 0 0 98 113 0 2
:0:root.ccio.c720:c720:CLAIMED:INTERFACE:GSC built-in Fast/Wide SCSI Interface:0
scsi:wsio:F:F:F:-1:-1:4294967295:target:tgt:8/0.6:0 0 2 2 0 0 0 0 71 241 106 203
1 58 127 247 :0:root.ccio.c720.tgt:tgt:CLAIMED:DEVICE::0
scsi:wsio:T:T:F:31:188:24576:disk:sdisk:8/0.6.0:0 0 2 2 0 0 0 0 71 241 106 203 1
58 127 247 :0:root.ccio.c720.tgt.sdisk:sdisk:CLAIMED:DEVICE:SEAGATE ST31230W:0
scsi:wsio:F:F:F:-1:-1:4294967295:target:tgt:8/0.7:0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 :1:root.ccio.c720.tgt:tgt:CLAIMED:DEVICE::0
scsi:wsio:F:T:F:-1:203:28672:ctl:sctl:8/0.7.0:0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
:0:root.ccio.c720.tgt.sctl:sctl:CLAIMED:DEVICE:Initiator:0
pa:core:F:F:F:-1:-1:4294967295:ba:core_adapter:8/12:1 240 0 139 0 0 129 0 0 0 0
0 124 133 0 0 :0:root.ccio.bus_adapter:bus_adapter:CLAIMED:BUS_NEXUS:Core I/O
Adapter:0
core:wsio:F:T:F:-1:216:131072:ext_bus:CentIf:8/12/0:1 240 0 10 0 0 116 0 0 0 0 0
0 0 0 0 :2:root.ccio.bus_adapter.CentIf:CentIf:CLAIMED:INTERFACE:Built-in
Parallel Interface:2
core:wsio:F:T:F:-1:66:0:audio:audio:8/12/1:1 240 0 10 0 0 123 0 0 0 0 0 0 0 0 0
:0:root.ccio.bus_adapter.audio:audio:CLAIMED:INTERFACE:Built-in Audio:0
core:wsio:F:T:F:-1:1:0:tty:asio0:8/12/4:1 240 0 138 0 0 140 0 0 0 0 0 101 169 0
2 :0:root.ccio.bus_adapter.asio0:asio0:CLAIMED:INTERFACE:Built-in RS-232C:0
core:wsio:F:F:F:0:0:65536:ext_bus:c720:8/12/5:1 240 0 138 0 0 130 0 0 0 0 0 104
87 0 2 :1:root.ccio.bus_adapter.c720:c720:CLAIMED:INTERFACE:Built-in SCSI:1
scsi:wsio:F:F:F:-1:-1:4294967295:target:tgt:8/12/5.7:0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 :2:root.ccio.bus_adapter.c720.tgt:tgt:CLAIMED:DEVICE::1
scsi:wsio:F:T:F:-1:203:94208:ctl:sctl:8/12/5.7.0:0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
:1:root.ccio.bus_adapter.c720.tgt.sctl:sctl:CLAIMED:DEVICE:Initiator:1
core:wsio:F:T:F:-1:52:0:lan:lan2:8/12/6:1 240 0 138 0 0 138 0 0 0 0 0 93 53 0 2
:0:root.ccio.bus_adapter.lan2:lan2:CLAIMED:INTERFACE:Built-in LAN:0
core:wsio:F:T:F:-1:159:0:ps2:ps2:8/12/7:1 240 0 138 0 0 132 0 0 0 0 0 111 111 0
2 :0:root.ccio.bus_adapter.ps2:ps2:CLAIMED:INTERFACE:Built-in Keyboard/Mouse:0
pa:pa:F:F:F:-1:-1:4294967295:bc:bus_converter:10:88 7 8 76 0 0 11 80 0 0 0 0 0 0
0 0 :2:root.ccio:ccio:CLAIMED:BUS_NEXUS:I/O Adapter:2
pa:wsio:F:F:F:-1:229:4294967295:graphics:graph3:10/0:0 80 0 138 0 0 119 0 1 0 0
0 109 229 0 2 :0:root.ccio.graph3:graph3:CLAIMED:INTERFACE:Graphics:0
pa:core:F:F:F:-1:-1:4294967295:ba:core_adapter:10/20:1 240 0 11 0 0 142 0 0 0 0
0 0 0 0 0 :1:root.ccio.bus_adapter:bus_adapter:CLAIMED:BUS_NEXUS:Core I/O
Adapter:1
core:wsio:F:T:F:-1:24:0:hil:hil:10/20/1:1 240 0 138 0 0 115 0 0 0 0 0 129 108 0
2 :0:root.ccio.bus_adapter.hil:hil:CLAIMED:INTERFACE:Built-in HIL:0
core:wsio:F:T:F:-1:1:65536:tty:asio0:10/20/2:0 64 0 138 0 0 140 128 0 0 0 0 102
217 0 2 :1:root.ccio.bus_adapter.asio0:asio0:CLAIMED:INTERFACE:Built-in
RS-232C:1
core:eisa:F:F:F:-1:-1:4294967295:ba:eisa_adapter:10/20/5:1 240 0 11 0 0 144 0 0
0 0 0 0 0 0 0 :2:root.ccio.bus_adapter.eisa:eisa:CLAIMED:BUS_NEXUS:EISA Bus
Adapter:2
pa:pa:F:F:F:-1:-1:4294967295:processor:processor:32:88 80 0 0 0 0 4 145 0 0 0 0
0 0 0 0 :0:root.processor:processor:CLAIMED:PROCESSOR:Processor:0
pa:pa:F:F:F:-1:-1:4294967295:memory:memory:49:4 144 26 1 0 0 9 0 0 0 0 0 0 0 0 0
:0:root.memory:memory:CLAIMED:MEMORY:Memory:0

-- 
Carl Johnson
