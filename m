From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [PATCH] fix SMP TLB optimisations
Date: Tue, 6 Mar 2007 19:43:40 -0500 (EST)
Message-ID: <200703070043.l270hfAt001079__2470.15706631846$1416624322$gmane$org@hiauly1.hia.nrc.ca>
References: <200702252119.l1PLJTk7014385@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James.Bottomley@steeleye.com,
 parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200702252119.l1PLJTk7014385@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Feb 25, 2007 04:19:29 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > > Don't like what's going on with fr22 in the above code.  Seems like a
> > > GCC optimization bug since it looks like there are a few general registers
> > > that could be used.
> > 
> > Why a bug? It's a register just like any other.
> 
> It's an optimization bug because copying from a general to a floating
> register has to be done through memory.  A stack local would save
> a read and write.  In this case, all the manipulation is done before
> the syscall and there would appear to be sufficient general registers
> available to do the job.  GCC's register allocator should be smart
> enough to figure this out...

With luck, his problem should be fixed:
http://gcc.gnu.org/ml/gcc-patches/2007-03/msg00335.html

Also, the 64-bit kernel should use fp regs only for xmpyu.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
