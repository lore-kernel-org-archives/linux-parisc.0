From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Debian bug 622997
Date: Sun, 17 Apr 2011 22:22:36 -0500
Message-ID: <1303096956.2583.25.camel@mulgrave.site>
References: <20110417151147.326EC4FCB@hiauly1.hia.nrc.ca>
	 <1303053807.2583.1.camel@mulgrave.site>
	 <1303068487.2583.7.camel@mulgrave.site>
	 <20110418012519.GA25505@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org, 622997@bugs.debian.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110418012519.GA25505@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2011-04-17 at 21:25 -0400, John David Anglin wrote:
> This is excellent detective work.  If I might ask, how did you trace
> the module loads and successful inits?

Heh, you're expecting me to name magic tracing tools?  Well (shuffles
feet) I just put printks in kernel/modules.c to do it.  It's basically
impossible to trace a boot problem like this any other way, because we
don't have enough of the system up to use any tools.

James


