From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Erlang VM immediately exits on hppa: execve() fails
Date: Tue, 15 Dec 2009 11:11:27 -0500
Message-ID: <119aab440912150811x3527dfa1g6e260c0822ab9c02@mail.gmail.com>
References: <f60b7eb60912142352i4b97caafg7a53b24aea12befd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: HPPA porters <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>
To: Sergei Golovan <sgolovan@nes.ru>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <f60b7eb60912142352i4b97caafg7a53b24aea12befd@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Dec 15, 2009 at 2:52 AM, Sergei Golovan <sgolovan@nes.ru> wrote:
> After the recent changes in hppa architecture Erlang virtual machine
> fails to start (which leads to several FTBFS bugs in particular:
> #559628, #559962, #559004).
>
> The problem is that after vfork(), execve() fails to start a child
> process. It sets errno to EMFILE. If I run erl under strace, it works
> fine. Is it a bug in glibc, or in Erlang itself?
>
> I'm giving a small excerpt from erts/emulator/sys/unix/sys.c file
> where the failed execve(), the rest could be found in erlang
> 12.b.2.1-1 sources.

Are you certain that execve() fails to start a child process?

While debugging emacs32 failures I discovered that execve() works, but
that the parent which called the vfork() is corrupted by the child.

I posted a test case for our kernel developers to look at here:
http://article.gmane.org/gmane.linux.ports.parisc/2403

We haven't been able to determine the cause of the failure yet.

Cheers,
Carlos.
