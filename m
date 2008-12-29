From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 2/2] parisc: fix module loading failure of large modules
Date: Mon, 29 Dec 2008 18:56:40 +0100
Message-ID: <49590F58.9040909@gmx.de>
References: <20081229161446.C91EB4EDA@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kyle@mcmartin.ca, randolph@tausq.org, jmm@inutil.org,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	Helge Deller <deller@gmx.de>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081229161446.C91EB4EDA@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
> Hi Helge,
> 
>> With this patch we now instead append individual PLT stub entries
>> directly at the end of the code sections where the stubs are actually
>> called. This reduces the distance between the PCREL location and the
>> stub entry so that the relocations can be fulfilled.
> 
> GCC for PA-RISC assumes that the stubs will be placed before the code
> section.  This is what HP-UX does.  It's also not possible to compute
> the distance to the end of a function in GCC due to the way branch
> shortening is done.  If the distance to the start of the code section
> is too large, GCC outputs a long call.

Interesting. I didn't knew that.

> If you can insert them before the code section where the stubs are
> called, this will minimize the chance that a pc-relative call will
> not reach its stub.

Yes, good idea.
I'll change that and send an updated patch.

> Great patch!

Thanks!

Helge
