Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x4.nokia.com (mgw-x4.nokia.com [131.228.20.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6FC854829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 Oct 2002 04:26:02 -0700 (MST)
Received: from esvir04nok.ntc.nokia.com (esvir04nokt.ntc.nokia.com [172.21.143.36])
	by mgw-x4.nokia.com (Switch-2.2.1/Switch-2.2.0) with ESMTP id g9SBQFB28011
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 Oct 2002 13:26:15 +0200 (EET)
Received: from esebh002.NOE.Nokia.com (unverified) by esvir04nok.ntc.nokia.com
 (Content Technologies SMTPRS 4.2.5) with ESMTP id <T5e3796d706ac158f24077@esvir04nok.ntc.nokia.com> for <parisc-linux@lists.parisc-linux.org>;
 Mon, 28 Oct 2002 13:25:58 +0200
Received: from aurinko.ntc.nokia.com (aurinko.ntc.nokia.com [172.22.105.49]) by trinms01.ntc.nokia.com with ESMTP (8.7.5/8.7.3) id NAA29727 for <parisc-linux@lists.parisc-linux.org>; Mon, 28 Oct 2002 13:25:53 +0200 (EET)
Received: (from mnahkola@localhost)
	by aurinko.ntc.nokia.com (8.11.6/8.11.6) id g9SBPqf10378
	for parisc-linux@lists.parisc-linux.org; Mon, 28 Oct 2002 13:25:53 +0200 (EET)
Date: Mon, 28 Oct 2002 13:25:52 +0200
From: Nahkola Mikko <mikko.nahkola@nokia.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20021028112551.GR15137@aurinko.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [parisc-linux] framebuffer depth and other issues ...
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

I was wondering ... the VIS-EG is about as close to "fully supported" as 
they get, right?

Well, I have one of those in a C240 and ... well, the system is otherwise 
just fine, even KDE is fairly responsive and all that, but there's a 
shortage of available colors. (anyone know of a good lowcolor icon theme? 
I can't seem to find such in Debian... anyone?)

Is it possible to get more than 8 bpp out of a VIS-EG? How would I go 
about that, do I need to say something like "stifb:bpp:foo" to the kernel 
or is fbset enough?

How much of a difference is there between VIS-EG/PCI (A4977A) and 
VIS-EG/GSC (A4450A) in this regard? I have an A4450A in there at the 
moment.

HP-UX seems to find a whole lot of differences and such ... and I did run 
GNOME/HP-UX once on a VIS-EG/PCI without running out of colors but then 
again HP-UX does color recovery and acceleration and all that on those...


Then, is an Ati Mach64 likely to work? I mean, it should be pretty 
well-supported in i386 ... and I've heard rumors about Sun-branded 
Mach64s too, so that would point to least some models getting by without 
a PC BIOS.


Third, what's the thing with $TERM and the serial console? I have 
interesting problems with the 70096, even in vt100-emulation mode the 
Debian installer was, um, interesting. Doesn't anyone else want to use 
the HP dumb-terminal hardware with Linux?


And as an aside, how reliable is the disk stuff nowadays? Would it make 
any sense to run a file server on Linux/hppa yet? I mean, something like 
a stack of A3312As, software-RAID and NFS ... is it likely to work? How 
about performance, compared to HP-UX, for example? (yes, I'd expect HP-UX 
to be somewhat better, but by how much?)


-- 
Mikko Nahkola <mikko.nahkola@nokia.com>
