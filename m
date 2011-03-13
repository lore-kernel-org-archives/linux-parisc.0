From: Meelis Roos <mroos@linux.ee>
Subject: Re: compile failure: pacache.S and .size
Date: Sun, 13 Mar 2011 21:44:40 +0200 (EET)
Message-ID: <alpine.SOC.1.00.1103132139410.24035@math.ut.ee>
References: <alpine.SOC.1.00.1103130004110.6027@math.ut.ee> <20110313000323.GA17493@hiauly1.hia.nrc.ca> <alpine.SOC.1.00.1103130235020.7773@math.ut.ee> <20110313041046.GA19769@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110313041046.GA19769@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > But the defines of ENDPROC and END in linkage.h are from 2006, commit 
> > ab7efcc9 from Jan Beulich. This has not changed, binutils has, thus my 
> > idea about binutils difference. However, I do not have the old binutils 
> > package easyly availbale right now so I can not test that today.
> 
> You are correct, there is a new error message for .size
> http://sourceware.org/bugzilla/show_bug.cgi?id=12519
> and the change was applied to the 2.21 branch.
> 
> The message was introduced because you can't size a function across
> two sections.  It's not obvious why this is happening here.  So, I think
> a binutils bug should be filed with preprocessed assembler.

Got an answer from binutils bugzilla - we have a problem with
ENDPROC(flush_alias_page)
that is not started because the start is #if 0 but end is not. I did not 
understand clearly what the code intends to do but it looks there are 
just two independent functions that should have their start and end 
matched. Made a test patch to try that out, makes it compile, will test 
boot soon.

diff --git a/arch/parisc/kernel/pacache.S b/arch/parisc/kernel/pacache.S
index 09b77b2..f3d7da6 100644
--- a/arch/parisc/kernel/pacache.S
+++ b/arch/parisc/kernel/pacache.S
@@ -842,11 +842,10 @@ ENTRY(flush_alias_page)
 	.exit
 
 	.procend
+ENDPROC(flush_alias_page)
 #endif
 
-	.export flush_user_dcache_range_asm
