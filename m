From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] HPPA : Define all the hppa specific _CLOEXEC and 	_NONBLOCK values
Date: Fri, 6 Aug 2010 10:34:12 -0400
Message-ID: <AANLkTi=3cdO86eCfXxoF3fPi2RjjTWHxFEoOLLLinXuq@mail.gmail.com>
References: <1281096124-27484-1-git-send-email-gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: libc-ports@sourceware.org, linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <libc-ports-return-1692-gclgp-libc-ports=m.gmane.org@sourceware.org>
In-Reply-To: <1281096124-27484-1-git-send-email-gmsoft@tuxicoman.be>
List-Unsubscribe: <mailto:libc-ports-unsubscribe-gclgp-libc-ports=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-ports-subscribe@sourceware.org>
List-Post: <mailto:libc-ports@sourceware.org>
List-Help: <mailto:libc-ports-help@sourceware.org>, <http://sourceware.org/lists.html#faqs>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 6, 2010 at 8:02 AM, Guy Martin <gmsoft@tuxicoman.be> wrote:
> The following patch adds hppa specific files that define the various _CLOEXEC and
> _NONBLOCK values in order to match the ones from the kernel.

Is this because hppa doesn't use the same values as x86 and the only
way to get your own values is to modify your own copies of said files?

Cheers,
Carlos.
