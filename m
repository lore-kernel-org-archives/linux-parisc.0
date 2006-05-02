From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Bug#364231: [parisc-linux] Re: Bug#364231: exception catching
Date: Tue, 2 May 2006 09:49:33 -0400 (EDT)
Message-ID: <200605021349.k42DnX8b029645__47127.2803414196$1416624080$gmane$org@hiauly1.hia.nrc.ca>
References: <17495.20549.807070.229385@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: 364231@bugs.debian.org,
 steven.robbins@videotron.ca,
 debian-glibc@lists.debian.org,
 parisc-linux@lists.parisc-linux.org,
 vorlon@debian.org,
 debian-hppa@lists.debian.org
To: doko@cs.tu-berlin.de (Matthias Klose)
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <17495.20549.807070.229385@gargle.gargle.HOWL> from "Matthias Klose" at May 2, 2006 02:27:49 pm
Resent-Message-ID: <gVdNTC.A.wID.gt2VEB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

> Ok, coming back to the question of the system compiler on hppa for
> etch. Assuming that hppa does want to do that:
> 
> - is glibc buildable with gcc-4.1 on hppa?

As far as I know, there's no new problems using 4.1 instead of 4.0.  See
http://lists.parisc-linux.org/pipermail/parisc-linux/2006-April/028894.html
and test results for a gcc 4.2.0 build using this glibc build
http://lists.parisc-linux.org/pipermail/parisc-linux/2006-April/028918.html

> - libstdc++6 would need to conflict with libgcc2, which seems to be
>   doable, but then rules out g++-3.4 and g++-4.0 as a fallback
>   solution, where g++-4.1 fails.

True.

> - is libffi hit by the ABI change as well?

No.  It's not affected because it doesn't support complex types.

I have one libffi fix that's not yet in 4.2.0 that fixes the remaining
Java testsuite failures.  I haven't tested a backport to 4.1.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
