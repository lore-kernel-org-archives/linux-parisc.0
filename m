From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc register assignment problem on parisc
Date: Fri, 18 Jun 2004 20:05:21 -0400 (EDT)
Message-ID: <200406190005.i5J05Msm000476@hiauly1.hia.nrc.ca>
References: <20040618190107.4EC4F4F24E@enterprise.cs.utk.edu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: camm@enhanced.com,
 rwhaley@cs.utk.edu,
 parisc-linux@lists.parisc-linux.org
To: rwhaley@cs.utk.edu (R Clint Whaley)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040618190107.4EC4F4F24E@enterprise.cs.utk.edu> from "R Clint
	Whaley" at Jun 18, 2004 03:01:07 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I started looking at the genned assembler, and I think I've figured out why.
> parisc allows you to use the 'left' and 'right' parts of a double precision
> register as seperate single precision registers.  Therefore, you have
> something like 56 single prec regs on this arch!  The bad news, though,
> is that the pair must be scheduled as if they were still one reg.  I.e.,
> if %fr31L is the target of an operation, and the next operation uses
> %fr31R as a target, you have a pipeline stall just as you would if they
> were both %fr31L.

This is a known issue and mentioned in pa64-regs.h.  I believe the
simple stuff has been done already (fp register allocation order).
Changing the the allocation order or hiding the left/right addressibility
would probably break gdb.  It might be possible to describe the
interdependency in the machine definition.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
