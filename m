From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Y2038] [PATCH v4 02/10] include: Move compat_timespec/ timeval
 to compat_time.h
Date: Thu, 15 Mar 2018 09:04:04 +0100
Message-ID: <CAK8P3a1p1PruO_KsiE-sGAZdmoAVi2E3zZ+SXMzU=AZsb-RY-A@mail.gmail.com>
References: <20180312175307.11032-3-deepa.kernel@gmail.com>
 <201803132313.a4R8Y434%fengguang.wu@intel.com>
 <CABeXuvqNKfuvffU24Xydixv6Ro8R=2nAH4bruzx0AW=ax-6yOQ@mail.gmail.com>
 <CAK8P3a1fxWAK94GH0cpzh6CHXgL4uJuDNCGpdJen5ib1HH1xoA@mail.gmail.com>
 <CABeXuvpFfD+a6tSSOvni=v23DuJ-bWeZwmnzg4SU+TR=WHxs7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>,
 devel@driverdev.osuosl.org, linux-s390 <linux-s390@vger.kernel.org>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>, sebott@linux.vnet.ibm.com,
 "James E.J. Bottomley" <jejb@parisc-linux.org>,
 Will Deacon <will.deacon@arm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 oprofile-list@lists.sf.net, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Robert Richter <rric@kernel.org>, Chris Metcalf
To: Deepa Dinamani <deepa.kernel@gmail.com>
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CABeXuvpFfD+a6tSSOvni=v23DuJ-bWeZwmnzg4SU+TR=WHxs7Q@mail.gmail.com>
List-Id: Linux Driver Project Developer List
 <driverdev-devel.linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org

On Thu, Mar 15, 2018 at 3:51 AM, Deepa Dinamani <deepa.kernel@gmail.com> wrote:
> On Wed, Mar 14, 2018 at 1:52 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Wed, Mar 14, 2018 at 4:50 AM, Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>>> The file arch/arm64/kernel/process.c needs asm/compat.h also to be
>>> included directly since this is included conditionally from
>>> include/compat.h. This does seem to be typical of arm64 as I was not
>>> completely able to get rid of asm/compat.h includes for arm64 in this
>>> series. My plan is to have separate patches to get rid of asm/compat.h
>>> includes for the architectures that are not straight forward to keep
>>> this series simple.
>>> I will fix this and update the series.
>>>
>>
>> I ran across the same thing in two more files during randconfig testing on
>> arm64 now, adding this fixup on top for the moment, but maybe there
>> is a better way:
>
> I was looking at how Al tested his uaccess patches:
> https://www.spinics.net/lists/linux-fsdevel/msg108752.html
>
> He seems to be running the kbuild bot tests on his own git.
> Is it possible to verify it this way on the 2038 tree? Or, I could
> host a tree also.

The kbuild bot should generally pick up any branch on git.kernel.org,
and the patches sent to the mailing list. It tests a lot of things
configurations, but I tend to find some things that it doesn't find
by doing lots of randconfig builds on fewer target architectures
(I only build arm, arm64 and x86 regularly).

I remember that there was some discussion about a method
to get the bot to test other branches (besides asking Fengguang
to add it manually), but I don't remember what came out of that.

        Arnd
