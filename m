From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: Re: Bug#364231: [parisc-linux] Re: Bug#364231: exception catching
Date: Tue, 2 May 2006 14:27:49 +0200
Message-ID: <17495.20549.807070.229385__8419.171794276$1416624080$gmane$org@gargle.gargle.HOWL>
References: <20060501025703.GL18891@mauritius.dodds.net>
	<200605011356.k41DugMD023580@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: steven.robbins@videotron.ca,
 debian-glibc@lists.debian.org,
 parisc-linux@lists.parisc-linux.org,
 Steve Langasek <vorlon@debian.org>,
 debian-hppa@lists.debian.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
 364231@bugs.debian.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200605011356.k41DugMD023580@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

[should we drop parisc-linux?]

John David Anglin writes:
> > Er, no; we're talking about official Debian packages here, and the
> > libstdc++.so.6 in Debian is now from gcc-4.1.  The problem is precisely that
> > GMP *is* being built using gcc-4.0, but libstdc++ is from gcc-4.1, resulting
> > in the double libgcc_s problem.
> 
> Then, you must build *eveything* for hppa with gcc-4.1 or later.
> 
> Unfortunately, there's an ABI break.  Mixing libraries compiled with
> 4.0 or earlier with libraries compiled with 4.1 or later is just going
> to cause unnecessary problems.   3.3 uses libstdc++.so.5, so you
> avoid the double libgcc_s problem building GMP.  However, you still
> have the ABI change affecting the passing and return of complex types.
> 
> At a fundamental level, libstdc++.so.6, libgfortran.so.1.0.0 and any
> other gcc libraries built with 4.1 or later need glibc built with 4.1
> to function correctly because of the various complex functions in
> the math library.
> 
> I think there's a dynamic loader bug here as well.  I'm just
> guessing but I think the double libgcc_s problem causes a problem
> with the handling of .eh_frame data.


Ok, coming back to the question of the system compiler on hppa for
etch. Assuming that hppa does want to do that:

- is glibc buildable with gcc-4.1 on hppa?
- libstdc++6 would need to conflict with libgcc2, which seems to be
  doable, but then rules out g++-3.4 and g++-4.0 as a fallback
  solution, where g++-4.1 fails.
- libgfortran did have a soname change, so nothing needs to be done.
- is libffi hit by the ABI change as well?

	Matthias
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
