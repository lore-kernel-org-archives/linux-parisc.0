From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc-isa-eeprom: Fix loff_t usage
Date: Thu, 06 Aug 2009 00:21:50 +0200
Message-ID: <4A7A05FE.4090506@gmx.de>
References: <200907210058.44737.mb@bu3sch.de> <4A79D1BF.5020305@gmx.de> <1249502221.4183.43.camel@mulgrave.site> <20090805201456.GR28572@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090805201456.GR28572@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 08/05/2009 10:14 PM, Kyle McMartin wrote:
> On Wed, Aug 05, 2009 at 02:57:01PM -0500, James Bottomley wrote:
>> I'm also very concerned about this:
>>
>> http://lkml.org/lkml/2009/8/2/107
>>
>> That's a breach of standard maintainer protocol since you failed to copy
>> the architecture list on the pull request.

Yes, I sadly missed to copy parisc-mailing-list, but at least I remembered
to copy Kyle.

>> Parisc is in a precarious position as a marginal architecture that isn't
>> being produced any more.  Having duelling trees and maintainers is
>> definitely very unhelpful because it could cause Linus to lose
>> confidence in our ability as a community.

Agreed.

>> First things first, you need to agree on a single tree ... although it's
>> perfectly possible to have multiple maintainers commit to it (x86 works
>> this way), can we do this at least before the schizophrenia gets
>> noticed?

Yep.

> I think Helge was just upset that I wasn't merging things fast enough,
> and, fair enough, I guess. I promise to rectify that, and if I don't, I
> plan to step aside.

Thanks Kyle!
Yes, this was the only reason.

Just a few word on this whole thread, and the unplanned discussion
on lkml...

When I sent the pull request, my intention was never to offend Kyle
or any other parisc developer. I was even astonished that Kyle offended
me suddenly that harsh in public. Neither was my intend to create a duelling
tree to the one from Kyle.

I just wanted to make sure, that the latest important patches (e.g. the
GOT fix for 64bit kernel modules) just would not miss the 2.6.31 kernel.
As we all know, Debian developers lately discussed regularily, if the
parisc port should be dropped as a stable/release platform. IMHO, one
of the main reasons for the bad state is, that often patches were not
merged upstream (or at least not in time), and then backporting them
was complicated and often missed.

My pull request included only simple patches. It was planned as a one-time
thing just to help Kyle with the maintenance of the outstanding patches.
I agree with Kyle, that I should have sent him a notice _before_ sending
the pull-request to lkml. Again, I just didn't thought he would be
offended by this, esp. since it was just a collection of patches which
went to the parisc-list, with a few simple patches by me.

Regarding the push of outstanding patches, I'd really very much prefer
a joint tree, to which the maintainers can push. That way everyone can
regularily pull a working parisc tree. Furthermore, I'd prefer if we
can get the timing right, that most of the outstanding patches goes
upstream with a -rc1 release, and then only a minor patchset would
be pushed in -rc5 or similar time frame.

Helge

PS: James, welcome as a parisc maintainer! (http://git.kernel.org/?p=linux/kernel/git/kyle/parisc-2.6.git;a=commitdiff;h=4b5273681a72dbf5ece64d0ae1e85d54722012fe)
