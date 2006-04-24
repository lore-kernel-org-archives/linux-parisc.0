From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Mon, 24 Apr 2006 14:46:49 -0400 (EDT)
Message-ID: <200604241846.k3OIknKK028491@hiauly1.hia.nrc.ca>
References: <200604241135.58306.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: mszick@morethan.org (Michael S. Zick)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604241135.58306.mszick@morethan.org> from "Michael S. Zick"
	at Apr 24, 2006 11:35:58 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Those instruction descriptions do not always mention side-effects,
> even less often do they mention the exceptions to the side-effects.
> 
> An exception (footnoted somewhere):
> ldcw,co does not set the dirty bit on the dcache line.

Don't see this.  It uses mem_store just like stw.  The only exception
is when gr0 is the target and it behaves like a prefetch.  See also
discussion of D bit trap.  If the machine has multiple D-caches, I
don't see how the overhead present in the coherency communication
can be avoided.

In the case where store_in_memory is used, the line is first flushed
and then the data is written to memory.  It doesn't make sense to set
the dirty bit in this case.  So, if you do a tight ldcw loop without
the co completer on a CPU that is not fully coherent, you will always
be in the slow store_in_memory case.

> Since there is no way to clear the lock with ldcw,co then when the
> lock is cleared, then there must be another magic completer that needs
> to be used on the instruction that resets the condition to '1' (unlocked).
> 
> Something that triggers the cache coherency system so the change is
> immediately observable by all cpus.

The lock can be reset with a store.  You are probably thinking of
the 'O' completer.  However, I think that all PA-RISC CPUs have strongly
ordered loads and stores.  However, I think the discussion on pages
435-438 in http://ftp.parisc-linux.org/docs/arch/parisc2.0.pdf is
relevant to the SMP case.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
