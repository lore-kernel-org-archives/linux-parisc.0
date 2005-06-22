From: "H. J. Lu" <hjl@lucon.org>
Subject: Re: [parisc-linux] Re: [RFC] Emit OPD reloc for all global symbols
	and then some.
Date: Wed, 22 Jun 2005 06:51:44 -0700
Message-ID: <20050622135144.GB2180__6092.02256096086$1416623810$gmane$org@lucon.org>
References: <20050620191501.GA31614@lucon.org>
	<200506202026.j5KKQPb7007471@hiauly1.hia.nrc.ca>
	<20050620204056.GA351@lucon.org>
	<20050620212913.GL5269@systemhalted.org>
	<20050620224610.GA2198@lucon.org>
	<20050621024438.GP5269@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 binutils@sources.redhat.com,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050621024438.GP5269@systemhalted.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jun 20, 2005 at 10:44:40PM -0400, Carlos O'Donell wrote:
> On Mon, Jun 20, 2005 at 03:46:10PM -0700, H. J. Lu wrote:
> > > Regardless of wether or not I export all global symbols in main, I must
> > > still emit OPD relocs in the executable for all dynamic symbols. In the
> > 						^^^^^^^^^^
> > 
> > Did you mean dynamic or global? There is a big difference. In your
> > proposal, you said "We want to generate a PLABEL32 (OPD reloc) against
> > all global symbols,". I am not familiar with HPPA. I just want to know
> > what you have in mind.
> 
> Sorry for being sloppy, there is a qualifier in my mind that I keep
> forgetting to write, read the following:
> 
> ld must emit an OPD reloc in the executable for each global symbol that
> had an OPD reloc to begin with. This way the dynamic loader can assign
> an OPD at runtime for use in a comparison. Dynamic symbols that had an
> OPD reloc should also emit the reloc in the executable.
> 
> Previously an executable just pointed the OPD data word for global and 
> dynamic symbols at their associated .plt entries (since .plt entries
> like on ia64 are function descriptors). No OPD reloc emitted. Thus the
> address of the OPD was really the address of the .plt entry.
> 
> This meant that if you passed the address of a dynamic symbol to a shared
> library function, from which the symbol came from, the two addresses
> would be different. One would point to the executables .plt entry for
> that dynamic symbol, while the shared library would have an OPD for that
> symbol. The ip/gp of both would be the same though (after resolution of
> the .plt that is).
> 
> The shared case in hppa was always different, and a DSO has always
> created OPD relocs against symbols that started with OPD relocs.
>  
> > > past the OPD reloc was "fudged" and pointed at the PLT, and this is not
> > > a satisfactory situation. I want ld.so.1 to generate the OPD so we no
> > > longer need gcc to emit the __cffc helper function for comparisons.
> 
> Calling through the .plt is still faster than calling through an OPD.
> You can still call through an OPD using $dyncall in hppa.
> Thus we probably want to keep the .plt entry even though we are creating
> an OPD that could be used to call through.
> 

Check out SYMBOL_REFERENCES_LOCAL, SYMBOL_CALLS_LOCAL,
elfNN_ia64_dynamic_symbol_p and _bfd_elf_dynamic_symbol_p.



H.J.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
