From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Question about execve.
Date: Wed, 31 Mar 2010 09:55:14 -0400
Message-ID: <s2w119aab441003310655va434ab3bm6a0d71df6d7182c0@mail.gmail.com>
References: <119aab441003281404y7bc37dddw14db435b85704b4f@mail.gmail.com>
	 <20100328212110.03F224E77@hiauly1.hia.nrc.ca>
	 <119aab441003281612j6bf4d910g52f94490824cfd81@mail.gmail.com>
	 <20100328235937.GA5806@hiauly1.hia.nrc.ca>
	 <119aab441003281724h78186fbwa415f7ac046269e2@mail.gmail.com>
	 <20100329023854.GA6633@hiauly1.hia.nrc.ca>
	 <119aab441003290511p6ca7904dxdfc7def8e0777662@mail.gmail.com>
	 <20100329140257.GA9394@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100329140257.GA9394@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Mar 29, 2010 at 10:02 AM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> The change may not fix much, but there's no technical reason that
> the kernel needs to clobber r19.

Rebuilt 2.10.2-6 here with r19 save for all cases.

http://www.parisc-linux.org/~carlos/saver19/

Two regressions during build, but they appear unrelated.

Could you test this in a chroot and tell me if it works for you?

Cheers,
Carlos.
