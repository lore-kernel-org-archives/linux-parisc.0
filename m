From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] interesting linker behaviour :)
Date: Tue, 21 Sep 2004 16:06:26 -0400 (EDT)
Message-ID: <200409212006.i8LK6RW3010541@hiauly1.hia.nrc.ca>
References: <20040921194939.GT22642@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040921194939.GT22642@tausq.org> from "Randolph Chung" at Sep
	21, 2004 03:49:39 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > I haven't looked at this in detail but possibly you can change the
> > fixup table to contain pc-relative offsets.  I looked at this
> > when I reworked the casesi pattern in GCC a few months ago.  This
> > makes the table smaller and in many cases the number of instructions
> > is less than that with branches in the table (particularly for the
> > PIC case).  
> 
> well, this is what we used to do, but we don't do this now because it
> requires us to be able to do a pc-relative calculation between code in
> two different sections (text and fixup), and GAS doesn't allow that
> either.

GAS does allow you to do it.  If you look in GCC, you will see that we
use the special assembler symbol $PIC_pcrel$0 to create pc-relative
relocations.  To create a jump table with 32-bit pc-relative relocations,
you would do something like this:

L$0:
	.word L$1+(.+8-L$0)-$PIC_pcrel$0
	.word L$2+(.+8-L$0)-$PIC_pcrel$0
	...

The assembler is sensitive to the ordering of the terms in the expression.

Basically, $PIC_pcrel$0 == .+8 in each expression, so you are just left
with the difference of labels in the final evaluation.  Note that (.+8-L$0)
evaluates to an absolute constant.  Thus, the first two terms are just a
symbol plus a constant addend.  GAS will allow that.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
