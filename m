From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: Re: [parisc-linux] OpenOffice.org on hppa
Date: Thu, 31 Mar 2005 09:43:41 +0200
Message-ID: <16971.43565.589192.122977@gargle.gargle.HOWL>
References: <20050330134454.GO2485@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050330134454.GO2485@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Randolph Chung writes:
> I took a look at oo.o for hppa... it'll take quite a bit of work to get
> it building. Are there enough people interested to make this happen?
> 
> Here's what I've found so far; there's probably more.
> 
> - oo.o needs libneon23-dev to build, this package is not available in
>   Debian, but this is easily fixable. The package source explicitly
>   disables builds on hppa, so you can just work around this by
>   downloading the libneon23 source
> - oo.o source needs a lot of arch-specific stuff to work:
>   - build infrastructure
>     debian/scripts/vars.hppa
>     config_office/set_soenv.in needs to define a hppa section
>     solenv/inc/ needs a hppa makefile fragment
>     (probably more)
> - need to write bridges code (http://porting.openoffice.org/)
> 
> i got past the first two items, but the third (bridges) is a significant
> piece of work that will require some knowledge of asm and gcc c++ vtable
> layouts and PA calling conventions..
> 
> if a few other people are interested, i'd be willing to help out....
> but it looks like a lot of work :(

I assume you're talking about OO.o1, given the libneon23-dev build
dependency. Not sure, if you want to make this work for sarge, but in
any other case, please consider doing the work on OOo.2. Some people
are working on this, see #debian-oo and the debian-oo mailing list.

	Matthias
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
