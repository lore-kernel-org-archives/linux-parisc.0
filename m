Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA03636
	for <parisc-linux@puffin.external.hp.com>; Tue, 3 Oct 2000 19:23:01 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 4 Oct 2000 01:23:54 -0000
To: drepper@cygnus.com (Ulrich Drepper)
Cc: parisc-linux@thepuffingroup.com, debian-hppa@lists.debian.org,
        parisc@lists.linuxcare.com
Subject: Re: [parisc-linux] glibc 2.1.94 CVS merge, packages on the way, ABI breakage :(
References: <87aecl60mf.fsf@linuxcare.com>
	<m3ya05d0nh.fsf@otr.mynet.cygnus.com> <87u2at4l1k.fsf@linuxcare.com>
	<m3pulhczs4.fsf@otr.mynet.cygnus.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 03 Oct 2000 21:23:43 -0400
In-Reply-To: Ulrich Drepper's message of "03 Oct 2000 15:42:35 -0700"
Message-ID: <87og114cww.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Ulrich Drepper <drepper@redhat.com> writes:

> David Huggins-Daines <dhd@linuxcare.com> writes:
> 
> > I take it that libc.so, libm.so, and ld.so should all be versioned
> > with GLIBC_2.2 as the base, then?
> 
> Every single DSO.  There is no compatibility to be preserved.

Okay, yes, you're right.  Unfortunately we've built a bunch of
binaries against our broken libc, so it will all have to be rebuilt,
because all binaries expect to see GLIBC_2.0 and GLIBC_2.1 versions.

But I guess this is the right thing to do, since we really do not want
any of the compatibility cruft bloating our libc.

HP people note: Yes it looks like we have to rebuild everything.  I
think I can get things up again rather quickly, as I just need to
build a static toolchain and then relink all the packages that are
sitting around built on my A180.  We will have to clear out the
archive in pehc:/pub/debian-hppa though.

I am not very pleased with symbol versioning at the moment :(

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
