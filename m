From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Patch for segfaults in minifail tests
Date: Sat, 1 May 2010 19:13:54 -0400 (EDT)
Message-ID: <20100501231355.851335057@hiauly1.hia.nrc.ca>
References: <4BDCAA56.4010905@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@HansenPartnership.com,
	linux-parisc@vger.kernel.org, T-Bone@parisc-linux.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BDCAA56.4010905@gmx.de> from "Helge Deller" at May 2, 2010 00:25:26 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Helge,

> I tried your patch on top of a 2.6.33.2 kernel (SMP, 32bit, PA8500 (PCX-W) CPU).
> I still do see all the page faults as before. They even seem to trigger 
> faster than with a few of Dave's patches.
> 
> I usually run this command
> 	i=0; while true; do i=$(($i+1)); echo Run $i; ./minifail_dave; done;
> in a few screen sessions in parallel.

The reason running multiple screens in parallel exposes further problems
is the implementation of ptep_set_wrprotect is broken.  It simply sets the
write protect bit in the pte and doesn't purge the existing translation.
So, the parent continues to merrily write to the write protected page until
the TLB entry is purged and reloaded.  More processes make it more likely the
entry will be replaced and trigger a COW break.

This is why my versions of the minifail test which monitor the stack region
used by the thread don't cause a COW break immediately after the fork.  When
compiled at -O0, the loop index is constantly being stored to the stack.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
