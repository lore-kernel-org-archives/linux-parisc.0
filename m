Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id D5104482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Jan 2003 01:10:06 -0700 (MST)
Date: Wed, 29 Jan 2003 23:54:03 -0800
From: Randolph Chung <tausq@debian.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Issues with seteuid()?
Message-ID: <20030130075403.GK20940@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030130073214.GJ20940@tausq.org> <3E35C33F0000094B@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E35C33F0000094B@ocpmta3.freegates.net>
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

[oops, forgot to send the last message to the list -- i had asked Joel
for his ulimit settings]

> Nothing that is not std (AFAIK & IIRC):
> 
> # ulimit -a
> core file size        (blocks, -c) 0
> data seg size         (kbytes, -d) unlimited
> file size             (blocks, -f) unlimited
> max locked memory     (kbytes, -l) unlimited
> max memory size       (kbytes, -m) 5000
> open files                    (-n) 1024
> pipe size          (512 bytes, -p) 8
> stack size            (kbytes, -s) 8192
> cpu time             (seconds, -t) unlimited
> max user processes            (-u) 20
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> virtual memory        (kbytes, -v) unlimited

That's the reason..... if you do 'ulimit -u unlimited' (or at least a
bigger number) you should be ok.

randolph
