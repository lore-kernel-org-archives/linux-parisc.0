Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "D. Clarke" <dclarke@FlatlineSystems.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] gzip segmentation fault(s) 
In-Reply-To: Message from "D. Clarke" <dclarke@FlatlineSystems.net>
   of "Sun, 28 Jul 2002 20:22:07 EDT." <005901c23695$f9c9e3a0$0500a8c0@speedygonzo>
References: <003101c23687$f1ace540$0500a8c0@speedygonzo>  <005901c23695$f9c9e3a0$0500a8c0@speedygonzo> 
Date: Sun, 28 Jul 2002 18:57:25 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020729005725.1C5B7482A@dsl2.external.hp.com>
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

"D. Clarke" wrote:
> Interesting enough, gzip doesn't segfault when i installed from the =
> full-install ISO...

Daryl,
Try updating both the userspace and kernel together.
Newer 2.4.18 kernels should be available as debian packages
and from ftp.parisc-linux.org/kernels/32 (for D-class).


The 0.9.3 ISO is *really* old - a bit over 6 monthes and alot has
changed since then. I will update the parisc-linux.org web page to
point to a debian-hppa 3.0 install ISO. I thought I saw it mentioned
here that those are available on the regular mirrors.

thanks,
grant
