From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] PARISC: Avoid undefined shift in cnv_float.h
Date: Sun, 01 Apr 2012 10:06:30 -0700
Message-ID: <1333299990.9720.0.camel@dabdike>
References: <BLU0-SMTP6824DB7507844D291735CC974F0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP6824DB7507844D291735CC974F0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2012-04-01 at 12:57 -0400, John David Anglin wrote:
> The attached change fixes a float conversion problem found running the
> GCC testsuite with GCC configured with --with-arch=2.0.

Could you describe the actual problem? (it helps enormously when people
look at the change logs a year later and try and work out what the
actual issue is).

Thanks,

James


