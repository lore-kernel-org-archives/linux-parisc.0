From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Erlang VM immediately exits on hppa: execve() fails
Date: Tue, 15 Dec 2009 16:49:07 -0500
Message-ID: <119aab440912151349n130fa7a4w49acf3be253d3cde@mail.gmail.com>
References: <f60b7eb60912142352i4b97caafg7a53b24aea12befd@mail.gmail.com>
	 <119aab440912150811x3527dfa1g6e260c0822ab9c02@mail.gmail.com>
	 <f60b7eb60912151124u255498ffob9cb422cc730268f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	kyle@mcmartin.ca
To: Sergei Golovan <sgolovan@nes.ru>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <f60b7eb60912151124u255498ffob9cb422cc730268f@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Dec 15, 2009 at 2:24 PM, Sergei Golovan <sgolovan@nes.ru> wrote=
:
> On Tue, Dec 15, 2009 at 7:11 PM, =A0<carlos@systemhalted.org> wrote:
>> On Tue, Dec 15, 2009 at 2:52 AM, Sergei Golovan <sgolovan@nes.ru> wr=
ote:
>>> After the recent changes in hppa architecture Erlang virtual machin=
e
>>> fails to start (which leads to several FTBFS bugs in particular:
>>> #559628, #559962, #559004).
>>>
>>> The problem is that after vfork(), execve() fails to start a child
>>> process. It sets errno to EMFILE. If I run erl under strace, it wor=
ks
>>> fine. Is it a bug in glibc, or in Erlang itself?
>>>
>>> I'm giving a small excerpt from erts/emulator/sys/unix/sys.c file
>>> where the failed execve(), the rest could be found in erlang
>>> 12.b.2.1-1 sources.
>>
>> Are you certain that execve() fails to start a child process?
>
> Yes, after I've inserted some debug printf() right after execve() it
> was reached.

Yes, you are definitely right, I hadn't thought to try that.

I will test an instrumented kernel tonight to see what the problem is.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
