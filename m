Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x1.nokia.com (mgw-x1.nokia.com [131.228.20.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id 764484829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Feb 2003 08:44:53 -0700 (MST)
Received: from esvir05nok.ntc.nokia.com (esvir05nokt.ntc.nokia.com [172.21.143.37])
	by mgw-x1.nokia.com (Switch-2.2.1/Switch-2.2.0) with ESMTP id h13Fhld17053
	for <parisc-linux@lists.parisc-linux.org>; Mon, 3 Feb 2003 17:43:47 +0200 (EET)
Received: from esebh001.NOE.Nokia.com (unverified) by esvir05nok.ntc.nokia.com
 (Content Technologies SMTPRS 4.2.5) with ESMTP id <T60313316b1ac158f2578c@esvir05nok.ntc.nokia.com> for <parisc-linux@lists.parisc-linux.org>;
 Mon, 3 Feb 2003 17:44:52 +0200
Received: (from mnahkola@localhost)
	by aurinko.ntc.nokia.com (8.11.6/8.11.6) id h13FipK22968
	for parisc-linux@lists.parisc-linux.org; Mon, 3 Feb 2003 17:44:51 +0200 (EET)
Date: Mon, 3 Feb 2003 17:44:50 +0200
From: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030203154450.GO7503@aurinko.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [parisc-linux] Yet another tar-triggered problem?
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

I don't think this is the old tar problem this time ... well, I guess it 
could still be.

I hooked an external HP 35470A tape drive (DDS1 no compression) to the 
C240, loaded a tape, wondering if it had been written on a 35470A or a 
35480A (DDS1 / DCLZ) and, if it should have been the latter, if 
compression would have been turned on. I thought "oh well ... guess it'll 
inform me if it doesn't understand the format". 

Typed a "tar tvf /dev/st0", waited for a while and saw nothing so I 
though "OK, guess it doesn't find anything readable" and hit ^C a couple 
of times and pushed the eject button on the tape drive. Then I went away 
for a couple of minutes and when I came back ... the 70096's scrollback 
was full of something that looks like a hex dump, and then a HPMC at the 
end.

Now, is this a "feature" of the st driver or the tape drive, a bug, a 
broken 35470A, or something entirely different? I don't have too many 
35470As around for testing, most of them are still attached to the old 
servers... but I don't remember getting this on HP-UX, ever.

Kernel version was (again) the old 2.4.18-32, as I can't seem to get KDE 
to work properly with the newer kernels... ;-) but at least now I have 
the builtin ethernet at 100HD. And I was going to reboot anyway, due to 
repartitioning the sdb.

Is anyone interested in the hex dump? That's probably a kernel panic or 
some such, right? Everything before "ad40 ........ ........ ........" has 
scrolled out of the ring buffer but if someone's interested in that I'm 
not rebooting the box yet. I'd have to type it in by hand too... the 
console is a genuine HP 70096 terminal, in native mode. 

That'd mean I can't get the PIM stuff yet either, though. Um ... oh well, 
if someone's interested, I can always get that later.


The HPMC is as follows:
		Code=1 regs=102f3080 (Addr=00000000)
	
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001110 Not tainted
r00-03  00000000 10300010 1010d4e8 ffffffff
r04-07  0000000f 0000029b 0000029b 103b2810
r08-11  0000000f 0000004d 0004000e 1033d060
r12-15  00000000 001ffff8 000000fd f0100000
r16-19  1039c5c0 f00001f8 f00001f0 f2000064
r20-23  0000000e 10f2c260 1024a2ac 10302810
r24-27  0001fd40 0000fd40 10f2c260 102f0010
r28-31  7f7fdee7 00000680 1039c9c0 1010d4e8
sr0-3   00000000 00000005 00000000 00000005
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1024a2d0 1024a2d4
 IIR: 00141860    ISR: 9227ffc8  IOR: 00000064
 CPU:        0   CR30: 1039c000 CR31: 103a0000
 ORIG_R28: 00000000


-- 
Mikko Nahkola   <mikko.nahkola@nokia.com>
Tre-IN sysadmin <mnahkola@trein.ntc.nokia.com>
