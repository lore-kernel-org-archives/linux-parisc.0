From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Re: Boot problem with HPPA 735/125 w/ A1439A CRX
Date: Sun, 29 Jul 2007 17:34:05 +0200
Message-ID: <200707291734.05932.deller__18288.9838739813$1416624422$gmane$org@gmx.de>
References: <8C996C28EAB2003-444-120B@WEBMAIL-MA12.sysops.aol.com>
	<200707291508.14810.deller@gmx.de>
	<8C9A005CA9EA817-9F4-ADB9@FWM-D07.sysops.aol.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: parisc-linux@lists.parisc-linux.org
To: kurtm22@netscape.net
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <8C9A005CA9EA817-9F4-ADB9@FWM-D07.sysops.aol.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Kurt,

On Sunday 29 July 2007, kurtm22@netscape.net wrote:
> I commented out the fb_memset call 
> in stifb.c and your suspicions were correct!? 
> Not only did the kernel boot but I got the full
> GUI login screen.?? 

Great.

> When I upgraded from Woody to Sarge, I also had no GUI so perhaps
> this problem was in Sarge too.

Probably.

> Do you have any tests you would like me
> to perform on this machine - it's just a hobby
> machine for me. 

Yes, could you please try this patch ?
(please modify by hand, I just copy&pasted it here)

diff --git a/drivers/video/stifb.c b/drivers/video/stifb.c
@@ -512,7 +512,7 @@ rattlerSetupPlanes(struct stifb_info *fb)

-       fb_memset((void*)fb->info.fix.smem_start, 0xff,
+       memset(fb->info.screen_base, 0xff,
                fb->info.var.yres*fb->info.fix.line_length);

Is there any difference if you just comment out the fb_memset() call, or if you modify it like I showed in the patch above?
I'm wondering, if we should just delete the whole fb_memset() call.

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
