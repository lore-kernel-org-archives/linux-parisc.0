From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: OPD's on hppa-linux,
	and what to do about __cffc's fragility.
Date: Tue, 8 Mar 2005 16:48:18 -0500 (EST)
Message-ID: <200503082148.j28LmIRY002942@hiauly1.hia.nrc.ca>
References: <20050308210851.GA23803@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: amodra@bigpond.net.au,
 parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050308210851.GA23803@baldric.uwo.ca> from "Carlos O'Donell" at
	Mar 8, 2005 04:08:51 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I'm really a stickler for nomeclature. In my mind a "resolved" plabel is
> one whose ip/gp point to the true and final function address after the ELF
> symbol resolution rules have been followed for that symbol. Is this the
> generally accepted definition? I interchangably think plabel == fptr.

I agree with the former definition regarding a resolved plabel.  I believe
that the term plabel is interchangeable with the term function descriptor.
A function pointer on the otherhand may point either directly to the
code address of the function or to a plabel.

> > > I would imagine that the main _GOT_ is supposed to override the shared
> > > library _GOT_. __cffc is only looking at the _GOT_ to get the fptr that
> > > the dynamic loader wrote there during setup, so that it can get called
> > > for symbol resolution. This setup is done for all objects, which
> > > includes all the _GOT_'s, from the application to all the loaded shared
> > > libraries.
> > 
> > If the dynamic loader always uses the main app's got for the trampoline,
> > __cffc would work for plabels in shared libraries that used lazy linking.
> 
> To clarify this, you mean to say if the loader always uses the main
> app's plt/got stub then everything would be okay. The check in __cffc to
> see if the plabel has been resolved would work (e.g. got !=
> &_GLOBAL_OFFSET_TABLE_).

Yes.

> It didn't make a difference in the past because the shared library
> plabels were already resolved? Wouldn't this mean that lazy linking
> wasn't working at all?

If shared libraries used the main app's &_GLOBAL_OFFSET_TABLE_, then
lazy linking could be working.   The testcase that I posted had a
plabel constructor in the shared library.  I recall now that the got
pointer for the plabel was the main app's &_GLOBAL_OFFSET_TABLE_.

> I don't quite understand why this broke, if someone would be so kind as
> the point out the error in my thinking.

Hiding _GLOBAL_OFFSET_TABLE_, resulted in _GLOBAL_OFFSET_TABLE_
being local to shared libraries, as a result __cffc no longer used
the main app's &_GLOBAL_OFFSET_TABLE_.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
