From: rwhaley@cs.utk.edu (R Clint Whaley)
Subject: [parisc-linux] gcc register assignment problem on parisc
Date: Fri, 18 Jun 2004 15:01:07 -0400 (EDT)
Message-ID: <20040618190107.4EC4F4F24E@enterprise.cs.utk.edu>
To: camm@enhanced.com,
 parisc-linux@lists.parisc-linux.org,
 rwhaley@cs.utk.edu
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Guys,

Despite vowing not to spend any time on this old arch, I've spent the last
two days scoping it out in detail.  One thing I noticed is that gcc is able
to run at the same speed as cc for double precision codes, but produces
code that runs roughly half as fast for single precision.

I started looking at the genned assembler, and I think I've figured out why.
parisc allows you to use the 'left' and 'right' parts of a double precision
register as seperate single precision registers.  Therefore, you have
something like 56 single prec regs on this arch!  The bad news, though,
is that the pair must be scheduled as if they were still one reg.  I.e.,
if %fr31L is the target of an operation, and the next operation uses
%fr31R as a target, you have a pipeline stall just as you would if they
were both %fr31L.

HP's cc compiler is aware of this, and does not schedule pieces of a pair
within pipeline distance of each other, but gcc is not, and so it does it
all the time, causing random pipeline stalls throughout all single precision
code.

So, I'm sending this to this list for a couple of reasons.  Anybody here do
numerical work?  If so, do you see single precision underperfoming double?

I also thought someone on this list might have a contact with the gcc guys,
and might be able to get them to give a hoot about this old arch.
There are a couple of fixes that could be applied in gcc fairly easily,
I think.  The hard one is to do like cc, and use all 64 regs, but enforce
the pipeline stall trick.  An easier solution would be to have a flag
that says "use only the left/right of pair".  This would give you only 28
regs instead of 56, but you wouldn't have random stalls, and so performance
would be much improved.

BTW, I'm not a member of this pa-risc mailing list, so CC me if you want
me to see any reply.

Thoughts?
Clint
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
