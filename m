Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id D63724829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Apr 2003 09:03:51 -0700 (MST)
Date: Thu, 3 Apr 2003 08:00:58 -0800
From: Randolph Chung <randolph@tausq.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] break 0,0: pid=304 command jade ??
Message-ID: <20030403160058.GF9388@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3E8AE87E00000E4E@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E8AE87E00000E4E@ocpmta2.freegates.net>
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

> I try so to compile the last bochs release onto a my unstable debian pariec
> linux.
> This failled at the build of docbook because 'jade' failed on following
> trap:
> Trace/breakpoint trap
> 
> # dmesg show me then:
> break 0,0: pid=304 command='jade'

usually this means a program tried to branch to a NULL (or otherwise 
invalid) address... 

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
