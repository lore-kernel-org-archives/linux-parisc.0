From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] is this a known hppa64-linux-ld bug?
Date: Sat, 11 Sep 2004 06:06:09 -0400 (EDT)
Message-ID: <200409111006.i8BA6ACE003756@hiauly1.hia.nrc.ca>
References: <20040911091725.GM28659@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040911091725.GM28659@tausq.org> from "Randolph Chung" at Sep
	11, 2004 05:17:25 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> when this code is compiled and assembled, i can see in the disassembly
> that the insn at "3:" contains a PCREL17F reloc against

Not a PCREL22F?

> .text.function+xxx which is pointing to the location of "2:". So far so
> good...
> 
> But after linking with the rest of the kernel, the b,l address at "3:"
> is wrong (it points to an address that is an offset from the __ex_table
> section). 
> 
> not sure why this is happening, but it looks like a ld bug?

Does it point to a long branch stub?  I've had trouble with this
before when trying to use sibcalls.  There's only one stub table
and if you can't get there you're scuppered.  Since your branch is
in a different section from the target, you may need a long branch
stub.

This needs to be fixed but no one has time to work on it.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
