From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: hppa nptl switch
Date: Mon, 31 Aug 2009 01:01:39 -0400
Message-ID: <119aab440908302201s35719b5fh3f7d7b1e870c445f@mail.gmail.com>
References: <Pine.LNX.4.62.0908181940440.7856@sci.felk.cvut.cz>
	 <119aab440908181851i174315c6lebacea921046bbb0@mail.gmail.com>
	 <20090819124816.GC2517@hall.aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Petr Salinger <Petr.Salinger@seznam.cz>, debian-hppa@lists.debian.org,
	debian-glibc@lists.debian.org, linux-parisc <linux-parisc@vger.kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <20090819124816.GC2517@hall.aurel32.net>
Resent-Message-ID: <DoTxQcqJZwI.A.DZH.Kl1mKB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Wed, Aug 19, 2009 at 8:48 AM, Aurelien Jarno<aurelien@aurel32.net> wrote:
> [Changing debian-bsd to debian-glibc, probably more appropriate to
> discuss about the internal glibc code ;-)]
>> > may I ask you for status of hppa nptl switch ?

Petr, Aurelian,

I spent the last two days rewriting the pthread structure layouts for
hppa's nptl implementation.

Thanks to Petr's insight, I was able to restructure both
pthread_mutex_t, and pthread_rwlock_t to be 100% ABI compatible with
Linuxthreads.

In the case of pthread_cond_t, the structure grew so much, that I had
to use some of the old lock words (non-zero initialized words) for new
fields, and this meant that all of the pthread_cond_* functions will
quickly test and zero pthread_cond_t before use. The new NPTL
PTHREAD_COND_INITIALIZER uses the fast-path in the code, thus as
applications are rebuilt they will run faster.

The prototype patch in testing is here:
http://www.parisc-linux.org/~carlos/2009-08-31-glibc-ports-hppa-nptl.diff

This patch is not the final version, I need to remove the
old_pthread_cond_* functions, and cleanup the pthread_cond_* functions
to use the same version number. At the end of the day I'm not going to
version any of the functions, because technically they will be ABI
compatible. I will however, surround the checking code with some
version checks so it can be removed in the future (or generate a
warning).

Please note that the new code *will* support partial upgrades for
debian, since this is a 100% ABI compatible change.

I will report back over the next few days on the status of testing the
new patch.

Cheers,
Carlos.
