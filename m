From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Re: Comments?
Date: Tue, 8 Mar 2005 12:54:45 -0500
Message-ID: <20050308175445.GV23803@baldric.uwo.ca>
References: <20050308173236.GS23803@baldric.uwo.ca>
	<200503081744.j28HirKt001889@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503081744.j28HirKt001889@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Mar 08, 2005 at 12:44:53PM -0500, John David Anglin wrote:
> > > 2004-11-02  Hans-Peter Nilsson  <hp@axis.com>
> > > 
> > >         * elflink.c (_bfd_elf_create_got_section): Hide _GLOBAL_OFFSET_TABLE_.
> > 
> > I'd seen that fly by on binutils and it caused a certain amount of grief
> > in glibc. I'm not quite sure what the rational was behind hiding _GOT_.
> 
> I believe that the idea was that main code would see its _GOT_ address
> and shared libraries their respective _GOT_ address.  It turns out that
> it was sort of a fluke that function pointer canonicalization worked.
> Only function pointers in the main part of an application are not
> resolved.  Shared library function pointers are resolved when the
> library is loaded.  __cffc was always looking at the _GOT_ address
> for the main app (i.e., the main _GLOBAL_OFFSET_TABLE_ value overrode
> the shared library symbol).
> 
> This problem was fixed yesterday by Alan Modra.

I'm not sure what you mean in your statement "shared library function
pointers are resolved when the library is loaded?" The function pointers
exist as two-byte entries in the PLT, and are non-unique, and they
aren't resolved until call time with lazy resolution.

I would imagine that the main _GOT_ is supposed to override the shared
library _GOT_. __cffc is only looking at the _GOT_ to get the fptr that
the dynamic loader wrote there during setup, so that it can get called
for symbol resolution. This setup is done for all objects, which
includes all the _GOT_'s, from the application to all the loaded shared
libraries.

Or rather are you saying, that from a shared library, the library saw
only the _GOT_ from the main applicaiton? I would think that this 
wouldn't effect the library since the loader setup r19 properly, and
aslong as it doesn't use _GOT_ then it's fine.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
