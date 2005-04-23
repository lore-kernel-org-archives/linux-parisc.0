From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] head.S: a small typo
Date: Sat, 23 Apr 2005 15:35:16 -0400 (EDT)
Message-ID: <200504231935.j3NJZG1n007660@hiauly1.hia.nrc.ca>
References: <426A8857.5090702@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <426A8857.5090702@tiscali.be> from "Joel Soete" at Apr 23,
	2005 05:39:35 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> It was why ifdef __LP64__ of align_rfi

This is point 2 on page F-4 and F-5 of the arch.

#ifdef __LP64__ /* move to psw.h? */
#define         PSW_BITS        PSW_Q+PSW_I+PSW_D+PSW_P+PSW_R
#else
#define         PSW_BITS        PSW_SM_Q
#endif

$rfi:
        /* turn off troublesome PSW bits */
	rsm             PSW_BITS,%r0

	/* kernel PSW:
	 *  - no interruptions except HPMC and TOC (which are handled by PDC)
	 *  - Q bit set (IODC / PDC interruptions)
	 *  - big-endian
	 *  - virtually mapped
	 */

The above code turns off the Q bit in both 32 and 64 bit kernels.  Thus,
it's not clear why this is only needed in a 64-bit kernel.  Indeed pacache.S
uses this sequence.  The comment seems to imply that at one time the Q
bit was set in this code.

The clearing rsm can't be within 8 instructions of a page boundary.  Thus,
it seems the alignment of 256 can be reduced to 128 in head.S.  We also
seem to have one more nop than needed.

The alignment of 128 used for flush_tlb_all_local and disable_sr_hashing_asm
might be too small.  For example, the second rsm in disable_sr_hashing_asm
is 31 instructions after the first.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
