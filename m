From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Re: Boot problem with HPPA 735/125 w/ A1439A CRX
Date: Sun, 29 Jul 2007 18:43:46 +0200
Message-ID: <200707291843.47136.deller__9870.05195715955$1416624422$gmane$org@gmx.de>
References: <8C996C28EAB2003-444-120B@WEBMAIL-MA12.sysops.aol.com>
	<8C9A005CA9EA817-9F4-ADB9@FWM-D07.sysops.aol.com>
	<200707291734.05932.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: kurtm22@netscape.net
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200707291734.05932.deller@gmx.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sunday 29 July 2007, Helge Deller wrote:
> Yes, could you please try this patch ?

Could you please try the attached patch instead.
This should be correct.

Thanks,
Helge

diff --git a/drivers/video/stifb.c b/drivers/video/stifb.c
index c97709e..6e5f138 100644
--- a/drivers/video/stifb.c
+++ b/drivers/video/stifb.c
@@ -505,16 +505,24 @@ ngleSetupAttrPlanes(struct stifb_info *fb, int BufferNumber)
 static void
 rattlerSetupPlanes(struct stifb_info *fb)
 {
+	int saved_id, y;
+
+ 	/* Write RAMDAC pixel read mask register so all overlay
+	 * planes are display-enabled.  (CRX24 uses Bt462 pixel
+	 * read mask register for overlay planes, not image planes).
+	 */
 	CRX24_SETUP_RAMDAC(fb);
     
-	/* replacement for: SETUP_FB(fb, CRX24_OVERLAY_PLANES); */
-	WRITE_WORD(0x83000300, fb, REG_14);
-	SETUP_HW(fb);
-	WRITE_BYTE(1, fb, REG_16b1);
+	/* change fb->id temporarily to fool SETUP_FB() */
+	saved_id = fb->id;
+	fb->id = CRX24_OVERLAY_PLANES;
+	SETUP_FB(fb);
+	fb->id = saved_id;
+
+	for (y = 0; y < fb->info.var.yres; ++y)
+		memset(fb->info.screen_base + y * fb->info.fix.line_length,
+			0xff, fb->info.var.xres * fb->info.var.bits_per_pixel/8);
 
-	fb_memset((void*)fb->info.fix.smem_start, 0xff,
-		fb->info.var.yres*fb->info.fix.line_length);
-    
 	CRX24_SET_OVLY_MASK(fb);
 	SETUP_FB(fb);
 }
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
