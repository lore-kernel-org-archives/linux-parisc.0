Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE00045aedab24-CM.cpe.net.cable.rogers.com [24.112.227.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id A8F1C482F
	for <parisc-linux@lists.parisc-linux.org>; Wed, 30 Apr 2003 12:11:24 -0600 (MDT)
Date: Wed, 30 Apr 2003 14:12:16 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Program counter from sigcontext, constructurs and -fPIC
Message-ID: <20030430181216.GA20779@systemhalted>
References: <20030430003106.GC12492@systemhalted> <3EA9466400001A95@ocpmta7.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3EA9466400001A95@ocpmta7.freegates.net>
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

> >Don't touch -17, the _Unwind_Find_FDE code broke and it's doing damage
> >to things like 'vi' ... *sigh* I haven't even looked into this (looks
> >like gcc/glibc clashes again).
> >
> Umm could this be why that my b2k crashed when compiling a kernel to test
> a patch?

Quite possibly. If you can get a backtrace of the crash you'll se it die
inside _Unwind_Find_FDE in glibc.
 
I'm working on fixing this.

c.
