Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id E9655484B
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 22 Jan 2004 19:09:08 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by colo.lackof.org (Postfix) with ESMTP id 45B8829809A
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 22 Jan 2004 19:09:08 -0700 (MST)
Received: from colo.lackof.org ([127.0.0.1])
	by localhost (colo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 20863-01 for <parisc-linux@lists.parisc-linux.org>;
	Thu, 22 Jan 2004 19:09:07 -0700 (MST)
Date: Thu, 22 Jan 2004 19:09:07 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel BUG at mm/shmem.c:585!
Message-ID: <20040123020907.GJ13354@colo.lackof.org>
References: <20040122213849.GG13354@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040122213849.GG13354@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Jan 22, 2004 at 02:38:49PM -0700, Grant Grundler wrote:
> Just booted 2.6.1-pa9 (-pa8 + SBA change) and got:
> 
> kernel BUG at mm/shmem.c:585!
> Kernel addresses on the stack:
>  [<000000001016dc30>]  [<0000000010125cd8>]  [<0000000010111cd4>]  [<000000001010be4c>] 
>  [<000000001010b094>]

I've associated this with logging out of ssh sessions.
ie when I exit a remote login, the above output pops up in the console.

grant
