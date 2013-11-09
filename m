From: =?windows-1252?Q?Thibaut_Var=E8ne?= <T-Bone@parisc-linux.org>
Subject: Re: parisc-linux.org losing hw hosting after this month
Date: Sat, 9 Nov 2013 22:26:04 +0100
Message-ID: <C9305BC2-086F-48E8-944C-D7751095769A@parisc-linux.org>
References: <20131105003509.GA19864@dannf.org> <1383612962.2150.4.camel@dabdike> <BLU0-SMTP219421FBE297D4BFF757F897F10@phx.gbl> <20131105022209.GC22393@dannf.org> <52786CFD.1070009@hp.com> <527D6428.8060205@gmx.de> <20131108223833.GB32729@dannf.org> <20131109082036.62C881A8@taggart.lackof.org> <57A18B42-217E-4588-A0AF-6E4275A501F4@parisc-linux.org> <20131109191725.DDCE31A1@taggart.lackof.org> <527E9A4E.5000008@gmx.de>
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1816\))
Content-Type: text/plain; charset=windows-1252
Cc: Matt Taggart <matt@lackof.org>, dann frazier <dannf@dannf.org>,
	"Craig Lamparter (ISS Linux)" <craig.lamparter@hp.com>,
	John David Anglin <dave.anglin@bell.net>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <527E9A4E.5000008@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Le 9 nov. 2013 =E0 21:25, Helge Deller <deller@gmx.de> a =E9crit :

> On 11/09/2013 08:17 PM, Matt Taggart wrote:
>> Thibaut Var=E8ne writes:
>>> Until then, it's presumably impossible to move the domain to a new
>>> owner. I've just tried with my registrar of choice (ovh.com) and it
>>> says that I can only move the domain there *without* changing owner=
ship
>>=20
>> Weird. So does that mean to change ownership either you are going to=
 have=20
>> to move it within my registrar or I am going to have to move it with=
in=20
>> yours?
>>=20
>>> As a temporary workaround, I could give you the IP addresses of my =
DNS
>>> servers (once I've readied them for handling p-l.o, which, to begin
>>> with, means I have to copy the existing zone), which would for all
>>> practical purposes give me control over the domain until it can be
>>> properly moved next summer (which must not be forgotten, especially=
 now
>>> that you've unlocked the domain).
>>=20
>> I can change the nameservers (or anything else about the domain) whe=
never,=20
>> just let me know. taggart@OFTC
>=20
> Just as a side-note:
> Could we let it run as-is as long as possible? At least until the A50=
0 is really turned off?

My plan is to setup new DNSes with the current situation to start with,=
 and have Matt register them as zone DNS. That=92ll be transparent for =
everyone, situation unchanged, until the A500 is powered off, at which =
point we can devise a new setup. As I told you, my primary concern is w=
ith email, so I=92ll have that covered :)
>=20
> Dave & me have the parisc-linux debian dpkg repository still on the A=
500 which is still in=20
> heavy use until the debian-ports repository is mostly filled=85

I might be able to *temporarily* (emphasis on that word) host it, provi=
ded it=92s not =AB too big =BB, but as I said, specific protocols such =
as FTP or GIT are not possible (only HTTP).

HTH

T-Bone--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
