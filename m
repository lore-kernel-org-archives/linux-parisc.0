Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA07927
	for <parisc-linux@puffin.external.hp.com>; Sun, 9 Apr 2000 10:56:47 -0600
From: Bdale Garbee <bdale@gag.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] building a glibc-based tool chain
In-Reply-To: <87em8fjlkm.fsf@tarwebok.thepuffingroup.com>
Message-Id: <20000409165645.647F51E9D6@rover.gag.com>
Date: Sun,  9 Apr 2000 10:56:45 -0600 (MDT)
List-ID: <linux-parisc.vger.kernel.org>

In article <87em8fjlkm.fsf@tarwebok.thepuffingroup.com> you wrote:

> So, this is probably another side effect of gcc and binutils assuming
> that PA-RISC ELF targets are always 64-bit targets.  However I'm not
> up on the details of Sammy's ELF32 ABI ...

Aha.

> Needless to say we won't be compiling any C++ programs for a little
> while at least (can we remove dselect from the dpkg sources? please?
> pretty please? :)

Yes, in fact.  I chatted with Wichert (Debian Project Leader and one of the
current dpkg maintainers) the other night about how to bootstrap dpkg, and
there are now options that assist the process by skipping the dselect build
and the documentation build, both of which have *very* deep dependency chains.
On the other hand, I've been using Debian so long that dselect (with the apt
method, of course!) is a highly productive tool to me...  :-)  

> So, you could probably just edit them out of your spec file manually for 
> the time being.

I hadn't thought of that.  I'll try it in a bit.  Family obligations this
morning and the last regular-season Avalanche hockey game this afternoon...

Oh, and one more set of observations from last night, that I got too tired to
send off properly before I gave up and went to bed:

If you build glibc ala Paul, install it, build gcc and install it, then
build glibc again *pristine*, it builds completely and installs.  I gather
we've got a circular dependency between gcc and glibc builds.  I wasn't overly
surprised by this, but it's sort of rude after building cross compilation
environments using newlib.  So, once there is a bootstrapped glibc in the 
target tree, and gcc has been built, go back and undo the hacks (except the 
Unix98 one, which is still needed) and glibc builds and installs cleanly!

Bdale
