From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Comments?
Date: Tue, 8 Mar 2005 14:02:33 -0500 (EST)
Message-ID: <200503081902.j28J2XMe002188@hiauly1.hia.nrc.ca>
References: <20050308175445.GV23803@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050308175445.GV23803@baldric.uwo.ca> from "Carlos O'Donell" at
	Mar 8, 2005 12:54:45 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > This problem was fixed yesterday by Alan Modra.
> 
> I'm not sure what you mean in your statement "shared library function
> pointers are resolved when the library is loaded?" The function pointers
> exist as two-byte entries in the PLT, and are non-unique, and they
> aren't resolved until call time with lazy resolution.

This is what Alasn said:

  I checked.  &_GLOBAL_OFFSET_TABLE_ in fptr.c does resolve to the main
  app GOT before the change.  That in fact is what is needed, because
  according to what I see in dl-machine.h, plabels in shared libs will be
  resolved.  I think it's only plabels in the main app for global
  functions that won't be resolved (because they point into the plt).

  Hmm.  If PLABEL32 relocs in the main app were emitted as dynamic relocs,
  then ld.so would call _dl_make_fptr for them.  I think you wouldn't need
  __canonicalize_funcptr_for_compare any more..

I don't think we could completely do away with __cffc but if the
plabels were always resolved we could just look inside the plabel
to get the function address.

> I would imagine that the main _GOT_ is supposed to override the shared
> library _GOT_. __cffc is only looking at the _GOT_ to get the fptr that
> the dynamic loader wrote there during setup, so that it can get called
> for symbol resolution. This setup is done for all objects, which
> includes all the _GOT_'s, from the application to all the loaded shared
> libraries.

If the dynamic loader always uses the main app's got for the trampoline,
__cffc would work for plabels in shared libraries that used lazy linking.

> Or rather are you saying, that from a shared library, the library saw
> only the _GOT_ from the main applicaiton? I would think that this 
> wouldn't effect the library since the loader setup r19 properly, and
> aslong as it doesn't use _GOT_ then it's fine.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
