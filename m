From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] PA 2.0 float conversion to unsigned long long
Date: Mon, 18 Jul 2005 18:34:17 -0400 (EDT)
Message-ID: <200507182234.j6IMYHTK022578@hiauly1.hia.nrc.ca>
References: <20050718194528.GD11016@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: kyle@mcmartin.ca,
 parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050718194528.GD11016@colo.lackof.org> from "Grant Grundler" at
	Jul 18, 2005 03:45:28 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Wed, Jul 13, 2005 at 11:56:28PM -0400, John David Anglin wrote:
> ...
> > That's what I was thinking when I wrote the message.  Under linux,
> > both the left and right halves of fr22 end up with 0x80000000.  Under
> > hpux, the left result is 0x80000000 and the right 0.  The only other
> > explanation is that the c3k fpu has a bug that's not present in an =
> A500
> > (doubtful).
> 
> If they are running at the same clock speed, they are likely to have
> identical CPUs. Some of the 440Mhz boxes did roll CPU HW version
> after initial release - including some SMP bugs that C3K wouldn't
> be exposed to. I'm skeptical it's a bug in the FPU unless you
> can demonstrate the same code works on another (newer) CPU model.

Actually, it's the reverse.  I believe that the A500 is a 550 MHz
8600 and the C3K is a 875 MHz 8700.  It's really unclear which of
the new PA 2.0 floating-point instructions are actually supported
in hardware.  I'd have to do some timing tests to figure that out
as there's not much documentation.  It is clear that linux has code
in the kernel to handle the convert in question.

If we have a bunch of instructions that are emulated in the kernel,
it probably would be best if we disabled support for them in GCC and
used the PA 1.x code instead.  It's better tested and I doubt there
would be much of a performance hit.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
