From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Re: Penguin color problems on HCRX-24
Date: Mon, 1 Nov 2004 13:45:36 +0100
Message-ID: <200411011345.36889.deller@gmx.de>
References: <200410292228.14940.j.raspe@t-online.de>
	<200410311506.00662.j.raspe@t-online.de>
	<34548.127.0.0.1.1099261219.squirrel@127.0.0.1>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_w/ihB0g+84/NQiL"
Cc: parisc-linux@lists.parisc-linux.org
To: "Andy Walker" <ajwalker@broadpark.no>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <34548.127.0.0.1.1099261219.squirrel@127.0.0.1>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_w/ihB0g+84/NQiL
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday 31 October 2004 23:20, Andy Walker wrote:
> I'd like to submit the patch below to sanitize the stifb=bpp:x:y:z option
> handling. The recent patch (by Stuart Brady?) made fb initialization stop
> early once the default sti fb was initialized, possibly leaving other fb's
> uninitialized. 

yes - this is a bug.

> Also the handling of a "global default" bpp was rather wacky, 

I liked that idea. No need to initialize all bpps.

> and some array index/bounds problems were fixed. 

Correct.

> Is initdata guaranteed to be zero'ed? If so then the loop setting all the
> elements of stifb_bpp_pref to zero can be dropped. 

Yes, it's guaranteed.

> The patch has been tested with two fb's, switching console fb either by PDC or using the
> 'sti=' commandline option.

Could you please test the attached patch instead. It is based on your patch, but the "global bpp" is still there.

Helge


--Boundary-00=_w/ihB0g+84/NQiL
Content-Type: text/plain;
  charset="utf-8";
  name="diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="diff"

Index: drivers/video/stifb.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/video/stifb.c,v
retrieving revision 1.13
diff -u -p -r1.13 stifb.c
--- drivers/video/stifb.c	31 Oct 2004 21:07:55 -0000	1.13
+++ drivers/video/stifb.c	1 Nov 2004 12:40:26 -0000
@@ -1411,21 +1411,27 @@ stifb_init(void)
 	
 	def_sti = sti_get_rom(0);
 	if (def_sti) {
-		for (i = 1; i < MAX_STI_ROMS; i++) {
+		/* initialize default sti before all others */
+		for (i = 1; i <= MAX_STI_ROMS; i++) {
 			sti = sti_get_rom(i);
-			if (sti == def_sti && bpp > 0)
-				stifb_force_bpp[i] = bpp;
+			if (sti != def_sti)
+				continue;
+			if (bpp > 0)
+				stifb_force_bpp[i-1] = bpp;
+			stifb_init_fb(def_sti, stifb_force_bpp[i-1]);
+			break;
 		}
-		stifb_init_fb(def_sti, stifb_force_bpp[i]);
 	}
 
-	for (i = 1; i < MAX_STI_ROMS; i++) {
+	for (i = 1; i <= MAX_STI_ROMS; i++) {
 		sti = sti_get_rom(i);
-		if (!sti || sti==def_sti)
+		if (!sti)
 			break;
+		if (sti == def_sti)
+			continue;
 		if (bpp > 0)
-			stifb_force_bpp[i] = bpp;
-		stifb_init_fb(sti, stifb_force_bpp[i]);
+			stifb_force_bpp[i-1] = bpp;
+		stifb_init_fb(sti, stifb_force_bpp[i-1]);
 	}
 	return 0;
 }

--Boundary-00=_w/ihB0g+84/NQiL
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_w/ihB0g+84/NQiL--
