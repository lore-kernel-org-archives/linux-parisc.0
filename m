From: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: [parisc-linux] [PATCH] sti= parameter ignored by stifb
Date: Mon, 23 Aug 2004 18:11:47 +0100
Message-ID: <20040823171147.GA975@calypso>
References: <20040823123736.GA765@calypso>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040823123736.GA765@calypso>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Aug 23, 2004 at 01:37:36PM +0100, Stuart Brady wrote:
> If I boot a 2.6 kernel, I get the "If this is the last message you see"
> message regardless of what sti is set to.  Does anyone know what I'm
> doing wrong?  I've searched the lists, but I haven't found anything yet
> except for references to a similar problem in 2.4 in 2001-2002.

I've had a look at the code and I think I've found the problem...
Framebuffers are added in their sti_get_rom() sequence.  In 2.4,
sti_get_rom(0) (the default sti) was included in this, which presumably
results in two framebuffers sharing the same sti struct (badness?)

In 2.6, sti_get_rom(0) is not included, and sti_get_rom(1) is the first
one to be added.  It looks as through whichever framebuffer is
initialised first gets the console.  On my machine, sti_get_rom(1)
refers to the HCRX card (sti=0), and sti_get_rom(2) (sti=1) refers to
the built-in graphics.

This patch below works for me, although there's a nasty glitch when
booting up (the screen doesn't scroll properly, and new messages are
written to the top-most line - this goes away once init starts.)
I don't know whether there's anything else that needs fixing, too.

Index: drivers/video/stifb.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/video/stifb.c,v
retrieving revision 1.7
diff -u -r1.7 stifb.c
--- drivers/video/stifb.c	29 Dec 2003 23:56:30 -0000	1.7
+++ drivers/video/stifb.c	23 Aug 2004 16:54:32 -0000
@@ -1379,6 +1379,7 @@
 stifb_init(void)
 {
 	struct sti_struct *sti;
+	struct sti_struct *def_sti;
 	int i;
 	
 	if (stifb_disabled) {
@@ -1386,9 +1387,19 @@
 		return -ENXIO;
 	}
 	
+	def_sti = sti_get_rom(0);
+	if (def_sti) {
+		for (i = 1; i < MAX_STI_ROMS; i++) {
+			sti = sti_get_rom(i);
+			if (sti == def_sti && bpp > 0)
+				stifb_force_bpp[i] = bpp;
+		}
+		stifb_init_fb(def_sti, stifb_force_bpp[i]);
+	}
+
 	for (i = 1; i < MAX_STI_ROMS; i++) {
 		sti = sti_get_rom(i);
-		if (!sti)
+		if (!sti || sti==def_sti)
 			break;
 		if (bpp > 0)
 			stifb_force_bpp[i] = bpp;
-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
