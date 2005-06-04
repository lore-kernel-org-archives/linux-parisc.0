From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [mingo@elte.hu: [patch] spinlock consolidation, v2]
Date: Sat, 4 Jun 2005 12:03:02 -0600
Message-ID: <20050604180302.GB19823@colo.lackof.org>
References: <20050603173132.GX14929@parcelfarce.linux.theplanet.co.uk>
	<42A19697.8010501@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42A19697.8010501@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jun 04, 2005 at 11:55:03AM +0000, Joel Soete wrote:
...
> Any way it failled to compile very early with following messages:
...
> include2/asm/system.h:174: error: syntax error before "pa_tlb_lock"

It's because of the obscene parisc interdependence between
system.h, bitops.h, and spinlock.h.
Mingo's patch will help break up that a bit better.

I'm working on fixing that up. Two of the commits I made
last night are small steps in that direction.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
