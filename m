From: "Carlos O'Donell" <carlos@skynet.ca>
Subject: Re: [parisc-linux] cannot build kernel with hppa64-linux-gcc-3.4?
Date: Thu, 26 Aug 2004 19:56:29 -0400
Message-ID: <20040826235629.GB32710@baldric.uwo.ca>
References: <20040826175613.GH23033@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040826175613.GH23033@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Aug 26, 2004 at 10:56:13AM -0700, Randolph Chung wrote:
> Hi all,
> 
> while debugging some other problems, i noticed that a 64-bit kernel
> built with gcc-3.4.1 (debian 3.4.1-7) will not boot. It causes a HPMC
> very early on trying to write to nonexistent memory. gcc-3.3.4 (debian
> 1:3.3.4-9) works fine. 

Not to mention glibc. I can't build glibc with gcc-3.4.1-7
without a loader that crashes at startup.

I haven't tried building a kernel in a while, I'll throw it
on the fire and tell you if it boots.

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
