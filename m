From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
Date: Tue, 18 Mar 2003 13:53:04 -0500 (EST)
Message-ID: <200303181853.h2IIr53R016234__44882.740561343$1416622302$gmane$org@hiauly1.hia.nrc.ca>
References: <3E7761F6.403DC5@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: jsoe0708@tiscali.be, willy@debian.org, tausq@debian.org,
	doko@cs.tu-berlin.de, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org, parisc-linux@lists.parisc-linux.org,
	kuznet@ms2.inr.ac.ru, linux-net@vger.kernel.org
To: b.gunreben@web.de (b.gunreben)
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <3E7761F6.403DC5@web.de> from "b.gunreben" at Mar 18, 2003 07:14:14 pm
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> This is independend from the kernel version (2.4 and 2.5 behave all the
> same). The function __canonicalize_funcptr_for_compare seems to be newly
> introduced in libgcc with gcc 3.3, and seems to be the cause of this error.

Do you have the same problem with a 3.0.4 built kernel?  I have been
using a 3.3 built glibc for some months now.

__canonicalize_funcptr_for_compare depends critically on the
the initial setup of function descriptors by the dynamic loader
and the trampoline in the dynamic loader used to resolve the
address of functions.  This could easily break if someone
unknowing messes with the pa specific parts of the dynamic
loader or the setup of function descriptors.

I'm building glibc-2.3.1-15 and should know soon if something
has changed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
