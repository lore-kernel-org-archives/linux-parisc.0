From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 128/493] sound: remove use of __devexit_p
Date: Wed, 21 Nov 2012 11:46:05 +0000
Message-ID: <20121121114605.GD3290@n2100.arm.linux.org.uk>
References: <1353349642-3677-1-git-send-email-wfp5p@virginia.edu> <1353349642-3677-128-git-send-email-wfp5p@virginia.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: gregkh@linuxfoundation.org, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>,
	Eric Miao <eric.y.miao@gmail.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Thibaut Varene <T-Bone@parisc-linux.org>,
	Jaya Kumar <jayakumar.alsa@gmail.com>,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-parisc@vger.kernel.org
To: Bill Pemberton <wfp5p@virginia.edu>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1353349642-3677-128-git-send-email-wfp5p@virginia.edu>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Nov 19, 2012 at 01:21:17PM -0500, Bill Pemberton wrote:
>  sound/arm/aaci.c                    | 2 +-

For this driver,

Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
