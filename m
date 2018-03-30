From: Ilya Smith <blackzert@gmail.com>
Subject: Re: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
Date: Fri, 30 Mar 2018 14:10:21 +0300
Message-ID: <4F529F89-6595-4DE9-87C2-C3D971C76658@gmail.com>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180330075508.GA21798@amd> <95EECC28-7349-4FB4-88BF-26E4CF087A0B@gmail.com>
 <20180330095735.GA15641@amd>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Type: text/plain;
        charset=utf-8
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
        vgupta@synopsys.com, linux@armlinux.org.uk, tony.luck@intel.com,
        fenghua.yu@intel.com, jhogan@kernel.org, ralf@linux-mips.org,
        jejb@parisc-linux.org, Helge Deller <deller@gmx.de>,
        benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
        schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com,
        ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net,
        tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com,
        x86@kernel.org, nyc@holomorphy.com, viro@zeniv.linux.org.uk,
        arnd@arndb.de, gregkh@linuxfoundation.org, deepa.kernel@gmail.com,
        Michal Hocko <mhocko@suse.com>, hughd@google.com,
        kstewart@linuxfoundation.org, pombredanne@nexb.com,
        akpm@linux-foundation.org, steve.capper@arm.com,
        punit.agrawal@arm.com, paul.burton@m
To: Pavel Machek <pavel@ucw.cz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180330095735.GA15641@amd>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


> On 30 Mar 2018, at 12:57, Pavel Machek <pavel@ucw.cz> wrote:
>=20
> On Fri 2018-03-30 12:07:58, Ilya Smith wrote:
>> Hi
>>=20
>>> On 30 Mar 2018, at 10:55, Pavel Machek <pavel@ucw.cz> wrote:
>>>=20
>>> Hi!
>>>=20
>>>> Current implementation doesn't randomize address returned by mmap.
>>>> All the entropy ends with choosing mmap_base_addr at the process
>>>> creation. After that mmap build very predictable layout of address
>>>> space. It allows to bypass ASLR in many cases. This patch make
>>>> randomization of address on any mmap call.
>>>=20
>>> How will this interact with people debugging their application, and
>>> getting different behaviours based on memory layout?
>>>=20
>>> strace, strace again, get different results?
>>>=20
>>=20
>> Honestly I=E2=80=99m confused about your question. If the only one =
way for debugging=20
>> application is to use predictable mmap behaviour, then something went =
wrong in=20
>> this live and we should stop using computers at all.
>=20
> I'm not saying "only way". I'm saying one way, and you are breaking
> that. There's advanced stuff like debuggers going "back in time".
>=20

Correct me if I wrong, when you run gdb for instance and try to debug =
some=20
application, gdb will disable randomization. This behaviour works with =
gdb=20
command: set disable-randomization on. As I know, gdb remove flag =
PF_RANDOMIZE=20
from current personality thats how it disables ASLR for debugging =
process.=20
According to my patch, flag PF_RANDOMIZE is checked before calling=20
unmapped_area_random. So I don=E2=80=99t breaking debugging. If you =
talking about the=20
case, when your application crashes under customer environment and you =
want to
debug it; in this case layout of memory is what you don=E2=80=99t =
control at all and=20
you have to understand what is where. So for debugging memory process =
layout is
not what you should care of.

Thanks,
Ilya
