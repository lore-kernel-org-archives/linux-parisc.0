From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Re: Solution to OPD's in hppa-linux,
	including a transition plan?
Date: Wed, 16 Mar 2005 15:36:57 -0500
Message-ID: <20050316203656.GF22872@baldric.uwo.ca>
References: <20050311180542.GV22872@baldric.uwo.ca>
	<200503120049.j2C0nTDc017666@hiauly1.hia.nrc.ca>
	<20050315220842.GC22872@baldric.uwo.ca>
	<20050315224142.GC21148@bubble.modra.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: Alan Modra <amodra@bigpond.net.au>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050315224142.GC21148@bubble.modra.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Mar 16, 2005 at 09:11:42AM +1030, Alan Modra wrote:
> On Tue, Mar 15, 2005 at 05:08:48PM -0500, Carlos O'Donell wrote:
> > The problem is that in a normal executable those words just point at the
> > PLT and they shouldn't. That case should just generate a PLABEL32 reloc
> > in the executable. 
> 
> ld still needs to generate function descriptors for plabels that resolve
> locally, eg. because the symbol is for a static function.

I don't understand how this case changes the situation, can you elaborate a 
bit more?

Thanks,
Carlos.


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
