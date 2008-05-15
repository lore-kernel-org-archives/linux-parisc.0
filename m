From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PARISC][PATCH] Change cpu_data[] and cpu_devices[] to per_cpu
	variables
Date: Thu, 15 May 2008 16:35:17 -0400
Message-ID: <20080515203517.GP12850@phobos.i.cabal.ca>
References: <200805030002.11151.deller@gmx.de> <20080515135857.GH12850@phobos.i.cabal.ca> <482C9B93.9010701@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <482C9B93.9010701@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, May 15, 2008 at 10:22:43PM +0200, Helge Deller wrote:
> This is mostly copied over from x86 arch and I think it doesn't make 
> anything worse...
> Doesn't Superdomes support more than 32 CPUs ? (although I think superdome 
> isn't supported yet, or is it?)

We don't support anything bigger than 8-way (and only because N-class is
special and has two cpu busses). Much work would be needed to support
more than that for Superdome.

r, Kyle
