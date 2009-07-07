From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: HPPA and Squeeze
Date: Tue, 7 Jul 2009 16:42:17 -0400
Message-ID: <119aab440907071342l1a936c47n62d8f332d8ecf5d4@mail.gmail.com>
References: <1246975877.4522.9.camel@mulgrave.site>
	 <20090707162158.26D514FB2@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	kyle@mcmartin.ca, randolph@tausq.org, deller@gmx.de,
	kurt@roeckx.be, pkern@debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-release@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090707162158.26D514FB2@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jul 7, 2009 at 12:21 PM, John David
Anglin<dave@hiauly1.hia.nrc.ca> wrote:
>> So if I characterise the problem you think you're seeing: on mmap of=
 a
>> file at a memory location to be determined by the kernel, a sequenti=
al
>> set of reads of the mapped location eventually turns up a zero where
>> there should be data? =A0Yes, it does sound like a caching issue.
>
> Yes. =A0The loop is terminated by a null tag:
>
> =A0while (dyn->d_tag !=3D DT_NULL)
> =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 ...
> =A0 =A0 =A0}
>
> However, the core dump doesn't show a null tag before the STRTAB tag
> that caused the segmentation fault.

Do you mean "after" the STRTAB tag? I assume the library on-disk has a
DT_NULL, otherwise it would always fail.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
