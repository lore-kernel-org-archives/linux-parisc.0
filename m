From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: bad code with gcc-4.3 and lzma-utils ?
Date: Sun, 4 Jan 2009 15:16:40 -0500 (EST)
Message-ID: <20090104201641.B52B94EDD@hiauly1.hia.nrc.ca>
References: <20090104130812.69c81ed6@bleh.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: vapier@gentoo.org, linux-parisc@vger.kernel.org
To: gmsoft@tuxicoman.be (Guy Martin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090104130812.69c81ed6@bleh.bxl.tuxicoman.be> from "Guy Martin" at Jan 4, 2009 01:08:12 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Also, compiling with -march=2.0 -O0 -fdelayed-branch doesn't produce a
> segv but produces the following error message :
> hope tests # ../src/lzma/lzma -c < in > out 
> ../src/lzma/lzma: SetCoderProperties() error
> 
> There is really a compiler issue here.

The problem was introduced in revision 68677 on June 29, 2003 when
a change was made to allow ble to be used for local calls.  So, the
problem is present in all versions back to at least 3.4.

The following change should fix the bug.  I'm currently doing a full
build to test.

Thanks for reporting the problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

Index: config/pa/pa.c
===================================================================
--- config/pa/pa.c	(revision 143056)
+++ config/pa/pa.c	(working copy)
@@ -7547,7 +7547,9 @@
 	  if (seq_length != 0
 	      && GET_CODE (NEXT_INSN (insn)) != JUMP_INSN
 	      && !sibcall
-	      && (!TARGET_PA_20 || indirect_call))
+	      && (!TARGET_PA_20
+		  || indirect_call
+		  || (TARGET_LONG_ABS_CALL || local_call) && !flag_pic))
 	    {
 	      /* A non-jump insn in the delay slot.  By definition we can
 		 emit this insn before the call (and in fact before argument
