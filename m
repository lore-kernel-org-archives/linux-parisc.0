From: John David Anglin <dave.anglin@bell.net>
Subject: Re: parisc-linux.org losing hw hosting after this month
Date: Sun, 10 Nov 2013 12:26:44 -0500
Message-ID: <BLU0-SMTP31AC436DE2411AE5EC2DD997FC0@phx.gbl>
References: <20131105003509.GA19864@dannf.org> <1383612962.2150.4.camel@dabdike> <BLU0-SMTP219421FBE297D4BFF757F897F10@phx.gbl> <20131105022209.GC22393@dannf.org> <52786CFD.1070009@hp.com> <527D6428.8060205@gmx.de> <20131108223833.GB32729@dannf.org> <20131109082036.62C881A8@taggart.lackof.org> <57A18B42-217E-4588-A0AF-6E4275A501F4@parisc-linux.org> <20131109191725.DDCE31A1@taggart.lackof.org> <527E9A4E.5000008@gmx.de> <C9305BC2-086F-48E8-944C-D7751095769A@parisc-linux.org> <527EA9C9.2070309@gmx.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=WINDOWS-1252;
	format=flowed	delsp=yes
Cc: =?WINDOWS-1252?Q?Thibaut_Var=E8ne?= <T-Bone@parisc-linux.org>,
	Matt Taggart <matt@lackof.org>, dann frazier <dannf@dannf.org>,
	"Craig Lamparter (ISS Linux)" <craig.lamparter@hp.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <527EA9C9.2070309@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 9-Nov-13, at 4:31 PM, Helge Deller wrote:

>> I might be able to *temporarily* (emphasis on that word) host it,
>> provided it=92s not =AB too big =BB, but as I said, specific protoco=
ls such
>> as FTP or GIT are not possible (only HTTP).
>
> HTTP would be absolutely fine. Actually, this is what we currently =20
> use.
>
> I just checked the archive. It's currently - including temporary =20
> boot-disk-images - 19GB.
> I don't think it will grow a lot during the next weeks/months, and =20
> given the
> fact that there aren't so many parisc-users, the load will probably =20
> not
> be high.

I think we should freeze the repository in its current state.

I'm no longer building "all" packages, just "hppa" packages.  This is =20
what's needed
for upload to ports.  Some "hppa" packages depend on a specific =20
version of an "all"
package, so continuing to upload will break dependencies.

Dave
--
John David Anglin	dave.anglin@bell.net



--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
