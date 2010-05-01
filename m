From: Thibaut VARENE <T-Bone@parisc-linux.org>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Sat, 1 May 2010 20:34:13 +0200
Message-ID: <k2y7d01f9f01005011134p72082b2bh5fe41d61d9e16aa1@mail.gmail.com>
References: <20100412214118.46D925160@hiauly1.hia.nrc.ca> <20100413115501.307040@gmx.net>
	<20100419162653.GA106@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	gniibe@fsij.org, carlos@systemhalted.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100419162653.GA106@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Apr 19, 2010 at 6:26 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> Hi Helge,
>
> On Tue, 13 Apr 2010, Helge Deller wrote:
>
>> Still crashes.
>
> Can you you try the patch below? =C2=A0The change to cacheflush.h is =
the same
> as before.

=46or the records, while setting up the wiki's TestCases page, it
noticed that the initial large patch that you sent (see
https://patchwork.kernel.org/patch/91525/ ) contained bits that
weren't part of the split chunks you sent afterwards.

This patch (pte.d.2) seems to update some of those chunks and also
contains bits that weren't either part of them.

That being said so that we do not loose track of potentially useful
code. Though maybe kyle has all of this sorted out already and I'm
just unable to figure it out myself ;-)

HTH

T-Bone

--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
