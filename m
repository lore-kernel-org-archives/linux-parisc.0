From: Helge Deller <deller@gmx.de>
Subject: Re: parisc-linux.org losing hw hosting after this month
Date: Sat, 09 Nov 2013 22:31:53 +0100
Message-ID: <527EA9C9.2070309@gmx.de>
References: <20131105003509.GA19864@dannf.org> <1383612962.2150.4.camel@dabdike> <BLU0-SMTP219421FBE297D4BFF757F897F10@phx.gbl> <20131105022209.GC22393@dannf.org> <52786CFD.1070009@hp.com> <527D6428.8060205@gmx.de> <20131108223833.GB32729@dannf.org> <20131109082036.62C881A8@taggart.lackof.org> <57A18B42-217E-4588-A0AF-6E4275A501F4@parisc-linux.org> <20131109191725.DDCE31A1@taggart.lackof.org> <527E9A4E.5000008@gmx.de> <C9305BC2-086F-48E8-944C-D7751095769A@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: Matt Taggart <matt@lackof.org>, dann frazier <dannf@dannf.org>,
	"Craig Lamparter (ISS Linux)" <craig.lamparter@hp.com>,
	John David Anglin <dave.anglin@bell.net>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc@vger.kernel.org
To: =?windows-1252?Q?Thibaut_Var=E8ne?= <T-Bone@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <C9305BC2-086F-48E8-944C-D7751095769A@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Thibaut,

On 11/09/2013 10:26 PM, Thibaut Var=E8ne wrote:
>> Just as a side-note: Could we let it run as-is as long as possible?
>> At least until the A500 is really turned off?
>=20
> My plan is to setup new DNSes with the current situation to start
> with, and have Matt register them as zone DNS. That=92ll be transpare=
nt
> for everyone, situation unchanged, until the A500 is powered off, at
> which point we can devise a new setup. As I told you, my primary
> concern is with email, so I=92ll have that covered :)

That's good!

>> Dave & me have the parisc-linux debian dpkg repository still on the
>> A500 which is still in heavy use until the debian-ports repository
>> is mostly filled=85
>=20
> I might be able to *temporarily* (emphasis on that word) host it,
> provided it=92s not =AB too big =BB, but as I said, specific protocol=
s such
> as FTP or GIT are not possible (only HTTP).

HTTP would be absolutely fine. Actually, this is what we currently use.

I just checked the archive. It's currently - including temporary boot-d=
isk-images - 19GB.
I don't think it will grow a lot during the next weeks/months, and give=
n the
fact that there aren't so many parisc-users, the load will probably not
be high.

Helge

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
