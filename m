From: Jurij Smakov <jurij@wooyd.org>
Subject: Re: HPPA and Squeeze
Date: Sun, 5 Jul 2009 14:44:31 +0100
Message-ID: <20090705134431.GA6598@droopy.oc.cox.net>
References: <20090704233454.B1A2B5160@hiauly1.hia.nrc.ca> <4A506D2C.6080801@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Kurt Roeckx <kurt@roeckx.be>, pkern@debian.org,
	debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	debian-release@lists.debian.org,
	Adam C Powell IV <hazelsct@debian.org>
To: Helge Deller <deller@gmx.de>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <4A506D2C.6080801@gmx.de>
Resent-Message-ID: <O9cwNgqAeiM.A.XIG.S5KUKB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Sun, Jul 05, 2009 at 11:06:52AM +0200, Helge Deller wrote:
> On 07/05/2009 01:34 AM, John David Anglin wrote:
>>> On Fri, Jul 03, 2009 at 09:28:00PM +0200, Philipp Kern wrote:
>>>> On Fri, Jul 03, 2009 at 08:57:56PM +0200, Kurt Roeckx wrote:
>>>>> Did something change to peri?  I'm currently only seeing them on
>>>>> penalosa.
>>>> UP kernel, maybe?
>>> Both peri and penalosa run 2.6.29-2-parisc64-smp and from what I
>>> can tell run on identical hardware.
>>
>> I tried a SMP kernel (2.6.30.1 with the patch set posted earlier) on
>> my rp34404.  Fired up a GCC build.  It didn't take more than a few
>> minutes to trigger a couple of segvs in /bin/sh.  On the other hand,
>> I ran a UP version of 2.6.30 for more than a week without any major
>> problems.
>
> So, instead of just complaining, wouldn't it be useful if someone with
> root access would install a UP kernel (and disable nscd) for the time
> being on the build servers?
> That way we all would avoid debian build problems and could concentrate
> on solving the issues with the SMP kernel itself.
>
> In the meantime, all (IMHO) major kernel patches have now been included
> in Linus' 2.6.31-rc2 kernel and I plan to backport and send them to the
> stable-kernel team for inclusion into 2.6.29 and 2.6.30 stable
> kernel series.

HPPA folks, can you please convert at least one buildd to a UP
configuration? I have another example of extreme buildd flakiness mentioned
in bug #529485. Adam C Powell IV <hazelsct@debian.org> writes:

  That's too bad.  I saw 6 attempts to do 3.0.0-X of which two passed the
  first try and four failed.  At that rate (1/3), it would take nine
  attempts to have a decent chance of passing both rounds (debug static
  and optimized shared/static).

HPPA is the only arch for which petsc failed to build, and currently this
blocks petsc transition.

Best regards,
-- 
Jurij Smakov                                           jurij@wooyd.org
Key: http://www.wooyd.org/pgpkey/                      KeyID: C99E03CC
