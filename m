From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] parisc: Remove sizeof(frame) from call to get_sigframe
Date: Fri, 04 Jul 2014 20:58:22 -0700
Message-ID: <1404532702.6384.36.camel@joe-AO725>
References: <1404530457-4739-1-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: jejb@parisc-linux.org, deller@gmx.de, tiwai@suse.de,
	jkosina@suse.cz, dave.anglin@bell.net,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Nicholas Krause <xerofoify@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1404530457-4739-1-git-send-email-xerofoify@gmail.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2014-07-04 at 23:20 -0400, Nicholas Krause wrote:
> This removes the sizeof(frame) from the call to get_sigframe on line
> 243 in order to fix the call to this function as the sizeof in not
> needed to call this function.

How did you compile this?

arch/parisc/kernel/signal.c:178:get_sigframe(struct k_sigaction *ka, unsigned long sp, size_t frame_size)

> diff --git a/arch/parisc/kernel/signal.c b/arch/parisc/kernel/signal.c
[]
> @@ -240,8 +240,7 @@ setup_rt_frame(int sig, struct k_sigaction *ka, siginfo_t *info,
[]
> -	/*FIXME: frame_size parameter is unused, remove it. */
> -	frame = get_sigframe(ka, usp, sizeof(*frame));
> +	frame = get_sigframe(ka, usp)

Nichola
