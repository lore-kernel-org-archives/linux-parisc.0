Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fep03-mail.bloor.is.net.cable.rogers.com (fep03-mail.bloor.is.net.cable.rogers.com [66.185.86.73])
	by dsl2.external.hp.com (Postfix) with ESMTP id E954F482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 May 2003 21:06:32 -0600 (MDT)
Date: Tue, 20 May 2003 23:07:33 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Hamilton Coutinho <hamilton@tteng.com.br>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Building glibc (static) with 64 bits toolchain
Message-ID: <20030521030733.GH10485@systemhalted>
References: <20030520215541.GA11860@hamilton.tteng.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030520215541.GA11860@hamilton.tteng.com.br>
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

> From the archive, I read that Carlos O'Donell is working on this very
> subject with promising results. So I setup to build a full blown glibc.
> After tinkering with it a little I realized that sysdeps/hppa/hppa64
> directory was missing. I couldn't find it anywhere (tried glibc cvs,
> parisc cvs, debian). Could you help me with directions to where to find
> it?

I'd love to see those promising results :) I have a hard enough time
working on a 32-bit userspace. There is no 64-bit port that works. I
have some bits of code, but to tell you the truth it just isn't a
priority. Other things, like a working 32-bit glibc rank higher...
sorry.

If you would like to start by testing our 64-bit toolchain, please build
a 64-bit cross system (hppa -> hppa64) and get back to the list with
your results :)

c.
