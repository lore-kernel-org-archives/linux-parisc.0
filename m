From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [Fwd: [patch/hppa] Floating point exception
Date: Mon, 16 Jan 2006 17:52:34 -0500 (EST)
Message-ID: <200601162252.k0GMqYA1009711__38078.0485844754$1416623994$gmane$org@hiauly1.hia.nrc.ca>
References: <20060116224337.GC22635@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: kyle@debian.org,
 grundler@parisc-linux.org,
 randolph@tausq.org,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org,
 debian-release@lists.debian.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <20060116224337.GC22635@colo.lackof.org> from "Grant Grundler" at Jan 16, 2006 03:43:37 pm
Resent-Message-ID: <xCmJPB.A.A1E.leCzDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

> >   The
> > only reason they would need rebuilt after a glibc bug fix would be if the
> > glibc ABI changed in the process, and that would be Very Bad<tm>.
> 
> Yeah, hopefully that doesn't happen.

As I have previously mentioned, there is a pending ABI issue affecting
the passing of complex and vector floating point numbers on the PA
(floats in particular on the 32-bit port, and both floats and doubles
on the 64-bit port).  It turns out we are using the wrong registers
to pass these types.

I'm considering fixing this in GCC 4.1 (patch under test this weekend).
We already have an ABI change under HP-UX in GCC 4.1 (dwarf2 exception
support).  I've also observered that there is an incompatibility in
libgcc under linux between 4.0 and 4.1.  I don't know if this is an ABI
change or not.  For these reasons, now is the time to fix these issue.

If anybody feels strongly that the status quo should be maintained
please let me know.  I'm going to bump the libgcc_s versions.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
