From: Alan Modra <amodra@bigpond.net.au>
Subject: [parisc-linux] Re: Solution to OPD's in hppa-linux,
	including a transition plan?
Date: Thu, 17 Mar 2005 10:24:21 +1030
Message-ID: <20050316235421.GI21148@bubble.modra.org>
References: <20050311180542.GV22872@baldric.uwo.ca>
	<200503120049.j2C0nTDc017666@hiauly1.hia.nrc.ca>
	<20050315220842.GC22872@baldric.uwo.ca>
	<20050315224142.GC21148@bubble.modra.org>
	<20050316203656.GF22872@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050316203656.GF22872@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Mar 16, 2005 at 03:36:57PM -0500, Carlos O'Donell wrote:
> On Wed, Mar 16, 2005 at 09:11:42AM +1030, Alan Modra wrote:
> > On Tue, Mar 15, 2005 at 05:08:48PM -0500, Carlos O'Donell wrote:
> > > The problem is that in a normal executable those words just point at the
> > > PLT and they shouldn't. That case should just generate a PLABEL32 reloc
> > > in the executable. 
> > 
> > ld still needs to generate function descriptors for plabels that resolve
> > locally, eg. because the symbol is for a static function.
> 
> I don't understand how this case changes the situation, can you elaborate a 
> bit more?

If you take the address of a static function (or a hidden function),
you'll need a plabel somewhere.  You can't expect ld.so to handle this
via _dl_make_fptr, because the static function symbol isn't available to
ld.so.  Also, don't forget that ld needs to do everything for a fully
static link.

-- 
Alan Modra
IBM OzLabs - Linux Technology Centre
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
