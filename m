Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 21 Jul 2003 20:46:03 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Ramesh Doddaiah <ramesh.doddaiah@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030722024603.GA20537@dsl2.external.hp.com>
References: <1058795651.3081.96.camel@eb96142.india.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1058795651.3081.96.camel@eb96142.india.hp.com>
Subject: [parisc-linux] Re: readline problem
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

On Mon, Jul 21, 2003 at 07:24:11PM +0530, Ramesh Doddaiah wrote:
> Hi Grant,
> 
>  
>    My name is Ramesh Doddaiah working in HP india in IA RAGE Project, 
> naresh who is  working in PA RAGE give me your email id.

ok

>    I had posted this problem to parisc-linux@lists.parisc-linux.org on
> 16 july, i didn't get any reply.

most of the parisc linux team has been on the road for OLS.

>    I am using Linux/i386 -> Linux/PARISC cross compiler
> (xc-latest.tar.gz from http://ftp.parisc-linux.org/x86-xcompilers/ ), 
> while compiling some piece of code which uses readline and ncurses lib
> i get this errors



> 
> /opt/palinux/lib/gcc-lib/hppa-linux/3.0.3/../../../../hppa-linux/bin/ld:
> cannot find -lreadline
> collect2: ld returned 1 exit status
> 
> 
>    I don't have readline and curses library for this version of compiler.
>    I did searched a lot to get this libraries,but i didn't get much information.
> 
>    Please tell me where can i find readline and ncurses
>    library for this version of cross compiler.
> 
>    GCC Version: 3.0.3

I'm pretty sure the old cross compiler is broken.
Send me your id_rsa.pub and I'll get you an account
on a a500 where you can use a hppa->hppa64 toolchain.

Someone is looking at fixing the hppa->hppa64 cross compiler
in gcc cvs. So we should get a shiny new *native*
toolset to work with. The alternative is to try building your
own cross compiler from a newer gcc out of debian.

You might also try the gcc mailing list.

hth,
grant

> 
> 
>    Thx :)
>    Ramesh Doddaiah
> 
