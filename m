Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA09987
	for <parisc-linux@puffin.external.hp.com>; Sat, 9 Dec 2000 11:53:28 -0700
Date: Sat, 9 Dec 2000 10:56:07 -0800
From: Richard Henderson <rth@redhat.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: Jeffrey A Law <law@redhat.com>,
        John David Anglin <dave@hiauly1.hia.nrc.ca>,
        Richard Hirst <rhirst@linuxcare.com>, parisc-linux@thepuffingroup.com,
        gcc-bugs@gcc.gnu.org
Subject: Re: pa reload problem
Message-ID: <20001209105607.A5191@redhat.com>
References: <Pine.LNX.4.21.0012091927390.32148-100000@front.linuxcare.com.au> <Pine.LNX.4.21.0012100011540.32148-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0012100011540.32148-100000@front.linuxcare.com.au>; from Alan Modra on Sun, Dec 10, 2000 at 12:57:03AM +1100
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Dec 10, 2000 at 12:57:03AM +1100, Alan Modra wrote:
> Grrr, that allocates r1 first, which loses on 32-bit hppa.

Err, elaborate on "loses".

>       When allocating registers, do so according to REG_ALLOC_ORDER and
> 	choose GENERAL_REGS.

The problem with this is that you've broken the ABI for all
extant targets.


r~
