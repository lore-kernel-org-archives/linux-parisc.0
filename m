From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc,metag: Do not hardcode maximum userspace stack
 size
Date: Thu, 1 May 2014 10:06:51 -0400
Message-ID: <BLU0-SMTP100F3609C6E4E30484E98DE97400@phx.gbl>
References: <20140430212602.GA20601@p100.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
To: Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-metag@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20140430212602.GA20601@p100.fritz.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 4/30/2014 5:26 PM, Helge Deller wrote:
> This patch makes the stack size configurable and uses 80MB as default
> value which has been in use during the last few years on parisc and
> which didn't showed any problems yet.
>
> Signed-off-by: Helge Deller<deller@gmx.de>
> Cc:linux-parisc@vger.kernel.org
> Cc:linux-metag@vger.kernel.org
> Cc: John David Anglin<dave.anglin@bell.net>
>
I tested this version of the patch last night on 3.14.2.  I can
confirm that an 80MB region is reserved for stack at the expected
location in virtual memory with the default config setting.  GCC
and many other packages have built successfully with this setting.

Tested-by: John David Anglin <dave.anglin@bell.net>

---

Dave

-- 
John David Anglin    dave.anglin@bell.net

