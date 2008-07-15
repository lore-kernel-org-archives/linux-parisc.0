From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] Document LWS ABI.
Date: Tue, 15 Jul 2008 19:32:50 +0200
Message-ID: <487CDF42.3050800@gmx.de>
References: <119aab440807150533y2b56f612w6f6fa12ed28b45fe@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	John David Anglin <dave.anglin@nrc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440807150533y2b56f612w6f6fa12ed28b45fe@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Carlos O'Donell wrote:
> Helge,
> 
> The LWS interface *already* has a 64-bit runtime entry point, see
> arch/parisc/kernel/syscall.S:
> [....]

Sure. I thought the discussion was about adding a 64-bit runtime entry 
point which operates on a 64-bit pointer. But this can be done discussed 
when 64-bit userspace is coming...

> Helge, please review. I rolled in your fix for the superfluous .align
> 16. I would like your signed-off-by if you think the patch is good.
> 
> [PARISC] Document LWS ABI and LWS cleanups.
> 
> Document the LWS ABI including implementation notes for
> userspace, and comment cleanup.
> 
> Remove extraneous .align 16 after lws_lock_start.
> 
> Signed-off-by: Carlos O'Donell <carlos@systemhalted.org>

Signed-off-by: Helge Deller <deller@gmx.de>

