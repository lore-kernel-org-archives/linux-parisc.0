From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: [RFC] Emit OPD reloc for all global symbols
	and then some.
Date: Tue, 21 Jun 2005 10:14:31 -0600
Message-ID: <20050621161431.GA16368__5991.81873626566$1416623809$gmane$org@colo.lackof.org>
References: <20050621024438.GP5269@systemhalted.org>
	<200506211521.j5LFLwgJ011696@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: hjl@lucon.org,
 Carlos O'Donell <carlos@systemhalted.org>,
 binutils@sources.redhat.com,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200506211521.j5LFLwgJ011696@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jun 21, 2005 at 11:21:58AM -0400, John David Anglin wrote:
> >From my standpoint, I would like to see the same behavior for both
> 32 and 64-bit links when hppa linux supports both 32 and 64-bit 
> user spaces.

Yeah, that would make sense.

>   The original linux implementation was modelled on hpux
> but over the years we have found that hpux compatibility isn't
> important.

When I first got involved in parisc-linux in 1999, there was
an interest in commercializing parisc-linux. That would
mean investing several million dollars per year on a team
to support/test parisc-linux *and* compatibility (where possible)
with hpux so customers could run smaller apps on both.
HP chose not to do that (it was a very rational decision
though personally disappointing).  parisc-linux did not get
commercialized and the developer community around parisc-linux
is not interested in HPUX compatibility.

If someone is interested in HPUX application compatibility,
they better start providing parisc-linux kernel patches this year.
An ABI compatibility event in the tool chain would be sufficient
reason for me to rip out the broken HPUX compatibility
support currently in the parisc-linux source tree.
So far, I've lobbied to keep HPUX app support in the tree with
the hope we could someday run the HPUX X11 server (3D HW Accel!).
But the right people haven't volunteered to make that work.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
