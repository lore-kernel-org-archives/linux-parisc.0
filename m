Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from romano-nyswri.cfe.cornell.edu (romano-nyswri.cfe.cornell.edu [132.236.139.186])
	by dsl2.external.hp.com (Postfix) with ESMTP id 859B0484A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Jun 2002 11:25:16 -0600 (MDT)
From: Steve Pacenka <spacenka@lightlink.com>
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain
Date: 17 Jun 2002 13:24:16 -0400
Message-Id: <1024334656.1594.311.camel@romano-nyswri>
Mime-Version: 1.0
Subject: [parisc-linux] tentative success with CRX24 framebuffer and X on a 720/50
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

Friends,

I posted a request for advice about this on the list a couple of weeks
ago.  The 0.9.3 CD installed well, and then I did a dist-upgrade and
fiddled with kernel compiles to get fbcon and X going.

1. Trial and error within the kernel led to two one-line insertions in
stifb.c (starting with 1.30.2.1 in CVS) enabled CRX24 framebuffer
(a.k.a. HPA1439A) initialization at 32 bpp and correctly blanked the
text overlay plane.  Welcome to the penguin and color text.

Change #1: In function

  stifb_init_fb(struct sti_struct *sti, int force_bpp)

of /usr/src/linux/drivers/video/sti/stifb.c insert

  (fb->id != S9000_ID_A1439A) &&

as another line within the #if 1 #endif hack that prevents
initialization of any but the listed hardware.


Change #2: In function

  stifb_set_disp(struct stifb_info *fb)

insert

  ngleClearOverlayPlanes(fb, 0xff, 0);

before the break; within the "clear attribute planes" switch for this
case.

Change #3: Verify these settings in /usr/src/linux/.config

  CONFIG_FBCON=y
  CONFIG_FBCON_CFB8=y
  CONFIG_FBCON_CFB32=y
  CONFIG_FBCON_STI=y

(CFB8 is for a forthcoming test of 8-bit depth. 24 bits unaccelerated is
somewhat slow with X on this box.)


2. Telling XF86Config-4 that there is a 32 bit framebuffer having 24 bit
depth allowed X to start.  Welcome to a Gnome 1.4 splashscreen.


Performance of the console framebuffer is not bad, slightly slower than
the monochrome text that preceded it.  It's nice to have color.  No
apparent problems with the default font and 24bpp.

Performance under X was better than I expected considering the CPU
speed, the 24 bit depth, and the non-acceleration.  An 8-bit depth (if
achievable) and a lighter weight desktop than gnome+sawfish (windowmaker
perhaps) could get X close to routinely usable.  Except for a frequently
unresponsive serial mouse (very old M$ mouse) I experienced no basic
problems within X.

-- thanks, SP
