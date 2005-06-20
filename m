From: "H. J. Lu" <hjl@lucon.org>
Subject: Re: [parisc-linux] Re: [RFC] Emit OPD reloc for all global symbols
	and then some.
Date: Mon, 20 Jun 2005 15:46:10 -0700
Message-ID: <20050620224610.GA2198__5283.98397514156$1416623807$gmane$org@lucon.org>
References: <20050620191501.GA31614@lucon.org>
	<200506202026.j5KKQPb7007471@hiauly1.hia.nrc.ca>
	<20050620204056.GA351@lucon.org>
	<20050620212913.GL5269@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 binutils@sources.redhat.com,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050620212913.GL5269@systemhalted.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jun 20, 2005 at 05:29:13PM -0400, Carlos O'Donell wrote:
> On Mon, Jun 20, 2005 at 01:40:56PM -0700, H. J. Lu wrote:
> > On Mon, Jun 20, 2005 at 04:26:25PM -0400, John David Anglin wrote:
> > > > > Under hppa-linux:
> > > > > ------------------
> > > > > We want to generate a PLABEL32 (OPD reloc) against all global symbols,
> > > > > and then some. For example it should be possible for an application to
> > > > > call dlsym asking for the address of main, and when compared to main it
> > > > > should match.
> > > > > 
> > > > 
> > > > Does it work on Linux/ia32? If not, why should it work on Linux/hppa?
> > > 
> > > The linux manpage for dlsym indicates that symbols in the main
> > > program can be looked up with dlsym:
> > > 
> > >      If filename is a NULL pointer, then the returned handle is
> > >      for the main program.  When given to dlsym(), this  handle
> > >      causes a search for a symbol in the main program, followed
> > >      by all shared libraries loaded  at  program  startup,  and
> > >      then all shared libraries loaded by dlopen() with the flag
> > >      RTLD_GLOBAL.
> > > 
> > > So, if it doesn't work, that would seem to be a bug in Linux/ia32.
> > 
> > It works if the global symbol is exported. But not all global symbols
> > in main are exported by default. You can use --export-dynamic to export
> > all global symbols.
> 
> Regardless of wether or not I export all global symbols in main, I must
> still emit OPD relocs in the executable for all dynamic symbols. In the
						^^^^^^^^^^

Did you mean dynamic or global? There is a big difference. In your
proposal, you said "We want to generate a PLABEL32 (OPD reloc) against
all global symbols,". I am not familiar with HPPA. I just want to know
what you have in mind.

> past the OPD reloc was "fudged" and pointed at the PLT, and this is not
> a satisfactory situation. I want ld.so.1 to generate the OPD so we no
> longer need gcc to emit the __cffc helper function for comparisons.


H.J.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
