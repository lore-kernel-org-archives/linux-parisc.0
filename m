From: Alan Modra <amodra@bigpond.net.au>
Subject: [parisc-linux] Re: OPD's on hppa-linux,
	and what to do about __cffc's fragility.
Date: Wed, 9 Mar 2005 08:55:13 +1030
Message-ID: <20050308222513.GF15642@bubble.modra.org>
References: <20050308175445.GV23803@baldric.uwo.ca>
	<200503081902.j28J2XMe002188@hiauly1.hia.nrc.ca>
	<20050308210851.GA23803@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050308210851.GA23803@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Mar 08, 2005 at 04:08:51PM -0500, Carlos O'Donell wrote:
> On Tue, Mar 08, 2005 at 02:02:33PM -0500, John David Anglin wrote:
> > > > This problem was fixed yesterday by Alan Modra.
> > > 
> > > I'm not sure what you mean in your statement "shared library function
> > > pointers are resolved when the library is loaded?" The function pointers
> > > exist as two-byte entries in the PLT, and are non-unique, and they
> > > aren't resolved until call time with lazy resolution.

No, in an hppa-linux shared lib, a function pointer is accessed via a
word with a PLABEL32 reloc on it.  This reloc is processed before any
code in the shared lib runs, to point to a function descriptor created
by _dl_make_fptr.

-- 
Alan Modra
IBM OzLabs - Linux Technology Centre
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
