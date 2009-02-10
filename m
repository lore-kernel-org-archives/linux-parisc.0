From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: add ftrace (function and graph tracer) functionality
Date: Tue, 10 Feb 2009 21:56:03 +0100
Message-ID: <4991E9E3.2040404@gmx.de>
References: <20090210021101.2118F4EDA@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org, kyle@mcmartin.ca
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090210021101.2118F4EDA@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
>> It will currently only work with 64bit kernels, because the gcc options -pg
>> and -ffunction-sections can't be enabled at the same time and -ffunction-sections
>> is still needed to be able to link 32bit kernels.
> 
> I have done some testing.  As far as I can tell, -pg works with
> -ffunction-sections on hppa-unknown-linux-gnu and hppa64-hp-hpux11.

That's great!
Which gcc version did you tested?
For me, (cross-compiler) hppa-linux-gcc 3.3.4 didn't linked without -ffunction-sections.

> hppa2.0w-hp-hpux11 doesn't support -ffunction-sections.  So, I think
> we should propose that the code that disables -ffunction-sections
> with -pg be removed.

In principle no objections from my side. Nevertheless we really need to make sure.
E.g. we'd need to increase the minimal required compiler version for kernel on 32bit.
Did you tested modules (on 32bit) as well, e.g. the xfs module which had the
relocation problems?

Best regards,
Helge
