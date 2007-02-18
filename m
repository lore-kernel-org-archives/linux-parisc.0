From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] One of these things is not like the other!
Date: Sun, 18 Feb 2007 14:28:46 -0500
Message-ID: <5b2e36650702181128j4d1879acj960754031e4c7e0a__12164.5486717627$1416624300$gmane$org@mail.gmail.com>
References: <119aab440702181014p1b99a00dj191bab9884d42a8d@mail.gmail.com>
	<5b2e36650702181025t595bfdbam3d11b455be1cc657@mail.gmail.com>
	<119aab440702181051u7ced02dbw24089d9f4058aa7c@mail.gmail.com>
	<5b2e36650702181100s1db1698bld39315f37b5537a3@mail.gmail.com>
	<119aab440702181101w51a8bf62vbe43e87d5a016ff6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702181101w51a8bf62vbe43e87d5a016ff6@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 18/02/07, Carlos O'Donell <carlos@systemhalted.org> wrote:
> On 2/18/07, Jeff Bailey <jbailey@raspberryginger.com> wrote:
> > (sorry for the repeat, I hit reply instead of reply all)
> >
> > Any apt operation would hang.  apt-cache, apt-get, etc.  I did an
> > strace on it, but it wasn't in a syscall.  When I recompiled to get
> > debug symbols, it started working again.
>
> In the future please run gdb, attach to the process and type "bt" so
> that I can get a hint about the program failure. I'm not asking you to
> recreate the scenario, but just reminding you to mine a little more
> data :-)

I remember that it was roughly:

1. ??? ()
2. ??? ()
3. ??? ()
4. ??? ()
(etc.)

=)

no debug symbols were on the system for glibc, libstdc++, or for apt. =)

If it's worth it, I can reproduce the environment by recompiling
things with debugging symbols on Dapper, then doing the upgrades,
making sure all the builds have the symbols they need.  I'm not
certain that I can do this before Sprout is likely to show up because
of the rebuilds, so it's a longer term project.

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
