Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2F039482E
	for <parisc-linux@parisc-linux.org>; Mon,  4 Aug 2003 09:14:51 -0600 (MDT)
Date: Mon, 4 Aug 2003 09:14:49 -0600
To: Joel Soete <jsoe0708@tiscali.be>
Cc: lamont@hp.com, James Bottomley <James.Bottomley@steeleye.com>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] backport bitops.h stuff
Message-ID: <20030804151449.GS18508@security.hp.com>
References: <20030801171426.GA18508@security.hp.com> <3F29178A00000A99@ocpmta7.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F29178A00000A99@ocpmta7.freegates.net>
From: lamont@hp.com (LaMont Jones)
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

On Mon, Aug 04, 2003 at 12:43:10PM +0200, Joel Soete wrote:
>   int ret=0;
>   __asm__(" ldi    31,%1\n"

Make it say 32,%1...  Mistake in understanding things on my part...

> And I am confused by results:
> fastffs(0)==31
> ffs_hppa26(0)==0
> generic_ffs(0)==0
> 
> I presume that we also have to consider an exception for 0?

yes.

lamont
