From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH] parisc: Fix TLB related boot crash with PA8000-PA8700
 CPUs
Date: Wed, 7 Dec 2016 23:34:14 +0200
Message-ID: <20161207213414.hliciockser6d5da@raspberrypi-2.musicnaut.iki.fi>
References: <20161207205240.GA5917@ls3530>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20161207205240.GA5917@ls3530>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 07, 2016 at 09:52:40PM +0100, Helge Deller wrote:
> Machines with PA8000-PA8700 CPUs crash during startup while we measure
> and calculate a good threshold for the TLB flush.

I haven't seen any crashed on HP c3700 (PA8700)...

A.
