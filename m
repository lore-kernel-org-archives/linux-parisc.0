Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail14.speakeasy.net [216.254.0.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id 61FE6482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Aug 2002 09:32:56 -0600 (MDT)
Date: Fri, 23 Aug 2002 08:36:00 -0700
From: Randolph Chung <randolph@tausq.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] RFC - glibc - patch reivew - 64->32
Message-ID: <20020823153600.GS8214@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020823131634.GA3229@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020823131634.GA3229@systemhalted>
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

>  #ifndef	_ASM
> -typedef double __jmp_buf[21];
> +typedef int __jmp_buf[21] __attribute__ ((aligned (8)));
>  #endif

this should now be
typedef int __jmp_buf[42] __attribute__ ((aligned (8)));
(sizeof(double) == 2 * sizeof(int))

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
