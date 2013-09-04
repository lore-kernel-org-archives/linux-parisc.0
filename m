From: "Helge Deller" <deller@gmx.de>
Subject: Aw: Re: Does there exists any 32bit-only PARISC SMP machines?
Date: Wed, 4 Sep 2013 10:13:09 +0200 (CEST)
Message-ID: <trinity-b7a0d82a-16b9-4204-be6e-2873db548248-1378282389073@3capp-gmx-bs28>
References: <521F9848.4010404@gmx.de> <1377830541.2331.5.camel@dabdike>,
 <20130903155643.GA1430@glitch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: "Domenico Andreoli" <cavokz@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130903155643.GA1430@glitch>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Domenico,

> J5600 is SMP capable in both 32bit and 64bit mode.
> mine doesn't boot 64bit SMP since 2.6.22. I've never been able to trace
> it down but can confirm it happens also on more recent kernels.

Could you please try a 64bit-SMP (stable series) 3.10 or 3.11 kernel?
I'm pretty sure your machine should now boot and work with a 64bit SMP kernel.
If not, please send your bootlog so that we can try to analyze.

Thanks,
Helge
