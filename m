Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 300254881
	for <parisc-linux@lists.parisc-linux.org>; Sat, 15 Nov 2003 18:38:56 -0700 (MST)
Date: Sat, 15 Nov 2003 18:38:54 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Damian Muchli?ski <mudamian@poczta.onet.pl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Linux on HP
Message-ID: <20031116013854.GA3735@colo.lackof.org>
References: <002901c3aad6$87fb1c10$64d71399@Damian>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <002901c3aad6$87fb1c10$64d71399@Damian>
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

On Fri, Nov 14, 2003 at 06:41:25PM +0100, Damian Muchli?ski wrote:
> I've found on newsgroup that because of old
> version of gcc and kernel and I should use newer version. So I have
> downloaded palinux-2.4.22-pa13-20031022-netinst.iso from your
> website,check md5, burned and booted.
> Unfortunately it hangs on "searching for devices" without any more info.

Damian,
I'm surprised the 2.4.22 netinst.iso doesn't boot on your c3700.
I'm currently running 2.4.22-pa14 on a C3600 with STIFB console.

The output you posted started with 2.4.17 boot and then garbled
at the end. I don't understand how HPMC dump messages and what looks
like PDC output (eg "To discontinue search,...") got mixed up.

If you can netboot a 2.4.22 kernel image from:
	ftp://ftp.parisc-linux.org/kernels/c3000/

and point the "root=" at the CDROM install disk, I would expect
it to complete the install....but that's non-trivial to setup
and it's alot to ask for. If you don't have time or it's too
complicated, don't worry about it.

I'll try to netboot the netinst.iso that you used at home on a C3000
and see what happens.

thanks,
grant
