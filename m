Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (p508456E5.dip.t-dialin.net [80.132.86.229])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90099482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  4 Jan 2002 15:34:32 -0700 (MST)
Date: Fri, 4 Jan 2002 23:31:46 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christian Suder <csuder@cisco.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Need five #defines, please.....
Message-ID: <20020104233146.A31733@solo.franken.de>
References: <20020104012559.69375281.csuder@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020104012559.69375281.csuder@cisco.com>; from csuder@cisco.com on Fri, Jan 04, 2002 at 01:25:59AM -0800
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

On Fri, Jan 04, 2002 at 01:25:59AM -0800, Christian Suder wrote:
> I'm trying to skin the lizard (mozilla 0.9.7). I can build with the linux
> default pthreads, but it doesn' work, windows show up but the content is
> not drawn etc.. Hence I'd like to try a build with "classic" NSPR, which
> implements it's own threading mechanism. Problem : There is a couple of
> hardware-specific definitions that I don't know how to do, but somebody

I don't thing anyone has ported libc5 to hppa. Those missing defines are
libc5 hooks, iirc.

Fixing pthreads would be much more productive.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
