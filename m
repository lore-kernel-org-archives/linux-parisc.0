From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Incorrect execve_wrapper macro?
Date: Tue, 23 Mar 2010 20:45:03 -0400 (EDT)
Message-ID: <20100324004504.6020F4EF4@hiauly1.hia.nrc.ca>
References: <119aab441003231503v345dfacar374e2c06b88769ac@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, kyle@mcmartin.ca, deller@gmx.de
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441003231503v345dfacar374e2c06b88769ac@mail.gmail.com> from "Carlos O'Donell" at Mar 23, 2010 06:03:29 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The execve_wrapper macro loads thread->task like this:
> LDREG   TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1
> 
> This assumes that at the point the macro is called that there is only
> THREAD_SZ_ALGN+FRAME_SIZE between %r30 and the starting value of %r30
> (cr30).
> 
> However, in the syscall entry path I see (syscall.S):
> ldo     THREAD_SZ_ALGN+FRAME_SIZE(%r30),%r30  /* set up kernel stack */
> ...
> STREGM  %r1,FRAME_SIZE(%r30)            /* save r1 (usp) here for now */
> 
> Which means that between %r30 and the start there is actually
> THREAD_SZ_ALGN+2*FRAME_SIZE.

This is wrong as there is a compensating LDREGM:

        LDREGM  -FRAME_SIZE(%r30), %r2          /* get users sp back */

> or heaven forbid the easier to read:
> 
> mfctl   %cr30,%r1                       /* get task ptr in %r1 */
> LDREG   TI_TASK(%r1),%r1

The above looks safer...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
