Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 3 Dec 2002 16:56:49 -0700
To: balak@ieee.org
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] X on C3000
Message-ID: <20021203235649.GC6220@dsl2.external.hp.com>
References: <Pine.LNX.4.33.0212031525140.30608-100000@dhcp-53-142.ece.utexas.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0212031525140.30608-100000@dhcp-53-142.ece.utexas.edu>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Tue, Dec 03, 2002 at 03:31:06PM -0600, balak@ieee.org wrote:
> Has anyone been able to start X on c3000? Should I post the log files to
> figure out what could be the problem?

Not yet. Just post the dmesg output immediately after the c3k boots.
We'll be able to see what kind of gfx card you have from that.

See ftp://ftp.parisc-linux.org/kernels/c3000/ for my XF86Config-4
and kernels that work on my c3k. If you can't make forward progress
after looking at the XF86Config-4, then post the XF86 log files.

hth,
grant
