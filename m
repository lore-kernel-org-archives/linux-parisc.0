From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Thread stack allocation
Date: Sun, 9 Sep 2012 18:24:17 -0400
Message-ID: <BLU0-SMTP297D308BBF8A72A121C16397AD0@phx.gbl>
References: <BLU0-SMTP405E1823EA93DF4FBFC1797AD0@phx.gbl> <BLU0-SMTP91500D9B875298D4CD828597AD0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP91500D9B875298D4CD828597AD0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 9-Sep-12, at 4:23 PM, John David Anglin wrote:

> It seems to me this must be a kernel bug:

Nope, it's a problem with guard page allocation in openjdk.
It assumes stack grows down.

--
John David Anglin	dave.anglin@bell.net



