From: "H. J. Lu" <hjl@lucon.org>
Subject: Re: [parisc-linux] Re: [RFC] Emit OPD reloc for all global symbols
Date: Wed, 22 Jun 2005 06:38:28 -0700
Message-ID: <20050622133828.GA2180__30287.6771813773$1416623810$gmane$org@lucon.org>
References: <jeekavhet4.fsf@sykes.suse.de>
	<200506212026.j5LKQk6m013156@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Andreas Schwab <schwab@suse.de>,
 carlos@systemhalted.org,
 binutils@sources.redhat.com,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200506212026.j5LKQk6m013156@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jun 21, 2005 at 04:26:46PM -0400, John David Anglin wrote:
> > "John David Anglin" <dave@hiauly1.hia.nrc.ca> writes:
> > 
> > > Having the PLABEL32 relocation resolve to an OPD appears to require
> > > that the symbol be exported.  As a result, we have a different behaviors
> > > for dlsym on hppa and ia32.  What's ia64 do?
> > 
> > hppa needs to be fixed to implement correct variants of the macros in
> > dl-lookupcfg.h.  It probably just has to copy the definitions of
> > DL_FIXUP_* from sysdeps/ia64/dl-lookupcfg.h, and
> > _dl_runtime_{resolve,profile} has to be adapted accordingly.
> 
> There could be problems here but it seems that hppa is exporting
> all global symbols in .dynsym.

Why does hppa do that? A global symbol in executable should be exported
only if it is referenced by a DSO or --export-dynamic is used.

> 
> Regarding the patch, I'm not sure why but it seems to result in
> more R_PARISC_NONE dynamic relocation records (one for each real
> dynamic relocation?).
> 

IA64 also uses function descriptors. Everything works fine.


H.J.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
