From: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] A couple of minor patches for 2.6.7-pa1
Date: Sat, 19 Jun 2004 02:28:55 +0100
Message-ID: <20040619012855.GM20511@parcelfarce.linux.theplanet.co.uk>
References: <40D30E3C.1010809@tiscali.be> <40D34A27.8060009@tiscali.be>
	<35844.127.0.0.1.1087594933.squirrel@www.puszczka.com>
	<20040618212600.GB12572@engsoc.org>
	<35884.127.0.0.1.1087595933.squirrel@www.puszczka.com>
	<20040618215310.GD12572@engsoc.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@engsoc.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040618215310.GD12572@engsoc.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jun 18, 2004 at 05:53:10PM -0400, Kyle McMartin wrote:
> willy posted a patch that checks the gcc version and uses 7100 or 7300
> based on it.

Actually, I didn't.  Can anyone test this for me?

Index: arch/parisc/Makefile
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/Makefile,v
retrieving revision 1.12
diff -u -p -r1.12 Makefile
--- arch/parisc/Makefile        19 Apr 2004 22:32:49 -0000      1.12
+++ arch/parisc/Makefile        19 Jun 2004 01:28:37 -0000
@@ -48,7 +48,7 @@ cflags-y      += -ffunction-sections
 cflags-$(CONFIG_PA7100)                += -march=1.1 -mschedule=7100
 cflags-$(CONFIG_PA7200)                += -march=1.1 -mschedule=7200
 cflags-$(CONFIG_PA7100LC)      += -march=1.1 -mschedule=7100LC
-cflags-$(CONFIG_PA7300LC)      += -march=1.1 -mschedule=7300
+cflags-$(CONFIG_PA7300LC)      += $(call check_gcc,-march=1.1 -mschedule=7300,-march=1.1 -mschedule=7100LC)
 cflags-$(CONFIG_PA8X00)                += -march=2.0 -mschedule=8000
 
 head-y                 := arch/parisc/kernel/head.o 


-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
