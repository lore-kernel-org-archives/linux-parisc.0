From: Helge Deller <deller@gmx.de>
Subject: Re: Fwd: Re: [parisc-linux] Re: STI crash on B132L with HCRX-24
Date: Sun, 31 Oct 2004 13:12:21 +0100
Message-ID: <200410311312.21653.deller@gmx.de>
References: <200410292228.14940.j.raspe@t-online.de>
	<200410300125.12145.deller@gmx.de>
	<200410311010.47849.j.raspe@t-online.de>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_laNhBbcadVbks2B"
Cc: parisc-linux@lists.parisc-linux.org
To: Johannes Raspe <j.raspe@t-online.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200410311010.47849.j.raspe@t-online.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_laNhBbcadVbks2B
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Johannes,

could you test the attached patch ?
Until now, we only saved the pseudo_palette with max. 16 entries - maybe for 24/32bpp we need to save 256 entries...

Helge


On Sunday 31 October 2004 10:10, Johannes Raspe wrote:
> Hi Helge,
> 
> > Hi Johannes,
> >
> > On Friday 29 October 2004 22:28, Johannes Raspe wrote:
> > > I just noticed that I lost my text-console. Don't know if this is the
> > > patched stifb.c (I cant' check either :-)).
> >
> > I don't think so.
> 
> I had a strang idea about the text-consoles and it was right: The consoles are 
> present, but they are black text on black background.
> I can type in commands blindly and they are executed, but I don't see them. So 
> it seems to be a minor problem with your patch I think. Somehow the colors 
> got screwed up in textmode.
> 
> > > The getty processes are started on tty1  to tty6, but switching to those
> > > consoles with "CTRL+ALT+F1-6" only gives a  black screen.
> >
> > Just tested and this works for me on 8bpp with Artist-gfx on a 715/64.
> >
> > > After switching system-console to graphics there are no bootmessages, I
> > > have to switch back to serial console to see them.
> > > X-Server still is working fine.
> > >
> > > Any suggestions?
> >
> > Do you still boot via serial console or is the cable still connected ?
> > If yes, please stop at the IPL and delete the line "console=ttyS0", which
> > is auto-appended by palo if you boot from serial console.
> 
> No, I changed the path to graphics in boot admin.
> 
> > You wrote in another mail:
> > > The hppa "boot-penguin" looks a little bit psychedlic...
> >
> > could you describe this more exactly. Does the colors seem exchanged (e.g.
> > red is blue and vice-versa) ?
> 
> The background of the penguin is green where it should be black. This is the  
> obvious change. The rest just looks weird. If it helps I could make a picture 
> of it.
> 
> > Helge
> 
> Regards Johannes

--Boundary-00=_laNhBbcadVbks2B
Content-Type: text/plain;
  charset="iso-8859-15";
  name="diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="diff"

Index: stifb.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/video/stifb.c,v
retrieving revision 1.11
diff -u -p -r1.11 stifb.c
--- stifb.c	29 Oct 2004 22:59:50 -0000	1.11
+++ stifb.c	31 Oct 2004 12:10:46 -0000
@@ -112,7 +112,7 @@ struct stifb_info {
 	ngle_rom_t ngle_rom;
 	struct sti_struct *sti;
 	int deviceSpecificConfig;
-	u32 pseudo_palette[16];
+	u32 pseudo_palette[256];
 };
 
 static int __initdata bpp = 8;	/* parameter from modprobe */
@@ -1018,6 +1018,16 @@ stifb_setcolreg(u_int regno, u_int red, 
 			 (blue));
 	}
 
+	if (info->var.bits_per_pixel == 32) {
+		((u32 *)(info->pseudo_palette))[regno] =
+			(red   << info->var.red.offset)   |
+			(green << info->var.green.offset) |
+			(blue  << info->var.blue.offset);
+	} else {
+		((u32 *)(info->pseudo_palette))[regno] = regno;
+	}
+
+
 	WRITE_IMAGE_COLOR(fb, regno, color);
 	
 	if (fb->id == S9000_ID_HCRX) {
@@ -1031,14 +1041,6 @@ stifb_setcolreg(u_int regno, u_int red, 
 				/* 0x100 is same as used in WRITE_IMAGE_COLOR() */
 		START_COLORMAPLOAD(fb, lutBltCtl.all);
 		SETUP_FB(fb);
-
-		/* info->var.bits_per_pixel == 32 */
-		if (regno < 16) 
-		  ((u32 *)(info->pseudo_palette))[regno] =
-			(red   << info->var.red.offset)   |
-			(green << info->var.green.offset) |
-			(blue  << info->var.blue.offset);
--Boundary-00=_laNhBbcadVbks2B--
