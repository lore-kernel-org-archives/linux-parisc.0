From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Bug#364231: [parisc-linux] Re: Bug#364231: exception catching
Date: Mon, 1 May 2006 09:56:41 -0400 (EDT)
Message-ID: <200605011356.k41DugMD023580__17646.4157797911$1416624078$gmane$org@hiauly1.hia.nrc.ca>
References: <20060501025703.GL18891@mauritius.dodds.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: steven.robbins@videotron.ca,
 364231@bugs.debian.org,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: vorlon@debian.org (Steve Langasek)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060501025703.GL18891@mauritius.dodds.net> from "Steve
	Langasek" at Apr 30, 2006 07:57:03 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Er, no; we're talking about official Debian packages here, and the
> libstdc++.so.6 in Debian is now from gcc-4.1.  The problem is precisely that
> GMP *is* being built using gcc-4.0, but libstdc++ is from gcc-4.1, resulting
> in the double libgcc_s problem.

Then, you must build *eveything* for hppa with gcc-4.1 or later.

Unfortunately, there's an ABI break.  Mixing libraries compiled with
4.0 or earlier with libraries compiled with 4.1 or later is just going
to cause unnecessary problems.   3.3 uses libstdc++.so.5, so you
avoid the double libgcc_s problem building GMP.  However, you still
have the ABI change affecting the passing and return of complex types.

At a fundamental level, libstdc++.so.6, libgfortran.so.1.0.0 and any
other gcc libraries built with 4.1 or later need glibc built with 4.1
to function correctly because of the various complex functions in
the math library.

I think there's a dynamic loader bug here as well.  I'm just
guessing but I think the double libgcc_s problem causes a problem
with the handling of .eh_frame data.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
