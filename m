From: =?windows-1252?Q?Thibaut_Var=E8ne?= <T-Bone@parisc-linux.org>
Subject: Re: parisc-linux.org losing hw hosting after this month
Date: Mon, 11 Nov 2013 20:43:47 +0100
Message-ID: <3B12942A-F2B8-459E-85AE-3AC9DB288D67@parisc-linux.org>
References: <20131105003509.GA19864@dannf.org> <1383612962.2150.4.camel@dabdike> <BLU0-SMTP219421FBE297D4BFF757F897F10@phx.gbl> <20131105022209.GC22393@dannf.org> <52786CFD.1070009@hp.com> <527D6428.8060205@gmx.de> <20131108223833.GB32729@dannf.org> <20131109082036.62C881A8@taggart.lackof.org> <57A18B42-217E-4588-A0AF-6E4275A501F4@parisc-linux.org> <20131109191725.DDCE31A1@taggart.lackof.org> <527E9A4E.5000008@gmx.de> <C9305BC2-086F-48E8-944C-D7751095769A@parisc-linux.org> <527EA9C9.2070309@gmx.de>
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
Content-Type: text/plain; charset=windows-1252
Cc: Matt Taggart <matt@lackof.org>, dann frazier <dannf@dannf.org>,
	"Craig Lamparter (ISS Linux)" <craig.lamparter@hp.com>,
	John David Anglin <dave.anglin@bell.net>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc@vger.kernel.org, Matthew Wilcox <matthew@wil.cx>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <527EA9C9.2070309@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 9 nov. 2013, at 22:31, Helge Deller <deller@gmx.de> wrote:

> Hi Thibaut,
>=20
> On 11/09/2013 10:26 PM, Thibaut Var=E8ne wrote:
>>> Just as a side-note: Could we let it run as-is as long as possible?
>>> At least until the A500 is really turned off?
>>=20
>> My plan is to setup new DNSes with the current situation to start
>> with, and have Matt register them as zone DNS. That=92ll be transpar=
ent
>> for everyone, situation unchanged, until the A500 is powered off, at
>> which point we can devise a new setup. As I told you, my primary
>> concern is with email, so I=92ll have that covered :)
>=20
> That's good!

Quick update: the DNS transition is done, I now control the domain's DN=
S. As usual, direct complaints to /dev/null if anything breaks ;-)

That aside, regarding my upcoming plans: I'm fine with hosting followin=
g websites:
- www (as far as the main static website is concerned - NO HOMEDIRs - s=
ince I already host a mirror, it's really easy)
- wiki (already hosted by me, no change)
- ftp (web access only, provided the debian-ports part of the archive d=
oesn't grow much beyond 20G, and for as short a period of time as can b=
e achieved.)

hwdb will have to go, I just cba moving it and dealing with potential P=
HP exploits ;P
cvs will have to go too, if someone wants to archive it for posterity (=
it's about 8.4G), now would be a good time.

Regarding email, my plan is to setup a "forward-only" MTA. As far as I =
can tell, most active users of p-l.o already have a .forward setup, wit=
h the notable exception of willy (explicitly CC'd here). Of course, if =
someone wants to step up and handle p-l.o email on their own, they're w=
elcome to raise a hand ;)

NB: the people having bits of importance left in their homedir on p-l.o=
 should probably think about backing them up ASAP, these won't be moved=
 over.

Since the domain expires on August 2014, I believe this gives us suffic=
ient time to evaluate "what to do next". As far as *I* am concerned, I =
plan to have transitioned all references to my p-l.o email address (mos=
tly in source code) by then, meaning that *I* will probably not see a n=
eed to keep the domain going beyond that point. I would like to explici=
tly point out here that I commit myself to providing hosting facilities=
 as explained above UNTIL THEN, after which I reserve the right to "mov=
e on".

HINT HINT HINT: if someone wants to keep p-l.o going after that point, =
they'll have to keep that deadline in mind.
I am offering a transition as the A500 is being decommissioned, but I a=
m NOT offering a permanent solution.

=46inally, do we have an exact date as to when the A500 will be powered=
 down?

HTH,
T-Bone--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
