From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] HCRX-24 and missing consoles on my C200
Date: Mon, 19 Dec 2005 13:27:05 -0700
Message-ID: <20051219202705.GR2361__21196.5206930929$1416624578$gmane$org@parisc-linux.org>
References: <43971676.1010009@gmail.com> <200512191639.44027.deller@gmx.de> <43A6F709.3080008@bizzi.org> <200512192104.48593.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Fabio Bizzi <fbizzi@bizzi.org>,
 parisc-linux@parisc-linux.org,
 debian-hppa@lists.debian.org
To: Helge Deller <deller@gmx.de>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <200512192104.48593.deller@gmx.de>
Resent-Message-ID: <jLahTC.A.rNH.KtxpDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Mon, Dec 19, 2005 at 09:04:48PM +0100, Helge Deller wrote:
> 2.6.15-rc6-pa1 is currently beeing built.
> During the next hour I assume it should be finished and you may download it from here: http://cvs.parisc-linux.org/download/linux-2.6/
> (I assume a B180 might be close to your c200 ?).

Unfortunately not.  The B180 build has CCIO disabled, so it's much less
useful than it might otherwise be.  I keep threatening to rename the
b180_defconfig to c110_defconfig and enable CCIO, HPPB, ZALON, LASI_82596,
HIL, MUX and HARMONY.

Then I think I should just delete it and people with Raven-class
machines should just use the 32 build and be happy about it.

So in the meantime we keep building a not-very-useful config.


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
