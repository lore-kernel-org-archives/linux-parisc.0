Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA32013
	for <parisc-linux@puffin.external.hp.com>; Tue, 10 Oct 2000 09:59:16 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 10 Oct 2000 16:00:23 -0000
Received: from dhd by tarwebok with local (Exim 3.16 #1 (Debian))
	id 13j1pY-00028b-00
	for <parisc-linux@thepuffingroup.com>; Tue, 10 Oct 2000 12:00:40 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 10 Oct 2000 12:00:40 -0400
Message-ID: <87wvfgelef.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] STI broken in CVS head?
List-ID: <linux-parisc.vger.kernel.org>

Hi,

Trying to boot my 712/80 with STI console, I get the following error
during console init:

searching for word mode STI ROMs
STI ROM from PDC at f008000
found potential STI ROM at f0080000
STI word mode ROM at f0080000
STI word mode ROM type 3
 supports 13 monitors
 conforms to STI ROM spec revision 8.04
 graphics id 2b4ded6d40a00499
f8000000 g
break 0,0: pid=0 command='swapper'
swapper[0]: Breakpoint 0

PSW  : 00000008  GR 1 : ffffffff  GR 2 : 00100a44  GR 3 : ffffffff
GR 4 : 0028a082  GR 5 : 00000000  GR 6 : f8000000  GR 7 : c02aa800
GR 8 : 00505070  GR 9 : 00000008  GR10 : c02794a0  GR11 : bc0fd569
GR12 : 000043ff  GR13 : 000089a0  GR14 : 00004800  GR16 : 43f02aa9
GR16 : 00004000  GR17 : 00000000  GR18 : ffffffff  GR19 : 0000000a
GR20 : 00000000  GR21 : c028dd4b  GR22 : 01fe6420  GR23 : 01fe6420
GR24 : 01fdc6e0  GR26 : 01fdc6d0  GR26 : 00270d60  GR27 : c024c000
GR28 : 00000010  GR29 : 00000008  GR30 : 000002f0  GR31 : 00000198
SR0  : 00000004  SR1  : c028dd4c  SR2  : 00000001  SR3  : 00000000
SR4  : 00000000  SR5  : 00000000  SR6  : 00000000  SR7  : 00000000

IASQ : 00000000 00000000 IAOQ : 01f808080 01f8080c
 IIR : 00000000 ISR: 00000000 IOR : 01f80810

Kernel panic: Attempted to kill the idle task!
In idle task - not syncing


As you can see the IAOQ (and %sr1 as well - possibly another $@#!$#%
race condition in entry.S?) are totally bogus.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
