From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Reproducible random python crash.
Date: Fri, 21 Aug 2009 15:01:42 -0400
Message-ID: <119aab440908211201qe0b96ddg2fdb0b9d8be026d1@mail.gmail.com>
References: <119aab440908210843s3018469oe63680871da83685@mail.gmail.com>
	 <20090821161949.67BA04E7B@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org,
	James.Bottomley@hansenpartnership.com, dave.anglin@nrc-cnrc.gc.ca,
	deller@gmx.de, kyle@mcmartin.ca
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090821161949.67BA04E7B@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Aug 21, 2009 at 12:19 PM, John David
Anglin<dave@hiauly1.hia.nrc.ca> wrote:
>> > ./waf configure --nocache --prefix=3D/usr --with-mandir=3D/usr/sha=
re/man
>> > --with-perl-archdir=3D/usr/lib/perl5 --with-perl-binary=3D/usr/bin=
/perl
>> > --with-ruby-archdir=3D/usr/lib/ruby/1.8/hppa-linux
>> > --with-ruby-libdir=3D/usr/lib/ruby/1.8 --without-optionals=3Dpytho=
n
>> > --without-plugins=3Dmac
>> >
>> > Running the last step on a 2.6.26-1-parisc64-smp kernel results in
>> > random behaviour ranging from sigsegv, sigill, sigtrap, and a hang=
=2E
>> > Given that each of you might run it on a different kernel, I was
>> > hoping to see if the behaviour is the same across different kernel=
s.
>>
>> On 2.6.31-rc2-00010-g22a5b0c-dirty (kyle's 4 CPU PA8800) I get a han=
g
>> and segfaults, the segfault is reproducible the hang happens every
>> once in a while.
>
> Do you have Grant's last patch installed? =A0Although it's early yet
> to say for sure, I think it may have fixed the random segv problem
> on gsyprf11 with 2.6.30.5.

Which patch is this?

Also note that I ran this with LD_BIND_NOW=3D1 to force the dynamic
loader to resolve all relocations before running the program, and it
still crashes.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
