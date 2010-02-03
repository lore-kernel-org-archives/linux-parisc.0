From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex wait failure
Date: Wed, 3 Feb 2010 17:44:33 -0500
Message-ID: <119aab441002031444p74b28041v4e630d433457113e@mail.gmail.com>
References: <20100108211733.852134EF4@hiauly1.hia.nrc.ca>
	 <4B689634.8060408@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Kyle McMartin <kyle@mcmartin.ca>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B689634.8060408@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Feb 2, 2010 at 4:16 PM, Helge Deller <deller@gmx.de> wrote:
> Furthermore, the coding for futex_atomic_op_inuser() in
> arch/parisc/include/asm/futex.h seems to miss real functionality.
> I didn't looked closer into this though.

I have a fix for futex_atomic_op_inuser(), but it needs more testing.

Cheers,
Carlos.
