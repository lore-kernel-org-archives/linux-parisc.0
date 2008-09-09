From: Bastian Blank <waldi@debian.org>
Subject: Re: Debian parisc config for 2.6.26 broke the real time clock
Date: Tue, 9 Sep 2008 20:29:52 +0200
Message-ID: <20080909182952.GA3751@wavehammer.waldi.eu.org>
References: <1220713586.3430.14.camel@localhost.localdomain> <20080908163703.GA3218@wavehammer.waldi.eu.org> <1220893102.8074.41.camel@localhost.localdomain> <20080909165835.GB1447@colo.lackof.org> <1220982515.3334.29.camel@localhost.localdomain> <20080909180127.GA2712@wavehammer.waldi.eu.org> <1220983921.3334.36.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: dann frazier <dannf@dannf.org>, debian-kernel@lists.debian.org,
	Parisc List <linux-parisc@vger.kernel.org>,
	debian-hppa@lists.debian.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <1220983921.3334.36.camel@localhost.localdomain>
Resent-Message-ID: <2lO9RKStlTB.A.o-D.wCsxIB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Tue, Sep 09, 2008 at 01:12:01PM -0500, James Bottomley wrote:
> On Tue, 2008-09-09 at 20:01 +0200, Bastian Blank wrote:
> > On Tue, Sep 09, 2008 at 12:48:35PM -0500, James Bottomley wrote:
> > > They certainly have to be inessential to the parisc ABI ... they don't
> > > work if anything's actually trying to use them.
> > Really? Which sort of "don't work" is this? Why should a I2C rtc device
> > (some dallas chip) not work?
> Um, because the architecture doesn't have an i2c bus.

Well, it have USB, so can also power usb-to-i2c adapters. And there is
even the rtc test module.

Which "don't work" do you refer to?
- Does not work because there is no binding to the hardware.
- Does not work because a fundamental problem in the whole subsystem.
(- Does not work because ...)

Bastian

-- 
You're dead, Jim.
		-- McCoy, "The Tholian Web", stardate unknown
