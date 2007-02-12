From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] statfs() problem with glibc-2.5
Date: Mon, 12 Feb 2007 11:29:48 -0500
Message-ID: <5b2e36650702120829u1d06e09cyc09ee8faebc8d9c9__23945.974224671$1416624287$gmane$org@mail.gmail.com>
References: <20070212102844.f045d760.gmsoft@gentoo.org>
	<20070212153731.846e2ad3.gmsoft@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "Guy Martin" <gmsoft@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070212153731.846e2ad3.gmsoft@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 12/02/07, Guy Martin <gmsoft@gentoo.org> wrote:
> After some more troubleshooting, I've found out that parisc doesn't hook up the statfs64 syscall.
>
> Applying the attached patch and recompile glibc with updated headers makes df works again.
>
> Apparently, the statfs64 syscalls are available since 2.5.74.

Thanks,  I'll test this later.  We have this problem in Ubuntu right
now on 64 bit kernels, but I hadn't narrowed it down enough to make a
report yet. =)

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
