From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: hppa nptl switch
Date: Wed, 2 Sep 2009 11:24:18 -0400
Message-ID: <119aab440909020824n65daaa9i1cffc3ffd5e30076@mail.gmail.com>
References: <Pine.LNX.4.62.0908181940440.7856@sci.felk.cvut.cz>
	 <119aab440909010655j148ad3b8oae5328d646ef570c@mail.gmail.com>
	 <4A9D42C3.70103@aurel32.net> <200909012003.49114.vapier@gentoo.org>
	 <119aab440909020709m72645cf7j61103d577bd387d7@mail.gmail.com>
	 <20090902145548.GB10024@hall.aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mike Frysinger <vapier@gentoo.org>, debian-hppa@lists.debian.org,
	debian-glibc@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090902145548.GB10024@hall.aurel32.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Sep 2, 2009 at 10:55 AM, Aurelien Jarno<aurelien@aurel32.net> w=
rote:
> On Wed, Sep 02, 2009 at 10:09:22AM -0400, Carlos O'Donell wrote:
>> On Tue, Sep 1, 2009 at 8:03 PM, Mike Frysinger<vapier@gentoo.org> wr=
ote:
>> > i think the question was one about packaging rather than general u=
se ? =A0if you
>> > build a package against a newer glibc version but it only uses old=
er symbols,
>> > then in theory it should work fine with older glibc versions. =A0i=
f the symbol
>> > changes between versions, then it should have corresponding symbol=
 version
>> > changes as well (which will automatically be recorded in the binar=
y).
>>
>> Yes, the question is specifically about packaging.
>>
>> If the answer is "Debian does not prevent you from downgrading glibc=
,
>> even if you have new packages built against the new glibc", then I
>> accept that.
>>
>
> With the correct shlibs and symbol files, all packages built against =
the
> new glibc will depends on libc6 (>=3D 2.10). This way it won't be pos=
sible
> to downgrade the libc6 packages is packages compiled against the new
> glibc are installed.

Is the shlibs sufficient? For example, data structures aren't
versioned. In my new NPTL patches, I change PTHREAD_COND_INITIALIZER,
but I do not version anything (not required because the current
functions support both old and new style initializers), therefore the
symbol files will be identical?

Thanks a lot for your help in answering my debian related packaging que=
stions.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
