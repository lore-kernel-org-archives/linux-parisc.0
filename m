From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: vfork test case.
Date: Thu, 17 Dec 2009 15:39:02 -0500
Message-ID: <119aab440912171239hf2ecc6fq86795f100a1e3fbc@mail.gmail.com>
References: <20091216213505.DE6EE537C@hiauly1.hia.nrc.ca>
	 <4B2A82AA.10907@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B2A82AA.10907@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Dec 17, 2009 at 2:12 PM, Helge Deller <deller@gmx.de> wrote:
> I couldn't reproduce on my SMP box either (but it's PA8500 instead of
> PA8700):
> cpu =A0 =A0 =A0 =A0 =A0 =A0 : PA8500 (PCX-W)
> model =A0 =A0 =A0 =A0 =A0 : 9000/785/J5000
> Linux ls3017 2.6.32-32bit #79 SMP Thu Dec 3 14:04:53 CET 2009 parisc
> GNU/Linux

Thanks Helge. This was a 64-bit box with SMP. It's possible part of
the 64-bit kernel is being incorrectly compiled.

I am not yet able to boot 2.6.32.

I'm getting problems in the initrd while waiting for /dev/sda1 to
appear, but it never does.

Once I resolve that I will see if the testcase works with 2.6.32.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
