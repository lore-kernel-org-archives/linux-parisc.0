Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from PHSEXCHICO2.Partners.org (phsexchico2.partners.org [170.223.254.20])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F4A3482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Feb 2002 13:14:24 -0700 (MST)
Message-ID: <FE6B88CC9D2BD311AD120008C7B3AF87081ED289@phsexch3.mgh.harvard.edu>
From: "Roylance, Stephen D." <SROYLANCE@PARTNERS.ORG>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Mon, 11 Feb 2002 15:14:20 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Getting a D370 off the ground
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

I don't have any experience with HP-UX or PA-risc hardware, but I recently
inherited an abandoned HP D-class 9000 server.  I'm trying to get the
machine functional using Linux, since I don't have access to recent HP-UX,
and I use Debian Linux on x86.
What I've managed to do so far (with some trial and error):
remove the remote access management card
boot into the firmware and set the console to the onboard serial
boot into the CD I created from palinux-0.9.3.iso
partition and format a disk, get Linux installed and booting

So far so good, but I have a few questions:
My video card seems to be a:
Raven Opt. 2D Graphics (Goat) (10) at 0xf6000000 [10/12], version 0x12, 0x0,
0x77
What can I expect from it?  I've nerver used XF86 version 4 or an fb device,
and I haven't figured out the new config file format.  Will I be able to use
the the graphical console with a newer kernel?  Can I get X to use it?
Does anyone know if I can switch resolution/video mode from the firmware? 
I installed the 32-bit kernel, can I use a 64-bit kernel on this machine?
Should I checkout the latest kernel source from cvs and build that, or is
there some other version, or an image, I shoud use?  The kernel installed
with the CD doesn't seem to be SMP.

If anybody can volunteer answers to any of these questions, I'd really
appreciate it.  Also, great thanks to everyone who's put effort into pa-risc
linux, I'll get so much more out of this machine with it running Linux!

-Steve R 
