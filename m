Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 26 Jan 2003 14:52:05 -0700
To: Sir Ace <chandler@nateng.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Ok all
Message-ID: <20030126215205.GD28343@dsl2.external.hp.com>
References: <Pine.LNX.4.33.0301252356110.25913-100000@jordan.eng.nateng.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0301252356110.25913-100000@jordan.eng.nateng.com>
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

On Sun, Jan 26, 2003 at 12:17:31AM -0800, Sir Ace wrote:
> > uhm...what are you building that takes 4 days?
> > Not even glibc or xfree86 takes that long.
> 
> On 128 Meg of ram, and 1 100Mhz pa7200, openssl, openssh, 2.4.20 kernel,
> gcc 2.95.3, pine, and several other apps...  Remembering things don't
> normally build the first time around, and tweaks must be made...

ok. but you definitely are not building gcc 2.95.3 - we've never used that.
gcc 3.0 is the first release for parisc.

> Ok, then I will give credit to everyone who got it this far, I am happy I
> might be able to get the workstations here in my office off of HP/UX 10.20
> and into this decade, even if I have to setup NFS-root clients to do it.

I've been using b180 w/parisc-linux as desktop/debian mirror for almost 
a year now. only thing to crash the box was audio driver and test
kernels. But some things are missing that HPUX has: NetMeeting
support (T.120 specifically; GnomeMeeting supports H323), performance.

grant
