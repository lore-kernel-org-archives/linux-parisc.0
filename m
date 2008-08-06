From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] fix unwind crash - was: Re: 2.6.26 kernel crash
Date: Wed, 6 Aug 2008 15:41:25 -0400
Message-ID: <20080806194125.GA3281@phobos.i.cabal.ca>
References: <200807201846.11809.deller@gmx.de> <200807201907.59762.deller@gmx.de> <488F7E32.4070204@gmx.de> <1e3eba760808030726l93f60dftdcec0c487933129b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Kyle McMartin <kyle@mcmartin.ca>
To: Randolph Chung <randolph@tausq.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1e3eba760808030726l93f60dftdcec0c487933129b@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Aug 03, 2008 at 07:26:48AM -0700, Randolph Chung wrote:
> (Apologize for my earlier html mail - resent in a more proper format)
> 
> Helge, your patch doesn't look quite right.
> 
> The kernel unwinder is only supposed to be called for kernel
> addresses. Kyle says he thinks he knows what is wrong so he's going to
> poke at it.
> 
> Maybe we can make the kernel unwinder more robust against invalid
> addresses passed to it though.
> 

I think this will fix the problem, though I should audit show_stack
callers to make sure.

diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 675f1d0..721d281 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -121,11 +121,12 @@ static void print_fr(char *level, struct pt_regs *regs)
 
 void show_regs(struct pt_regs *regs)
 {
-	int i;
+	int i, user;
 	char *level;
 	unsigned long cr30, cr31;
 
-	level = user_mode(regs) ? KERN_DEBUG : KERN_CRIT;
+	user = !!user_mode(regs);
+	level = user ? KERN_DEBUG : KERN_CRIT;
 
 	print_gr(level, regs);
 
@@ -152,7 +153,8 @@ void show_regs(struct pt_regs *regs)
 	printk(level);
 	print_symbol(" RP(r2): %s\n", regs->gr[2]);
 
-	parisc_show_stack(current, NULL, regs);
+	if (!user)
+		parisc_show_stack(current, NULL, regs);
 }
 
 
