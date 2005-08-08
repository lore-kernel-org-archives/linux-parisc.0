From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: GCC not disabling the use fr31 even with
	-mdisable-fpregs.
Date: Sun, 7 Aug 2005 23:53:56 -0400 (EDT)
Message-ID: <200508080353.j783ruNq009002@hiauly1.hia.nrc.ca>
References: <20050807233503.GE9703@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050807233503.GE9703@systemhalted.org> from "Carlos O'Donell"
	at Aug 7, 2005 07:35:08 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > > What is of real concern is the save/restore of fr31, when the compiler
> > > has been told to disable floating point registers.
> > 
> > There's a bug there:
> > 
> > #define CONDITIONAL_REGISTER_USAGE \
> > {                                               \
> >   int i;                                        \
> >   if (TARGET_DISABLE_FPREGS || TARGET_SOFT_FLOAT)\
> >     {                                           \
> >       for (i = FP_REG_FIRST; i < FP_REG_LAST; i++)\
> > 	fixed_regs[i] = call_used_regs[i] = 1;  \
> >     }                                           \
> > 
> > It looks like the '<' should be '<=".  It's not disabling the last
> > fpreg.
> 
> Aha! Zat is ze bug! :)

This is now fixed in all active gcc branches (3.4, 4.0 and head).  The
problem has been present since the hppa64 port was introduced (3.0).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
