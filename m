Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 12 Aug 2003 10:06:12 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org, LaMont Jones <lamont@hp.com>
Subject: Re: [parisc-linux] itlb miss handler optimizations!
Message-ID: <20030812160612.GF20514@dsl2.external.hp.com>
References: <20030725070449.GB13017@systemhalted> <20030725114615.GI1485@parcelfarce.linux.theplanet.co.uk> <20030812035810.GB9325@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030812035810.GB9325@systemhalted>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Mon, Aug 11, 2003 at 11:58:11PM -0400, Carlos O'Donell wrote:
> I would be most appreciative if anyone would pipe up and say "Run X to
> test if Y works better/faster/harder" :}

osdl-aim-7 benchmark probably stresses both itlb and dtlb.
(available from osdl.org - URL is in linux-ia64 archive)

SDET is another candidate.

Note that itlb misses is a function of accesses to lots of "random"
pages in memory and having enough memory so the odds of hitting
the same page often is low. ie run thousands of jobs and the
scheduler thrash the itlb.

at least that's how I understand it.

grant
