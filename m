Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 54460482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 Jan 2003 09:50:46 -0700 (MST)
Message-Id: <200301291650.h0TGohGi011015@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] We need our own libgcc-compat for a leaked __clz_tab
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Wed, 29 Jan 2003 11:50:43 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030129054331.GF9855@systemhalted> from "Carlos O'Donell" at Jan 29, 2003 00:43:31 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> Problem:
> 
> - GCC used to export a symbol for __clz_tab (GLOBAL DEFAULT)
> - Everything in debian is being built with newer tools (GCC 3.2).
> - Symbol is no longer leaked (LOCAL HIDDEN)
> - Libraries that had the leadked symbol are rebuilt (e.g. libcrypto)
> - Binaries that had relocations against the symbol are failing (e.g.
>   wget)
> 
> Solution:
> 
> - Create a libgcc-compat in glibc for the symbol __clz_tab
> 	= Various arches have them for certain symbols that were leaked
> 	= from GCC when we the GNU tools didn't have ".hidden"
> 	= So examples exist...
> - Test the solution to see that atleast "wget" works.
> - Put it into Debians glibc as a dpatch.
> - Submit upstream for fame and glory.

As I said, this is a generic problem affecting all GCC ports.  The
correct solution probably isn't adding the symbol to a PA specific
libgcc-compat in glibc.  I think the matter needs discussion on
gcc@gcc.gnu.org.  I'm not sure if there is a reason for hiding this
symbol.  I would file a GCC PR.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
