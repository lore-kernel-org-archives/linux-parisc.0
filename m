From: Chen Gang <gang.chen.5i5j@gmail.com>
Subject: Re: [PATCH] arch: uapi: asm: mman.h: Let MADV_FREE have same value
 for all architectures
Date: Mon, 08 Dec 2014 06:35:29 +0800
Message-ID: <5484D631.4010606@gmail.com>
References: <5480E715.3020900@gmail.com> <20141205065417.GA3358@bbox> <54822B19.2070804@gmail.com> <54832761.1050700@gmail.com> <BLU436-SMTP2290D2D7C148D22663FD75E97670@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: "jejb@parisc-linux.org" <jejb@parisc-linux.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	Joel Brobecker <brobecker@adacore.com>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU436-SMTP2290D2D7C148D22663FD75E97670@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On 12/8/14 00:14, John David Anglin wrote:
> On 6-Dec-14, at 10:57 AM, Chen Gang wrote:
> 
>> And I also want to consult about parisc assembly instructions, I can not
>> find the related reference documents, could you help to have a check (or
>> provide some related information for it)? related contents are below:
> 
> https://parisc.wiki.kernel.org/index.php/Technical_Documentation

OK, thank you very much!!

For me, these information is enough, I checked the related sub link, it
has a full description for all related instruction (stb/h, stw, std).

  https://parisc.wiki.kernel.org/images-parisc/7/73/Parisc2.0.pdf

For me, my original comments need be improved: need mention about STH,
and maybe also need consider about additional related instructions of
parisc 2.0 (STDA, STWA, STBY, STDBY).


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed
