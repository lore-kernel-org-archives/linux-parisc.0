From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Comments?
Date: Tue, 8 Mar 2005 12:44:53 -0500 (EST)
Message-ID: <200503081744.j28HirKt001889@hiauly1.hia.nrc.ca>
References: <20050308173236.GS23803@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050308173236.GS23803@baldric.uwo.ca> from "Carlos O'Donell" at
	Mar 8, 2005 12:32:36 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > 2004-11-02  Hans-Peter Nilsson  <hp@axis.com>
> > 
> >         * elflink.c (_bfd_elf_create_got_section): Hide _GLOBAL_OFFSET_TABLE_.
> 
> I'd seen that fly by on binutils and it caused a certain amount of grief
> in glibc. I'm not quite sure what the rational was behind hiding _GOT_.

I believe that the idea was that main code would see its _GOT_ address
and shared libraries their respective _GOT_ address.  It turns out that
it was sort of a fluke that function pointer canonicalization worked.
Only function pointers in the main part of an application are not
resolved.  Shared library function pointers are resolved when the
library is loaded.  __cffc was always looking at the _GOT_ address
for the main app (i.e., the main _GLOBAL_OFFSET_TABLE_ value overrode
the shared library symbol).

This problem was fixed yesterday by Alan Modra.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
