From: John David Anglin <dave.anglin@bell.net>
Subject: Re: PA8800 with 3.9.0-rc1-JeR-10942-g6dbe51c : WARNING: at lib/timerqueue.c:74
Date: Wed, 20 Mar 2013 16:12:42 -0400
Message-ID: <514A183A.7090809@bell.net>
References: <20130315152226.46ad0993@marga.jer-c2.orkz.net> <BLU0-SMTP3801FFE58A0BCC9C8836A597EE0@phx.gbl> <20130318135831.7c14b6e7@marga.jer-c2.orkz.net> <5148E903.1020105@gmx.de> <20130320182756.7b0e4f5d@marga.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
To: Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130320182756.7b0e4f5d@marga.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 3/20/2013 1:27 PM, Jeroen Roovers wrote:
> +CONFIG_PREEMPT_NONE=y
Given that CONFIG_PREEMPT is broken, we must be missing at least one
preempt_disable()/preempt_enable() pair.

Dave

-- 
John David Anglin    dave.anglin@bell.net

