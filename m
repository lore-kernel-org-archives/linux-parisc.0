From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: Debian parisc config for 2.6.26 broke the real time clock
Date: Tue, 9 Sep 2008 21:35:32 +0200
Message-ID: <7d01f9f00809091235p7673625fm8cefa4a2e9d9965a@mail.gmail.com>
References: <20080909184648.GC2772@parisc-linux.org>
	 <20080909192010.0207A4E2A@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "Matthew Wilcox" <matthew@wil.cx>,
	James.Bottomley@hansenpartnership.com, waldi@debian.org,
	dannf@dannf.org, debian-kernel@lists.debian.org,
	linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080909192010.0207A4E2A@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Sep 9, 2008 at 9:20 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> This I2C bus is not acessible by the operating system (as far as I know).
>
> HP-UX seems to be able to access fan and power status somehow.  It

Fan and power status are accessed through PDC. That's what I do with
the pdc_chassis driver, and what's exposed in /proc/chassis on !PAT
boxes (I don't have the PAT specs to implement the proper calls,
unfortunately). AFAIK, there's no need to use i2c to retrieve that
info, it's all PDC glue.

HTH

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
