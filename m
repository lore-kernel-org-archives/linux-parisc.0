Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5132D4855
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 23 Feb 2004 03:34:34 -0700 (MST)
Date: Mon, 23 Feb 2004 04:24:58 -0800
From: Randolph Chung <randolph@tausq.org>
To: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: [parisc-linux] [PATCH] include/linux/soundcard.h endian fix
Message-ID: <20040223122458.GA6675@tausq.org>
References: <20040222070150.GA773@calypso>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040222070150.GA773@calypso>
Cc: parisc-linux@lists.parisc-linux.org
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> Would it be better to do the following? :
> 
> #ifdef(__BYTE_ORDER)
> #  if defined(__BIG_ENDIAN)
> #    if __BYTE_ORDER == __BIG_ENDIAN
> #      define AFMT_S16_NE AFMT_S16_BE
> #    endif
> #  elif defined(__LITTLE_ENDIAN)
> #    if __BYTE_ORDER == __LITTLE_ENDIAN
> #      define AFMT_S16_NE AFMT_S16_LE
> #    endif
> #  end if
> #endif

yes, this is much better. If you include asm/byteorder.h then this
should always be defined. maybe add a #error to catch the (unlikely)
case where neither is defined?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
