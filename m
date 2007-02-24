From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] The parisc SMP boot problem
Date: Fri, 23 Feb 2007 22:25:53 -0600
Message-ID: <1172291153.3424.87.camel__22841.4281773896$1416624312$gmane$org@mulgrave.il.steeleye.com>
References: <1171820653.3423.22.camel@mulgrave.il.steeleye.com>
	<20070218193237.GB22043@athena.road.mcmartin.ca>
	<1171830438.3423.26.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1171830438.3423.26.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2007-02-18 at 14:27 -0600, James Bottomley wrote:
> On Sun, 2007-02-18 at 14:32 -0500, Kyle McMartin wrote:
> > Any idea what was wrong with it?
> 
> Not yet ... the fact that everything goes OK for a while then hangs
> implies there's some issue with handling the SID wrap around, but I
> can't pinpoint it yet.

OK, it turns out it was much simpler.  The SMP distributed
load_context() changes %sr3 and %cr8.  However, in an interrupt all of
the space registers are saved and restored, so, even though the routine
changes %sr3, it gets changed back on the rfi after the IPI completes.

I think this is the fix.  Although, it strikes me that no interrupt
should be mucking with the space registers, so it's probably safe not to
save or restore any of them.

James

diff --git a/include/asm-parisc/assembly.h b/include/asm-parisc/assembly.h
index 5587f00..6c4d126 100644
--- a/include/asm-parisc/assembly.h
+++ b/include/asm-parisc/assembly.h
@@ -435,7 +435,7 @@
 	SAVE_SP  (%sr0, PT_SR0 (\regs))
 	SAVE_SP  (%sr1, PT_SR1 (\regs))
 	SAVE_SP  (%sr2, PT_SR2 (\regs))
-	SAVE_SP  (%sr3, PT_SR3 (\regs))
+;	SAVE_SP  (%sr3, PT_SR3 (\regs))
 	SAVE_SP  (%sr4, PT_SR4 (\regs))
 	SAVE_SP  (%sr5, PT_SR5 (\regs))
 	SAVE_SP  (%sr6, PT_SR6 (\regs))
@@ -475,7 +475,7 @@
 	REST_SP  (%sr0, PT_SR0 (\regs))
 	REST_SP  (%sr1, PT_SR1 (\regs))
 	REST_SP  (%sr2, PT_SR2 (\regs))
-	REST_SP  (%sr3, PT_SR3 (\regs))
+;	REST_SP  (%sr3, PT_SR3 (\regs))
 	REST_SP  (%sr4, PT_SR4 (\regs))
 	REST_SP  (%sr5, PT_SR5 (\regs))
 	REST_SP  (%sr6, PT_SR6 (\regs))


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
