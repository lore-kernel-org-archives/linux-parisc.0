From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] Re: NPTL pthread_cancel and libgcc_s.so.2 vs.
	libgcc_s.so.1 (Why the DSO version bump?)
Date: Tue, 2 Aug 2005 11:42:41 -0400
Message-ID: <20050802154237.GF9703@systemhalted.org>
References: <20050802135905.GD9703@systemhalted.org>
	<200508021413.j72EDgM3013869@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200508021413.j72EDgM3013869@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Aug 02, 2005 at 10:13:42AM -0400, John David Anglin wrote:
> > What was the reason for DSO version bump in libgcc_s.so.1?
> 
> It was done to distinguish between libgcc_s's built with sjlj and dwarf2
> eh support, respectively.  They use incompatible unwind routines and it's
> not possible to support both exception handling techniques with one library.

So libgcc_s.so.1 is for dwarf2?
While libgcc_s.so.2 is for sjlj?

Thus NPTL thread cancellation seems to requires dwarf2 eh support.
How do I enable sjlj versus dwarf2 (--enable-dwarf2-exceptions?)

Our build script is here if you want to have a look:
http://cvs.parisc-linux.org/build-tools/build-tls-tools?rev=1.5&view=markup

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
