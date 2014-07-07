From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] parisc: Remove sizeof(frame) from call to get_sigframe
Date: Mon, 7 Jul 2014 13:55:54 +0100
Message-ID: <20140707135554.1c52342c@alan.etchedpixels.co.uk>
References: <1404530457-4739-1-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: jejb@parisc-linux.org, deller@gmx.de, tiwai@suse.de,
	jkosina@suse.cz, dave.anglin@bell.net, joe@perches.com,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Nicholas Krause <xerofoify@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1404530457-4739-1-git-send-email-xerofoify@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri,  4 Jul 2014 23:20:57 -0400
Nicholas Krause <xerofoify@gmail.com> wrote:

> This removes the sizeof(frame) from the call to get_sigframe on line
> 243 in order to fix the call to this function as the sizeof in not
> needed to call this function.

If you are going to submit patches then

- actually read what you are submitting

- check it actually compiles

- run it on the system in question and verify your changed code paths are
  used

*then* consider submitting it, otherwise all you are doing is wasting
people's time.

Alan
