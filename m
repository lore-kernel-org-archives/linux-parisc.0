From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Reproducible random python crash.
Date: Fri, 21 Aug 2009 16:15:35 -0400
Message-ID: <119aab440908211315t2c4bc5a3tbe69e2d17a9ee6c1@mail.gmail.com>
References: <119aab440908211201qe0b96ddg2fdb0b9d8be026d1@mail.gmail.com>
	 <20090821193022.85A6B4E09@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org,
	James.Bottomley@hansenpartnership.com, dave.anglin@nrc-cnrc.gc.ca,
	deller@gmx.de, kyle@mcmartin.ca
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090821193022.85A6B4E09@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Aug 21, 2009 at 3:30 PM, John David
Anglin<dave@hiauly1.hia.nrc.ca> wrote:
>> >> On 2.6.31-rc2-00010-g22a5b0c-dirty (kyle's 4 CPU PA8800) I get a =
hang
>> >> and segfaults, the segfault is reproducible the hang happens ever=
y
>> >> once in a while.
>> >
>> > Do you have Grant's last patch installed? =3DA0Although it's early=
 yet
>> > to say for sure, I think it may have fixed the random segv problem
>> > on gsyprf11 with 2.6.30.5.
>>
>> Which patch is this?
>
> http://article.gmane.org/gmane.linux.ports.parisc/2047
>
> Since I wrote, I had one segv with 2.6.30.5 in the GCC libjava
> testsuite. =A0However, I think things are improved. =A0I have managed=
 to
> get through most of a GCC build and check with a SMP kernel.
>
> I tried to follow your recipe on gsyprf11, but the source for 0.5
> was dounloaded. =A0I didn't have any trouble with the configure comma=
nd
> with this version.

I should have mentioned you need unstable sources (not unstable debs)
in your sources.list.
e.g. deb-src ftp://ftp.ca.debian.org/debian/ unstable main contrib non-=
free
Does that help?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
