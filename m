Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id B6ACA482A
	for <parisc-linux@parisc-linux.org>; Wed, 28 Mar 2001 17:44:58 -0700 (MST)
Reply-To: <hull@cup.hp.com>
From: "Jim Hull" <jim_hull@hp.com>
To: <bame@riverrock.org>
Cc: <parisc-linux@parisc-linux.org>
Subject: RE: [parisc-linux] FYI floating point
Date: Wed, 28 Mar 2001 16:44:56 -0800
Message-ID: <NDBBIHNACACKNDHNHIKAEEFGCBAA.jim_hull@hp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <m14iP5y-001VltC@bame.riverrock.org>
List-ID: <linux-parisc.vger.kernel.org>

Paul wrote:

> Apparently
> the FPU expects emulation to handle the exceptional cases of some
> instructions (such as division by a very tiny number).  Don't count
> on this to be fixed until sometime next week.

Yes, the architecture allows the FP hardware to give up and trap to the
emulation handler for any reason whatsoever.  The emulation handler is
expected to include a full implementation of all instructions.

When the lack of of an FP emulation handler in parisc-linux was first
discussed on this list, I started the machinery inside HP to get the HP-UX
one open-sourced.  Thanks to the work of many individuals in HP, this is
actually happening now.  So, if you'd like to hack in some minimal support
to get a particular program working, fine, but otherwise I would suggest
you wait until the HP-UX handler is released.

 -- Jim
