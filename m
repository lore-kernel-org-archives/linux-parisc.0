Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20020306080101.B6A874859@dsl2.external.hp.com>
Date: Wed,  6 Mar 2002 01:01:01 -0700 (MST)
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] FB on c3k
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

Getting closer.

I'm comfortable that FB ioctl wrappers are ok with an updated
version of the ioctl32.c patch (ftp.p-l.o:patches/fb_ioctl.diff).
"fbset -v -i" on c3k (64-bit kernel, PDC 4.6, Vis-EG/PCI) reports:

Linux Frame Buffer Device Configuration Version 2.1 (23/06/1999)
(C) Copyright 1995-1999 by Geert Uytterhoeven

Opening frame buffer device `/dev/fb0'
Using current video mode from `/dev/fb0'

mode "1280x1024"
    geometry 1280 1024 1280 1024 8
    timings 0 0 0 0 0 0 0
    rgba 8/0,8/0,8/0,0/0
endmode

Getting further frame buffer information
Frame buffer device information:
    Name        : 
    Address     : 0xfb000000
    Size        : 33554432
    Type        : PACKED PIXELS
    Visual      : PSEUDOCOLOR
    XPanStep    : 0
    YPanStep    : 0
    YWrapStep   : 0
    LineLength  : 2048
    MMIO Address: 0xfa100000
    MMIO Size   : 4194304
    Accelerator : No


But when I try to "fbi foo.jpg", I get diagonal black "lines" from
top left to bottom right striped about 3-4 pixels wide and spaced about
12-16 pixels apart (all just guesses). Tux does show up in the top
left corner at boot and stays there. System seems to lock up.
TOC doesn't work. Power off occurs 20-30 seconds after hitting power
button.

I suspect some parameter isn't right for FB device definition
but don't know what. Hoping the diagonal lines are the clue
that someone could tell me about - some sort of "off-by-one"
type of error.

thanks,
grant
