From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [Suggestion] parisc: kernel: about section mismatch warning.
Date: Wed, 24 Jul 2013 07:11:35 -0700
Message-ID: <1374675095.4634.6.camel@dabdike>
References: <51EF8C52.50403@asianux.com> <51EF8FED.9090903@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Chen Gang <gang.chen@asianux.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51EF8FED.9090903@asianux.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2013-07-24 at 16:27 +0800, Chen Gang wrote:
> Hello Maintainers:
> 
> When building parisc with allmodconfig by 'hppa64-linux-gnu-', I find section mismatch warnings.
> 
> I am not quite sure whether they will cause real issue or not, please
> help check, thanks.

I think you need to try a new compiler before we start looking at issues
that don't show up in our build.  However, since it doesn't show up in
the parisc build, I don't actually think it's real, since it's a
temporary label in core code.

James


