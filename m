Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA30120
	for <parisc-linux@puffin.external.hp.com>; Thu, 11 Jan 2001 07:15:41 -0700
Sender: sanjak@tipas.lt
Message-Id: <387B2C2C.3136129D@tipas.lt>
Date: Tue, 11 Jan 2000 15:12:12 +0200
From: Aleksandr Konstantinov <sanjak@tipas.lt>
Mime-Version: 1.0
To: parisc-linux <parisc-linux@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Booting palinux on model 735 problems.
List-ID: <linux-parisc.vger.kernel.org>

Sorry for double message.



Hello All.

  I have problem.
 We have here two HP Apollo 9000 Series 700 Model 735 boxes (both
identical).  I tried to boot
palinux-0.5.iso on one of them. Because boxes have no cdrom I did it
through network using 
rbootd (slightly modified to accept empty target names) giving it whole
cdrom device as target.
It started ok, listed all devices available on board and passed to (all
strings are copied from
screen)

  ASP version 20 at f0800000 found.

Then it waits a bit and writes at screen

  Running stack from ...

and dumps a lot of data. Then it ends with

  High Priority Machine Check (HPMC): Code=1 regs=c026d080
(Addr=00000000)
      YXrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
 PSW: 00000000000001101111110100001011
 r0-3:   00000000 c01dc000 c02a7050 c4f9c748
 r4-7:   0000002c c4ff6240 f0824800 ffffffdf
 r8-11:  ffffffff c027a000 00000000 000a5a59
 r12-15: 000a5a59 000ff000 f00012a8 00000000
 r16-19: 00000001 08000059 c828c828 0000000b
 r20-23: 000000ff 00000041 c4f9b040 0000000b
 r24-27: ffffffff f0824800 f0824800 co266000
 r28-31: 000000d3 00000780 c4f9c940 c012dfc0
 sr 0-4: 00000000 00000000 00000000 00000000
 sr 4-8: 00000000 00000000 00000000 00000000

 IASQ: 00000000 00000000   IAOQ:  c01dc2e0 c01dc2e4
 IIR:  e840c000   ISR:  00000000   IOR:  c02aa705
 ORIG_R28:  00000000


and nothing more happens.
I saw in this list, that some people managed to boot linux on "model
735".
Did I miss something ?  Can anybody share kernel for 735 ?


A.K.
