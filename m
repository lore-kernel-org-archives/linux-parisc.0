Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 10 May 2003 00:47:16 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Richard Todd <rtodd@antipentium.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP on J5000
Message-ID: <20030510064716.GD7649@dsl2.external.hp.com>
References: <BAE1D935.ADA%rtodd@antipentium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <BAE1D935.ADA%rtodd@antipentium.com>
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

On Fri, May 09, 2003 at 10:16:21PM -0400, Richard Todd wrote:
> Linux k2000 2.4.20-pa32 #1 Sat May 10 00:07:09
> Latest gcc

"gcc -v" output please

> This is a 785/j5000
> 
> This is the error we get when trying to compile the SMP kernel
> sched.c:93: initializer element is not constant

grundler@gsyprf11:/usr/src/2.4.20-SMP$ ls -l kernel/sched*
-rw-r--r--    1 grundler users       32779 Nov 13 21:13 kernel/sched.c
-rw-r--r--    1 grundler users      173096 May  9 23:41 kernel/sched.o

Using "gcc version 3.2.3 20030316".
My tree isn't totally clean but I don't think any changes I have
interact with sched.c.

Can you verify your source tree is not corrupted?

If you haven't done so already, please save your .config,
"make distclean" and start over.

grant
