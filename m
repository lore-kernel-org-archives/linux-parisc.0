From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Transition hppa from linuxthreads to nptl is ready to proceed.
Date: Tue, 8 Sep 2009 14:04:17 -0400
Message-ID: <119aab440909081104s206d64dbxba7ef011839b2822@mail.gmail.com>
References: <119aab440909071454s7923b95atce6f5f5a7e5b469d@mail.gmail.com>
	 <200909081357.37995.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Debian HPPA Port List <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Petr Salinger <Petr.Salinger@seznam.cz>,
	Grant Grundler <grundler@parisc-linux.org>
To: Mike Frysinger <vapier@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200909081357.37995.vapier@gentoo.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Sep 8, 2009 at 1:57 PM, Mike Frysinger<vapier@gentoo.org> wrote=
:
> On Monday 07 September 2009 17:54:01 Carlos O'Donell wrote:
>> The following patches implement version 2 of the NPTL upgrade for
>> hppa. This second version is a rewrite of internal pthread structure=
s
>> and is 100% ABI backwards compatible. All old applications will run
>> with the new glibc, including during partial upgrades.
>>
>> I have tested the following patches with eglibc_2.10.1-0exp1, the
>> testing has included the standard glibc regression testing, simulati=
on
>> of partial upgrades, and heavy chroot testing with Xnest, and severa=
l
>> large multithreaded UI applications (evince, xchat, nautilus,
>> gnome-session etc). All tests succeeded.
>>
>> * Please add the following patch to the hppa set of patches:
>> http://www.parisc-linux.org/~carlos/debian-final_glibc-ports-hppa-np=
tl.diff
>
> any reason for not pushing this (and all the other hppa patches) to t=
he glibc
> ports tree ? =A0it isnt like you'll be breaking anything that isnt al=
ready
> broken, and it'll make it easier for people to play with mainline gli=
bc.

It would have been upstream *before* the email went out, but my git-fu
is incredibly weak.

I've been talking to Roland about my problems with pushing upstream
(and the accidental branch I created on glibc.git).

git push -v
Pushing to git://sourceware.org/git/glibc-ports.git
fatal: The remote end hung up unexpectedly

git remote show origin
* remote origin
  URL: git://sourceware.org/git/glibc-ports.git
  HEAD branch: master
=2E..
  Local branch configured for 'git pull':
    master merges with remote master
  Local ref configured for 'git push':
    master pushes to master (fast forwardable)

I don't know what's wrong here. AFAICT it should just work, I've been
using `git pull --rebase` to keep my repo updated.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
