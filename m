From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] OPD's on hppa-linux,
	and what to do about __cffc's fragility.
Date: Tue, 8 Mar 2005 16:08:51 -0500
Message-ID: <20050308210851.GA23803@baldric.uwo.ca>
References: <20050308175445.GV23803@baldric.uwo.ca>
	<200503081902.j28J2XMe002188@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Alan Modra <amodra@bigpond.net.au>,
 parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503081902.j28J2XMe002188@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Mar 08, 2005 at 02:02:33PM -0500, John David Anglin wrote:
> > > This problem was fixed yesterday by Alan Modra.
> > 
> > I'm not sure what you mean in your statement "shared library function
> > pointers are resolved when the library is loaded?" The function pointers
> > exist as two-byte entries in the PLT, and are non-unique, and they
> > aren't resolved until call time with lazy resolution.

Once, we start quoting Alan, I believe it's time to atleast let him read
some of the remarks. Perhaps he will have some insightful comment.
 
> This is what Alasn said:
> 
>   I checked.  &_GLOBAL_OFFSET_TABLE_ in fptr.c does resolve to the main
>   app GOT before the change.  That in fact is what is needed, because
>   according to what I see in dl-machine.h, plabels in shared libs will be
>   resolved.  I think it's only plabels in the main app for global
>   functions that won't be resolved (because they point into the plt).
> 
>   Hmm.  If PLABEL32 relocs in the main app were emitted as dynamic relocs,
>   then ld.so would call _dl_make_fptr for them.  I think you wouldn't need
>   __canonicalize_funcptr_for_compare any more..
> 
> I don't think we could completely do away with __cffc but if the
> plabels were always resolved we could just look inside the plabel
> to get the function address.

Perhaps some background and clarification...

Okay, *ABS* (R_PARISC_IPLT, r_sym == 0) entries are automatically
relocated at startup, because we have enough information, we are already
walking the PLT list, and it takes only a single add to complete the
relocation. 

Next, anything else (R_PARISC_IPLT, r_sym != 0) is pointed at the
plt/got stub (which calls the trampoline _dl_runtime_resolve) since it
will require symbol resolution to fixup.

I don't quite understand what Alan is getting at when he says "If
PLABEL32 relocs in the main app were emitted as dynamic relocs,"

I'm really a stickler for nomeclature. In my mind a "resolved" plabel is
one whose ip/gp point to the true and final function address after the ELF
symbol resolution rules have been followed for that symbol. Is this the
generally accepted definition? I interchangably think plabel == fptr.

> > I would imagine that the main _GOT_ is supposed to override the shared
> > library _GOT_. __cffc is only looking at the _GOT_ to get the fptr that
> > the dynamic loader wrote there during setup, so that it can get called
> > for symbol resolution. This setup is done for all objects, which
> > includes all the _GOT_'s, from the application to all the loaded shared
> > libraries.
> 
> If the dynamic loader always uses the main app's got for the trampoline,
> __cffc would work for plabels in shared libraries that used lazy linking.

To clarify this, you mean to say if the loader always uses the main
app's plt/got stub then everything would be okay. The check in __cffc to
see if the plabel has been resolved would work (e.g. got !=
&_GLOBAL_OFFSET_TABLE_).

It didn't make a difference in the past because the shared library
plabels were already resolved? Wouldn't this mean that lazy linking
wasn't working at all?

So only the main app symbols had to be resolved, and this worked fine.
Thus the comparison worked fine.

I don't quite understand why this broke, if someone would be so kind as
the point out the error in my thinking.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
