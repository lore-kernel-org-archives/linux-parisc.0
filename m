Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta03ps.bigpond.com (mta03ps.bigpond.com [144.135.25.135])
	by dsl2.external.hp.com (Postfix) with ESMTP id BDD95482C
	for <parisc-linux@parisc-linux.org>; Mon, 12 Nov 2001 00:54:01 -0700 (MST)
Received: from bubble.local ([144.135.25.72]) by
          mta03ps.bigpond.com (Netscape Messaging Server 4.15) with SMTP
          id GMOGWX00.9VG for <parisc-linux@parisc-linux.org>; Mon, 12 Nov
          2001 18:00:33 +1000
Date: Mon, 12 Nov 2001 18:23:17 +1030
From: Alan Modra <amodra@bigpond.net.au>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org, debian-gcc@lists.debian.org,
	gcc-patches@gcc.gnu.org
Subject: Re: [parisc-linux] hppa gcc bug?
Message-ID: <20011112182317.K6922@bubble.sa.bigpond.net.au>
References: <20011111160712.D391@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011111160712.D391@tausq.org>; from randolph@tausq.org on Sun, Nov 11, 2001 at 04:07:12PM -0800
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sun, Nov 11, 2001 at 04:07:12PM -0800, Randolph Chung wrote:
> Looks like there's a strength-reduce optimization bug in g++-3.0.2 on
> hppa....

For those reading this on gcc-patches, there's a .ii at
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-November/014491.html
This is with hppa-linux-gcc based on 3.0.2 20011019.

Program received signal SIGSEGV, Segmentation fault.
0x8187803 in loop_iterations (loop=0x83840f4)
    at /src/parisc/gcc_new/gcc/unroll.c:3509
(gdb) p debug_rtx (temp)
(jump_insn 2390 2389 2391 (addr_diff_vec:DI (label_ref:SI 2389)
        [ 
            (label_ref:SI 1998)
            (label_ref:SI 2392)
            (label_ref:SI 2392)
            (label_ref:SI 2392)
            (label_ref:SI 2045)
            (label_ref:SI 2093)
            (label_ref:SI 2141)
            (label_ref:SI 2189)
            (label_ref:SI 2237)
            (label_ref:SI 2285)
            (label_ref:SI 2333)
        ] 
        (const_int 0 [0x0])
        (const_int 0 [0x0])) -1 (nil)
    (nil))

Making a wild stab at a fix, which isn't likely to be ideal as I don't
know this area of gcc.  /mumble  Probably should iterate over the elements
of the addr_diff_vec, or something.  /nomumble

	* unroll.c (loop_iterations): Don't segfault on ADDR_DIFF_VEC.

--- gcc/unroll.c~	Mon Oct 15 11:11:14 2001
+++ gcc/unroll.c	Mon Nov 12 17:41:12 2001
@@ -3506,13 +3506,16 @@ loop_iterations (loop)
 
       do
 	{
-	  if (GET_CODE (temp) == JUMP_INSN
-	      /* Previous unrolling may have generated new insns not covered
-		 by the uid_luid array.  */
-	      && INSN_UID (JUMP_LABEL (temp)) < max_uid_for_loop
-	      /* Check if we jump back into the loop body.  */
-	      && INSN_LUID (JUMP_LABEL (temp)) > INSN_LUID (loop->top)
-	      && INSN_LUID (JUMP_LABEL (temp)) < INSN_LUID (loop->cont))
+	  if (GET_CODE (temp) != JUMP_INSN)
+	    continue;
+	  if (/* It's an addr_diff_vec.  */
+	      JUMP_LABEL (temp) == 0
+	      || (/* Previous unrolling may have generated new insns
+		     not covered by the uid_luid array.  */
+		  INSN_UID (JUMP_LABEL (temp)) < max_uid_for_loop
+		  /* Check if we jump back into the loop body.  */
+		  && INSN_LUID (JUMP_LABEL (temp)) > INSN_LUID (loop->top)
+		  && INSN_LUID (JUMP_LABEL (temp)) < INSN_LUID (loop->cont)))
 	    {
 	      if (loop_dump_stream)
 		fprintf (loop_dump_stream,
