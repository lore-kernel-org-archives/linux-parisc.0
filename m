From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH v2] parisc: dont unconditionally override CROSS_COMPILE
 for 64 bit.
Date: Tue, 28 Feb 2012 10:33:35 -0500
Message-ID: <4F4CF3CF.5090605@bell.net>
References: <1330298813-17262-1-git-send-email-paul.gortmaker@windriver.com> <201202280106.23643.vapier@gentoo.org> <1330438245.2822.114.camel@dabdike.int.hansenpartnership.com> <201202281021.05897.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Paul Gortmaker <paul.gortmaker@windriver.com>,
	"kyle@mcmartin.ca" <kyle@mcmartin.ca>,
	"deller@gmx.de" <deller@gmx.de>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
To: Mike Frysinger <vapier@gentoo.org>
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <201202281021.05897.vapier@gentoo.org>
List-ID: <linux-next.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2/28/2012 10:21 AM, Mike Frysinger wrote:
> we've been using hppa2.0 for years.  gnuconfig certainly recognizes it:
> $ grep hppa /usr/share/gnuconfig/config.sub
>          | h8300 | h8500 | hppa | hppa1.[01] | hppa2.0 | hppa2.0[nw] | hppa64 \
>          | hppa-* | hppa1.[01]-* | hppa2.0-* | hppa2.0[nw]-* | hppa64-* \
>
> and i've seen diff projects key off of the hppa2.0* to enable newer features by
> default.
Some of the above are specific to HP-UX, but hppa1.1, hppa2.0, hppa and 
hppa64 are
valid for Linux based on config.guess.

Dave

-- 
John David Anglin    dave.anglin@bell.net
