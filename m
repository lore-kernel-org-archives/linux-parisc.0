From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: Debian parisc config for 2.6.26 broke the real time clock
Date: Tue, 9 Sep 2008 12:46:48 -0600
Message-ID: <20080909184648.GC2772@parisc-linux.org>
References: <1220983921.3334.36.camel@localhost.localdomain> <20080909184204.B3F9B4E2A@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	waldi@debian.org, dannf@dannf.org, debian-kernel@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080909184204.B3F9B4E2A@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Sep 09, 2008 at 02:42:03PM -0400, John David Anglin wrote:
> > Um, because the architecture doesn't have an i2c bus.
> 
> Don't know about rtc but some PA-RISC models definitely have an i2c bus.
> I see this message on a A500-75 model:
> 
>      The support bus which connects the system processors, the Guardian Service
>      Processor (GSP) and the Power Monitor or Platform Monitor may have become
>      hung.  (The support bus can be tested by issuing the GSP command "XD", and
>      selecting the I2C access test).

This I2C bus is not acessible by the operating system (as far as I know).

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
