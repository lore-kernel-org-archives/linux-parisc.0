Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflashcom (firewall.pflash.com [207.19.136.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id C0929482A
	for <parisc-linux@parisc-linux.org>; Sun, 13 Jan 2002 08:50:58 -0700 (MST)
Received: from localhost.localdomain (ppp147.cc1.pflash.com [63.121.24.149]) by vopserver.pflashcom
 (Vircom SMTPRS 5.2.203) with SMTP id <B0009604606@vopserver.pflashcom> for <parisc-linux@parisc-linux.org>;
 Sun, 13 Jan 2002 09:46:40 -0600
Content-Type: text/plain;
  charset="iso-8859-1"
From: Michael S.Zick <mszick@pflash.com>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] bogomips?
Date: Sun, 13 Jan 2002 09:48:20 -0600
References: <Pine.LNX.4.33.0201120757330.1989-100000@goliath.alaskatech.org> <20020112224306.C73ED482A@dsl2.external.hp.com> <20020113021209.55bad2ea.csuder@cisco.com>
In-Reply-To: <20020113021209.55bad2ea.csuder@cisco.com>
MIME-Version: 1.0
Message-Id: <02011309482000.00878@localhost.localdomain>
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

On Sunday 13 January 2002 04:12 am, Christian Suder wrote:
> http://www.linuxdoc.org/HOWTO/mini/BogoMips.html
>
> For those who believe BogoMips matter..... ;-)
>
> 	Christian
>
Well, I would never claim that BogoMips is, in its self, useful for anything.

But since its code is closely related to the udelay code, which affects 
scheduling and many drivers...

Once upon a time, both my Celeron and my P-II reported approximately 1.00 * 
clock (same as above reference), then with some change of kernel version, 
jumped to 2.00 * clock.

BUT, that might have been an intentional change in the routine, or...

No promises on this one: I sometimes keep old kernels, perhaps I can find the 
"before and after" kernels where I noticed the change.

Mike
