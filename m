From: "H. J. Lu" <hjl@lucon.org>
Subject: [parisc-linux] Re: [RFC] Emit OPD reloc for all global symbols and
	then some.
Date: Mon, 20 Jun 2005 13:40:56 -0700
Message-ID: <20050620204056.GA351__1259.46872071854$1416623806$gmane$org@lucon.org>
References: <20050620191501.GA31614@lucon.org>
	<200506202026.j5KKQPb7007471@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: carlos@systemhalted.org,
 binutils@sources.redhat.com,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200506202026.j5KKQPb7007471@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jun 20, 2005 at 04:26:25PM -0400, John David Anglin wrote:
> > > Under hppa-linux:
> > > ------------------
> > > We want to generate a PLABEL32 (OPD reloc) against all global symbols,
> > > and then some. For example it should be possible for an application to
> > > call dlsym asking for the address of main, and when compared to main it
> > > should match.
> > > 
> > 
> > Does it work on Linux/ia32? If not, why should it work on Linux/hppa?
> 
> The linux manpage for dlsym indicates that symbols in the main
> program can be looked up with dlsym:
> 
>      If filename is a NULL pointer, then the returned handle is
>      for the main program.  When given to dlsym(), this  handle
>      causes a search for a symbol in the main program, followed
>      by all shared libraries loaded  at  program  startup,  and
>      then all shared libraries loaded by dlopen() with the flag
>      RTLD_GLOBAL.
> 
> So, if it doesn't work, that would seem to be a bug in Linux/ia32.

It works if the global symbol is exported. But not all global symbols
in main are exported by default. You can use --export-dynamic to export
all global symbols.


H.J.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
