From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Re: Non-inline math, and inline math broken,
	GCC to blame? (1 hppa tls toolchain regression).
Date: Sat, 16 Jul 2005 15:15:53 -0400
Message-ID: <20050716191553.GG5314@systemhalted.org>
References: <20050716161603.GE5314@systemhalted.org>
	<200507161737.j6GHboDo009866@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507161737.j6GHboDo009866@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jul 16, 2005 at 01:37:50PM -0400, John David Anglin wrote:
> > Who previously executed the COPR,0,0?
> 
> I dunno, incorrect identify sequence?  I agree the 1.1 arch is specific
> about how to do an identify sequence.
 
There is no way to prevent this. An application can always shoot itself
in the foot.

And since the identify sequence should be written in assembly the
compiler can't schedule it around.

It should also be save to execute such a sequence at any point in the
insn stream.

> > I use the fldd to set the new cleared state of the status register.
> 
> I had been wondering if fstw and fldw could be used, but it's an
> undefined operation to set T with fldw and fstd clears T, so I believe
> your use of fstd and fldd is correct in this sequence.

I have to read this again to make sure I did it all right.

> However, you have to be careful in using fstd to get the fp status
> register as it clears T after the insn.

Yes, I might have some mistakes there.

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
