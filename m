Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sccrmhc02.attbi.com (sccrmhc02.attbi.com [204.127.202.62])
	by dsl2.external.hp.com (Postfix) with ESMTP id 78F514829
	for <parisc-linux@parisc-linux.org>; Wed, 28 May 2003 14:28:04 -0600 (MDT)
Date: Wed, 28 May 2003 13:27:57 -0700
From: "H. J. Lu" <hjl@lucon.org>
To: Randolph Chung <tausq@debian.org>, bug-binutils@gnu.org,
	binutils@sources.redhat.com, parisc-linux@parisc-linux.org,
	debian-gcc@lists.debian.org
Message-ID: <20030528132757.A14921@lucon.org>
References: <20030527052251.GC24873@tausq.org> <20030528190706.GC21904@bubble.sa.bigpond.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030528190706.GC21904@bubble.sa.bigpond.net.au>; from amodra@bigpond.net.au on Thu, May 29, 2003 at 04:37:06AM +0930
Subject: [parisc-linux] Re: [hppa] binutils will not build shared libraries with external deps?
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

On Thu, May 29, 2003 at 04:37:06AM +0930, amodra@bigpond.net.au wrote:
> On Mon, May 26, 2003 at 10:22:51PM -0700, Randolph Chung wrote:
> > tausq@ios:~$ gcc -shared -fPIC -o blah.so blah.c
> > /tmp/ccC3fZeH.o(.text+0x1c): In function `call_foo':
> > : undefined reference to `foo'
> 
> This should fix it.  Would someone mind applying it for me?  I'm in
> transit at the moment and internet access is slow and flaky.  2.14
> branch too, I guess.

Applied to mainline.


H.J.
