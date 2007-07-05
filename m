From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc is broken because of gcc
Date: Thu, 5 Jul 2007 13:28:42 -0400 (EDT)
Message-ID: <200707051728.l65HSg7S008597__23960.0824345418$1416624403$gmane$org@hiauly1.hia.nrc.ca>
References: <468D22EA.7000405@aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: jbailey@raspberryginger.com,
 debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: aurelien@aurel32.net (Aurelien Jarno)
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <468D22EA.7000405@aurel32.net> from "Aurelien Jarno" at Jul 5, 2007 06:57:14 pm
Resent-Message-ID: <pNnkZC.A.stF.E7SjGB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

> On the other hand, the LinuxThreads build on other architectures are
> still fine even with the latest gcc in Debian.

Is the __librt_multiple_threads symbol defined, undefined or not
used in librt.so?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
