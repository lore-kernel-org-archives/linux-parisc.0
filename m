From: William Waites <ww@parc.styx.org>
Subject: Re: [parisc-linux] Support for 2.4.x kernels on hppa
Date: Mon, 24 May 2004 15:32:05 -0400
Message-ID: <20040524193205.GB51036@parc.styx.org>
References: <20040524183227.GW7207@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040524183227.GW7207@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, May 24, 2004 at 11:32:27AM -0700, Randolph Chung wrote:
> Hi all,
> 
> I'd like to take an informal "survey" of what kernel versions people are
> using....

2.4.25-pa1 on a C3000

> If you are one of those people who really care about 2.4 support, please
> speak up now! 

At the time, I was working on some things that required
SysV streams, and LiS won't run on 2.6. Now I don't need
LiS anymore. That said, the box is quite stable, so I
don't plan to touch the kernel unless a compelling reason
presents itself, in which case a change to 2.6 won't cause
any additional pain.

/w
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
