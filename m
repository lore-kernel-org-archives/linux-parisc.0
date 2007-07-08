From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc is broken because of gcc
Date: Sun, 8 Jul 2007 11:04:07 -0400 (EDT)
Message-ID: <200707081504.l68F47s9007180__49138.3553519428$1416624409$gmane$org@hiauly1.hia.nrc.ca>
References: <4690DC22.1070307@aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: jbailey@raspberryginger.com,
 debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: aurelien@aurel32.net (Aurelien Jarno)
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <4690DC22.1070307@aurel32.net> from "Aurelien Jarno" at Jul 8, 2007 02:44:18 pm
Resent-Message-ID: <zKwBn.A.WDC.iJQkGB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

> >> On the other hand, the LinuxThreads build on other architectures are
> >> still fine even with the latest gcc in Debian.
> > 
> > Is the __librt_multiple_threads symbol defined, undefined or not
> > used in librt.so?
> > 
> 
> On both hppa and m68k I get:
> 00000000      DO *UND*  00000004  GLIBC_PRIVATE __librt_multiple_threads

So, it would seem m68k is also broken if the definition
in libc-2.5.so is hidden.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
