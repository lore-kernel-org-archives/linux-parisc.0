Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 87D0D482A
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 29 Apr 2004 15:39:05 -0600 (MDT)
Date: Thu, 29 Apr 2004 17:38:27 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Paul <paul@techcenter3000.com>
Subject: Re: [parisc-linux] gcc hang on alsa-lib
Message-ID: <20040429213827.GD12850@baldric.uwo.ca>
References: <000301c42e13$0c4b8a30$0702a8c0@tfam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000301c42e13$0c4b8a30$0702a8c0@tfam.org>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Apr 29, 2004 at 12:54:40PM -0500, Paul wrote:
> I know my machine isn't the fastest around, but should this take 10+ hrs 
> (and counting)?
> 
> This is from alsa-libs-1.0.4.
> 
> make:
> <snip>
> if /bin/sh ../../libtool --mode=compile 
> gcc -DHAVE_CONFIG_H -I. -I. -I../../include -I../../include    -g -O2 -MT 
> pcm_para
> ms.lo -MD -MP -MF ".deps/pcm_params.Tpo" \
>  -c -o pcm_params.lo `test -f 'pcm_params.c' || echo './'`pcm_params.c; \
> then mv -f ".deps/pcm_params.Tpo" ".deps/pcm_params.Plo"; \
> else rm -f ".deps/pcm_params.Tpo"; exit 1; \
> fi
> gcc -DHAVE_CONFIG_H -I. -I. -I../../include -I../../include -g -O2 -MT 
> pcm_params.lo -MD -MP -MF .deps/pcm_params.Tpo -c p
> cm_params.c  -fPIC -DPIC -o pcm_params.lo
> 
> Top:
> 18630 root      25   0 11576 9936 4532 R 89.2  2.7 628:01.26 cc1

Kernel version? libc version? dmesg output?

There is some subshell processing there that might be hanging, see the
'mv -f' or the 'rm -f', is the source tree network mounted?

If you ctrl+c the build, then just run that particular line again, does
it hang again? If so, then you have a repeatable testcase. Please send
us the preprocessed output :)

c.
