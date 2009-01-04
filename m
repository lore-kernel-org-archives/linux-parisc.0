From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: bad code with gcc-4.3 and lzma-utils ?
Date: Sun, 4 Jan 2009 18:42:02 -0500 (EST)
Message-ID: <20090104234203.229FA4EDD@hiauly1.hia.nrc.ca>
References: <20090105002125.648016d0@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: vapier@gentoo.org, linux-parisc@vger.kernel.org
To: gmsoft@tuxicoman.be (Guy Martin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090105002125.648016d0@tuxicoman.be> from "Guy Martin" at Jan 5, 2009 00:21:25 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Guy,

> I just tested this patch with 4.2.4 and it worked fine !

Would you please try this.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

Index: config/pa/pa.c
===================================================================
--- config/pa/pa.c	(revision 143062)
+++ config/pa/pa.c	(working copy)
@@ -7547,7 +7547,9 @@
 	  if (seq_length != 0
 	      && GET_CODE (NEXT_INSN (insn)) != JUMP_INSN
 	      && !sibcall
-	      && (!TARGET_PA_20 || indirect_call))
+	      && (!TARGET_PA_20
+		  || indirect_call
+		  || ((TARGET_LONG_ABS_CALL || local_call) && !flag_pic)))
 	    {
 	      /* A non-jump insn in the delay slot.  By definition we can
 		 emit this insn before the call (and in fact before argument
