From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Re: Non-inline math, and inline math broken,
	GCC to blame? (1 hppa tls toolchain regression).
Date: Sat, 16 Jul 2005 17:18:35 -0400
Message-ID: <20050716211835.GK5314@systemhalted.org>
References: <20050716201356.GJ5314@systemhalted.org>
	<200507162029.j6GKTsGE011108@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507162029.j6GKTsGE011108@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jul 16, 2005 at 04:29:54PM -0400, John David Anglin wrote:
> > Will this ever happen during inlining?
> > 
> > fstd chain -> memory
> > operation 1
> > 			fstd chain -> memory
> > fldd chain -> regs
> > 			operation 2
> > 			fldd chain -> regs
> > 
> > Operation 2 could trap when expected that it couldn't because the fstd
> > had cleared the traps.
> 
> I guess clobbering all the fp registers plus r0 will stop this.

That seems like overkill, I just don't want gcc schedule between the asm
statements. The fstd chain, and fldd chain are always asm statements.

Is there no other way? Clobbering will add huge register pressure and
force gcc to spill all the fpregs and restore after the call.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
