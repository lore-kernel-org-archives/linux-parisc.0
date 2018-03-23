From: Ilya Smith <blackzert@gmail.com>
Subject: Re: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
Date: Fri, 23 Mar 2018 20:55:49 +0300
Message-ID: <651E0DB6-4507-4DA1-AD46-9C26ED9792A8@gmail.com>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Type: text/plain;
        charset=utf-8
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
        vgupta@synopsys.com, linux@armlinux.org.uk, tony.luck@intel.com,
        fenghua.yu@intel.com, ralf@linux-mips.org, jejb@parisc-linux.org,
        Helge Deller <deller@gmx.de>, benh@kernel.crashing.org,
        paulus@samba.org, mpe@ellerman.id.au, schwidefsky@de.ibm.com,
        heiko.carstens@de.ibm.com, ysato@users.sourceforge.jp,
        dalias@libc.org, davem@davemloft.net, tglx@linutronix.de,
        mingo@redhat.com, hpa@zytor.com, x86@kernel.org,
        nyc@holomorphy.com, viro@zeniv.linux.org.uk, arnd@arndb.de,
        gregkh@linuxfoundation.org, deepa.kernel@gmail.com,
        Michal Hocko <mhocko@suse.com>,
        Hugh Dickins <hughd@google.com>, kstewart@linuxfoundation.org,
        pombredanne@nexb.com, Andrew Morton <akpm@linux-foundation.org>,
        steve.capper@arm.com, punit.agrawal@arm.com,
To: Matthew Wilcox <willy@infradead.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180323124806.GA5624@bombadil.infradead.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


> On 23 Mar 2018, at 15:48, Matthew Wilcox <willy@infradead.org> wrote:
>=20
> On Thu, Mar 22, 2018 at 07:36:36PM +0300, Ilya Smith wrote:
>> Current implementation doesn't randomize address returned by mmap.
>> All the entropy ends with choosing mmap_base_addr at the process
>> creation. After that mmap build very predictable layout of address
>> space. It allows to bypass ASLR in many cases. This patch make
>> randomization of address on any mmap call.
>=20
> Why should this be done in the kernel rather than libc?  libc is =
perfectly
> capable of specifying random numbers in the first argument of mmap.
Well, there is following reasons:
1. It should be done in any libc implementation, what is not possible =
IMO;
2. User mode is not that layer which should be responsible for choosing
random address or handling entropy;
3. Memory fragmentation is unpredictable in this case

Off course user mode could use random =E2=80=98hint=E2=80=99 address, =
but kernel may
discard this address if it is occupied for example and allocate just =
before
closest vma. So this solution doesn=E2=80=99t give that much security =
like=20
randomization address inside kernel.=
