From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcj can't make shared libs on hppa
Date: Tue, 21 Feb 2006 16:35:43 -0500 (EST)
Message-ID: <200602212135.k1LLZiUn005694__39001.2228898287$1416624584$gmane$org@hiauly1.hia.nrc.ca>
References: <17402.31286.940841.655257@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org,
 debian-hppa@lists.debian.org
To: doko@cs.tu-berlin.de (Matthias Klose)
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <17402.31286.940841.655257@gargle.gargle.HOWL> from "Matthias Klose" at Feb 21, 2006 03:25:58 am
Resent-Message-ID: <6wkGvC.A.xXG.tt4-DB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

> please see http://bugs.debian.org/353346
> 
> same thing with the 4.1 rc1 build.

Right, it's a linker bug.  The following plabel is dropped from the
shared library.

0000000c R_PARISC_PLABEL32  .L_ZN2A1C1Ev0

This plabel is for a local alias.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
