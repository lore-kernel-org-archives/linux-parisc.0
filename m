From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] is this a known hppa64-linux-ld bug?
Date: Sat, 11 Sep 2004 08:32:24 -0700
Message-ID: <20040911153224.GN28659@tausq.org>
References: <20040911091725.GM28659@tausq.org>
	<200409111006.i8BA6ACE003756@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409111006.i8BA6ACE003756@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

In reference to a message from John David Anglin, dated Sep 11:
> > when this code is compiled and assembled, i can see in the disassembly
> > that the insn at "3:" contains a PCREL17F reloc against
> 
> Not a PCREL22F?

no, i think you get a PCRLE22F only if the link register is r2, right?

> Does it point to a long branch stub?  I've had trouble with this
> before when trying to use sibcalls.  There's only one stub table
> and if you can't get there you're scuppered.  Since your branch is
> in a different section from the target, you may need a long branch
> stub.

oh, right, it's that problem again.... :-(

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
