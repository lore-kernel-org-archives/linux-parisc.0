Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 04D964830
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Sep 2003 12:57:23 -0600 (MDT)
Message-Id: <200309121857.h8CIvJf7014048@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
Date: Fri, 12 Sep 2003 14:57:19 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jbglaw@lug-owl.de
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: Looking for info on getting X running on my 712
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

> Basically, you need a kernel with STI framebuffer support and configure
> XFree to use the fremebuffer driver. Mouse and keyboard are standard
> PS/2 components so there's no problem, too. If your colors are totally
> wrong, place 'Visual "TrueColor"' into the "Display" subsection of your
> "Screen" section. Pay attention to your screen resolution and color
> depth - they have to exactly match to what you get on boot-up since
> there's no support to switch to another resolution/depth right now IIRC.

Does this mean that's there is no way to run with a 24 bit depth
on a Vis-EG?  I have been playing with this but I haven't had any luck.
There doesn't seem to be any way to change the depth from 8 bpp on a
c3k using the PDC (there is user defined parameter set but it's not
clear how it can be set other than possibly with sam under hpux).  I
tried "stifb=bpp32:" but this didn't have any effect on the reported
1280x1024-8 config in dmesg:

STI GSC/PCI graphics driver version 0.9
STI PCI graphic ROM found at f6000000 (64 kB), fb at f8000000 (32 MB)
STI word mode ROM at f6000044, hpa at f8000000
STI id 2d08c0a7-9a02587, conforms to spec rev. 8.0a
STI device: PCI_GRAFFITIX1280
STI PCI graphic ROM found at f7000000 (2048 kB), fb at fa000000 (32 MB)
STI word mode ROM at f7000044, hpa at fa000000
STI id 35acda30-9a02587, conforms to spec rev. 8.0d
STI device: A1262A
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-8 frame buffer device, id: 2d08c0a7, mmio: 0xf8100000
stifb: Unsupported gfx card id 0x35acda30

The linux config has

CONFIG_FBCON_CFB8=y
CONFIG_FBCON_CFB32=y
CONFIG_FBCON_STI=y

Oh, I've one other X config problem.  The usb mouse stops responding
at logout from kde.  If I restart the X server with <alt>E, functionality
is restored.  I don't believe that this is a kde problem.  Anybody have
a solution?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
