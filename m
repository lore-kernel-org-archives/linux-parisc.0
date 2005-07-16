From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Re: Non-inline math, and inline math broken,
	GCC to blame? (1 hppa tls toolchain regression).
Date: Sat, 16 Jul 2005 15:16:46 -0400
Message-ID: <20050716191646.GH5314@systemhalted.org>
References: <20050716183827.GF5314@systemhalted.org>
	<200507161915.j6GJFYvc010458@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507161915.j6GJFYvc010458@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jul 16, 2005 at 03:15:34PM -0400, John David Anglin wrote:
> > I hadn't considered the effects of rescheduling. I guess this can happen
> > to any code between the asm statements.
> 
> As long as the dependencies are correct, then then shouldn't happen.
> Possibly, adding a dependency on register "CCFP" is what's needed.
> I don't know if that actually works but it's how we handle floating-point
> condition codes internally.  I think that would allow inlining of these
> routines in code that does floating-point compares and tests.

What sort of dependancy on CCFP? Do you have an example somewhere?

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
