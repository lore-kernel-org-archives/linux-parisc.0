Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id B0CEE4857
	for <parisc-linux@parisc-linux.org>; Fri,  5 Oct 2001 11:23:36 -0600 (MDT)
To: "Neulinger, Nathan" <nneul@umr.edu>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] config.guess/config.sub support? 
In-Reply-To: Your message of "Fri, 05 Oct 2001 11:26:27 CDT."
             <6CAC36C3427CEB45A4A6DF0FBDABA56D86D86D@umr-mail03.cc.umr.edu>
References: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D86D@umr-mail03.cc.umr.edu> 
Date: Fri, 05 Oct 2001 11:23:25 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20011005172325.4A09237CC0@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Neulinger, Nathan" writes...

> Are there any patches for config.guess/config.sub to add reasonable support
> for parisc-linux? Right now, the ones I was able to get reasonable
> config.sub behavior by adding a basic_machine check for parisc-unknown,
> but has anyone submitted anything better to the maintainers?

The upstream location for these files is,

http://subversions.gnu.org/cgi-bin/cvsweb/config/

hppa-linux support has been there for quite a while but some maintainers are
slow to update. Debian encourages package maintainers to use the versions
provided by the autotools-dev package (which live in /usr/share/misc/config.*)

HTH,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
