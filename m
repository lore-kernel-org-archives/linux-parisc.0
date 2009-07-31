From: Thibaut VARENE <varenet@parisc-linux.org>
Subject: Re: HPPA hang with PCI SERR or PARITY enabling
Date: Fri, 31 Jul 2009 11:35:17 +0200
Message-ID: <7d01f9f00907310235hb342840j14b7ccc3bcc01184@mail.gmail.com>
References: <20090615134519.6EE824FC5@hiauly1.hia.nrc.ca>
	 <Pine.SOC.4.64.0907302054100.20870@math.ut.ee>
	 <4A724818.4080909@tausq.org>
	 <Pine.SOC.4.64.0907310923520.710@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Randolph Chung <randolph@tausq.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.SOC.4.64.0907310923520.710@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jul 31, 2009 at 8:28 AM, Meelis Roos <mroos@linux.ee> wrote:
>
> > Please see http://www.parisc-linux.org/faq/kernelbug-howto.html
>
> Well, I can not find anything about interpreting SER PIM data there?

Are you sure? There are basic explanations about the info we need. For instance:

"- The r02 register is the "return pointer" - it indicates the calling function
- The IAOQ contents specify the address of the instruction where the
fault occured."

Of course they are undecoded, that's why you need to be able to
objdump the kernel.

> My system is 2-CPU L1000, that I forgot to re-mention as I reported to
> my old report that anyone but me had probably forgotten. Using GSP.
> ALso, I rebooted the hanging computer using 'RS' from GSP, not 'TC' -
> does that garble PIM data?

After HPMC, RS is ok. Remember to always ser clearpim after collecting the info.

> > Anyway, from the output below, I suspect maybe we have some kernel functions
> > that are not in the right section, since the error happens right after
> > "Freeing unused kernel memory"?
>
> No, the real problem is below, this badness on SMP I was told to ignore
> here on this list in spring. The real problem happens after tuli driver
> loading and PCI configuration of the cards. From these, I only have the
> SER PIM data, no kernel backtrace.

PIM will contain relevant (though undecoded) information, so that's
already good to have.

HTH

--
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
