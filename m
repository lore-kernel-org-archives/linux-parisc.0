Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA15917
	for <parisc-linux@puffin.external.hp.com>; Tue, 17 Aug 1999 13:26:09 -0600
Message-ID: <19990817192737.3940.qmail@mailserv2.iuinc.com>
To: parisc-linux@thepuffingroup.com
From: Steve Moret <smoret-puffin@genocide.net>
Date: Tue, 17 Aug 1999 12:27:35 -0700
Sender: smoret@typhon.genocide.net
Subject: [parisc-linux] J210 and 990811 Kernel
List-ID: <linux-parisc.vger.kernel.org>

I'm just reporting in on whats happening on my J210 with the 990811 kernel
from ftp://ftp.dlug.de:/pub/parisc-linux/

Here's what I get from the console:
PARISC/Linux Bootstrap Version 0.5 (interactive)
By Helge Deller & Jason Eckhardt
Built Wed Aug 11 09:52:34 METDST 1999 by root@grcdg306


Please enter the command-line:
/stand/vmlinux HOME=/ TERM=LINUX
Reading parameters...done.

Loading PA-RISC/Linux Kernel...
SOM-Kernel:
aux_header_location: 00000080
som       : 00200080
exec_dfile: 00098000
exec_dsize: 0001D000
exec_dmem : C0078000
exec_tfile: 00030000
exec_tsize: 00067008
exec_tmem : C0010000
Code at 0x00010000, size=0x00067008
Data at 0x00078000, size=0x0001D000
BSS  at 0x00095000.

Transferring control to kernel. (At entry point 0x00010000)
TEST


The Kernel has started...
You are running a 120MHz PA-RISC-Machine with 512MB of RAM.
Free memory was at 0xC00B5F38 (=stackbase, stacksize=0x00040000).
Free memory now at 0xC00F5F38 and ends at 0x20000000.
Linux version 2.2.1 (root@grcdg306) (gcc version 2.8.1) #1
 Wed Aug 11 09:33:32 METDST 1999
command_line: <none>

Dino device driver, by Alan Cox and Alex deVries

*** then it stops here
If I notice any differences in future kernel builds I'll post the results as
well. Also if anybody has any more success with the J210s I'd like to know
what they did. I'm currently unable to build a kernel on my own machine
because of the lack of HP-UX.

I have older kernels which printed out more information if people need those
as well.


-- 
Steve Moret
smoret@uci.edu
