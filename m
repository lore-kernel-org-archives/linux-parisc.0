From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.36 regression : swap support broken
Date: Sun, 12 Dec 2010 18:55:53 -0500 (EST)
Message-ID: <20101212235557.7E7244E33@hiauly1.hia.nrc.ca>
References: <20101212225203.GA9809@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: gmsoft@tuxicoman.be, linux-parisc@vger.kernel.org,
	eike-kernel@sf-tec.de
To: dave.anglin@nrc-cnrc.gc.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101212225203.GA9809@hiauly1.hia.nrc.ca> from "John David Anglin" at Dec 12, 2010 05:52:04 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> (insn:TI 15 14 16 (parallel [
>             (asm_operands/v ("") ("") 0 []
> 		 []
> 		 [] mm/swap_state.c:185)
> 	    (clobber (mem:BLK (scratch) [0 A8]))
> 	]) include/linux/page-flags.h:298 -1
>     (nil))

I think the way to avoid this in the kernel is to stick a "nop" in
the memory barrier.  That will avoid a zero length asm and branching
into the delay slot.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
