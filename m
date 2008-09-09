From: Bastian Blank <waldi@debian.org>
Subject: Re: Debian parisc config for 2.6.26 broke the real time clock
Date: Tue, 9 Sep 2008 20:01:27 +0200
Message-ID: <20080909180127.GA2712@wavehammer.waldi.eu.org>
References: <1220713586.3430.14.camel@localhost.localdomain> <20080908163703.GA3218@wavehammer.waldi.eu.org> <1220893102.8074.41.camel@localhost.localdomain> <20080909165835.GB1447@colo.lackof.org> <1220982515.3334.29.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: dann frazier <dannf@dannf.org>, debian-kernel@lists.debian.org,
	Parisc List <linux-parisc@vger.kernel.org>,
	debian-hppa@lists.debian.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1220982515.3334.29.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Sep 09, 2008 at 12:48:35PM -0500, James Bottomley wrote:
> They certainly have to be inessential to the parisc ABI ... they don't
> work if anything's actually trying to use them.

Really? Which sort of "don't work" is this? Why should a I2C rtc device
(some dallas chip) not work?

Bastian

-- 
No problem is insoluble.
		-- Dr. Janet Wallace, "The Deadly Years", stardate 3479.4
