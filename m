Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 19 Sep 2003 04:24:45 -0700
From: Randolph Chung <randolph@tausq.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>,
	parisc-linux-cvs@lists.parisc-linux.org
Message-ID: <20030919112445.GL27523@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20030919010356.148684940A4@palinux.hppa> <1063933596.2083.9.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1063933596.2083.9.camel@mulgrave>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> -#undef CACHE_FLUSHING_IS_NOT_BROKEN
> -#ifdef CACHE_FLUSHING_IS_NOT_BROKEN
> +	flush_user_dcache_range((unsigned long) &frame->tramp[0],
> +			   (unsigned long) &frame->tramp[4]);
>  	flush_user_icache_range((unsigned long) &frame->tramp[0],
>  			   (unsigned long) &frame->tramp[4]);

we also have a flush_icache_user_range range macro that does this (flush
dcache + icache). The kernel seems to use both..... 

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
