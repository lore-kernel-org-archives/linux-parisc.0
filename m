From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Sun, 23 May 2010 09:11:45 -0400
Message-ID: <AANLkTimpMvS2ysPxInUZuLNtA-8r5W_3aYhXnv6pZAVd@mail.gmail.com>
References: <20100511212628.59FFD505C@hiauly1.hia.nrc.ca>
	 <4BE9CEF6.7010203@gmx.de> <20100515210251.GA16614@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100515210251.GA16614@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, May 15, 2010 at 5:02 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> I haven't seen any abnormal segfaults with the attached change on
> my rp3440 and gsyprf11. =A0Need to flush in pte_wrprotect for minifai=
l,
> and to flush in copy_user_page to fix occasional segfaults in sh.
> The flushes in kmap/kunmap weren't sufficient.
>
> Still experimenting to see if number of flushes can be reduced, etc.

Applying your patch to 2.6.33, I had 2 hunk rejects.

I fixed up the rejects, but I was curious, what is your patch based on?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
