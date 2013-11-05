From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Aw: Re: parisc-linux.org losing hw hosting after this month
Date: Tue, 5 Nov 2013 17:23:32 -0500
Message-ID: <BLU0-SMTP30BB1B5C956A7B784174EF97F10@phx.gbl>
References: <20131105003509.GA19864@dannf.org> <1383612962.2150.4.camel@dabdike> <BLU0-SMTP219421FBE297D4BFF757F897F10@phx.gbl>, <20131105022209.GC22393@dannf.org> <trinity-7edb2a57-bc89-4ebf-9eb7-ebedef0ee7fd-1383648675665@3capp-gmx-bs06> <BLU0-SMTP1014D1D4D244BA55746CED297F10@phx.gbl> <527964AA.10601@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>, dann frazier <dannf@dannf.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <527964AA.10601@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11/5/2013 4:35 PM, Helge Deller wrote:
>> Regarding the unstable archive, Helge and I were recently given accounts on debian-ports and
>> >now can do package uploads.  I upload the first yesterday.  We need an unstable archive from which
>> >it's possible to  debootstrap to help with this migration.  Will have to look at setting this up locally.
> If the archive at debian-ports works out, why do you want an additional debootstrap location?
A buildd is setup initially using debootstrap.  This gives a minimal 
build system.
Then, package dependencies are dynamically resolved for each build as I 
understand it.

Even doing manual builds, one must set the required dependencies and 
resolve conflicts.  While this can be
done using a package archive stored in directory, it's easier to grab 
the needed packages with apt-get.
It will take some time (several months?) for debian-ports to reach the 
package collection on parisc-linux.org.

None of the packages on parisc-linux.org are signed and they lack a 
.changes file, so they can't be directly
uploaded as I understand it.

If we can't continue with a public archive (this allows others access as 
well during transition), then it would be best
to copy the archive to our respective local systems and use it while we 
bring ports up to speed.

Dave

-- 
John David Anglin    dave.anglin@bell.net

