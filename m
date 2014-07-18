From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: Remove FIXME comment
Date: Fri, 18 Jul 2014 14:03:34 -0700
Message-ID: <1405717414.30262.12.camel@dabdike.int.hansenpartnership.com>
References: <1405715823-17492-1-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: deller@gmx.de, tiwai@suse.de, jkosina@suse.cz, joe@perches.com,
	dave.anglin@bell.net, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Nicholas Krause <xerofoify@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1405715823-17492-1-git-send-email-xerofoify@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2014-07-18 at 16:37 -0400, Nicholas Krause wrote:
> The comment for size of frame not being needed is incorrect , the
> function called needs this parameter.

Actually, that's not correct.  The point of the FIXME is that fram_size
is only used in a debug print and could be eliminated since the
internals of the function excluding the debugging statements don't use
it.

James


