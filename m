From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] ELF ABI Documents
Date: Tue, 18 Apr 2006 10:36:16 -0400 (EDT)
Message-ID: <200604181436.k3IEaG06004632@hiauly1.hia.nrc.ca>
References: <1145329883.24150.17.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: jbailey@raspberryginger.com (Jeff Bailey)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1145329883.24150.17.camel@localhost.localdomain> from "Jeff
	Bailey" at Apr 17, 2006 11:11:23 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > I don't think the ELF spec talks about calling conventions and syscall
> > conventions though. For that, parisc-linux mostly follows the SOM spec
> > for calling conventions
> > (http://ftp.parisc-linux.org/docs/arch/pa-runtime-32-SOM.pdf)
> 
> Right.  This is where the LSB document comes it.  It does wind up
> defining those for Linux at least.  The "Mostly follows SOM" is largely
> what's inspired me on this quest.  I'd love to see a definitive document
> that defines this and am willing to go through the effort to do it.

I think what is needed is a SYSV PS ABI for PA-RISC.  It probably shouldn't
be an LSB document.  Typically, the LSB only adopts a subset of any
particular specification, and in the case of the PS ABIs, references
the documents for the various processors currently specified by the
LSB.  The IA64 document is probably the closest to what's needed for
PA-RISC although it can be simplified.  It was written jointly by HP
and Intel.

It probably would be best to obtain the support of HP in doing this.
One of the criticisms of the LSB is that it simply documents what is
and in large measure it just refers to other specifications.
Whereas, specifications such as POSIX have been written by people
aware of the subtle tradeoffs between different implementations
and they try to actually specify an implementation.  If it's
possible to obtain full community support, it's more likely that the
document would be useful and a guide to implementors.  However,
just documenting what is would be useful.

The PA-RISC ABI isn't completely static.  For example, I changed the
passing of complex values in GCC 4.1 so that they are now treated in
the same manner as aggregates.  I think it's also fair to say that
the TLS implementation is far from finalized.

As noted, the HP ELF documents aren't completely up to date and
they don't fully match the current headers provided with HP-UX.
For example, there are now note sections for PA-RISC.  It would be
useful if these documents could be updated as well but this would
require permission from HP because of the copyright issues.

The HP ELF implementation differs in some significant ways from
that in linux.  Areas that come immediately to mind are weak symbol
support, program startup, TLS implementation, memory model, debug
support, etc.

>>From my perspective, a well written PS ABI for PA-RISC would certainly
be useful.  I suspect HP dropped work in this area because of its
decision to phase out PA-RISC.  This is certainly a challenging
project but maybe once the scope is defined the rest will follow.
If you work fast, you might beat implementation of a 64-bit PA-RISC
runtime for linux!

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
