From: Rob Landley <rob@landley.net>
Subject: Re: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
Date: Tue, 27 Mar 2018 23:50:02 -0500
Message-ID: <7e41ef7a-0bac-02fe-21fd-a1ed86c22230@landley.net>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
 <20180323180024.GB1436@brightrain.aerifal.cx>
 <20180323190618.GA23763@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Ilya Smith <blackzert@gmail.com>, rth@twiddle.net,
        ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@synopsys.com,
        linux@armlinux.org.uk, tony.luck@intel.com, fenghua.yu@intel.com,
        jhogan@kernel.org, ralf@linux-mips.org, jejb@parisc-linux.org,
        deller@gmx.de, benh@kernel.crashing.org, paulus@samba.org,
        mpe@ellerman.id.au, schwidefsky@de.ibm.com,
        heiko.carstens@de.ibm.com, ysato@users.sourceforge.jp,
        davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com,
        hpa@zytor.com, x86@kernel.org, nyc@holomorphy.com,
        viro@zeniv.linux.org.uk, arnd@arndb.de, gregkh@linuxfoundation.org,
        deepa.kernel@gmail.com, mhocko@suse.com, hughd@google.com,
        kstewart@linuxfoundation.org, pombredanne@nexb.com,
        akpm@linux-foundation.org, steve.capper@arm.com,
        punit.agrawal@arm.com, paul.burton@mips.com,
To: Matthew Wilcox <willy@infradead.org>, Rich Felker <dalias@libc.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180323190618.GA23763@bombadil.infradead.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 03/23/2018 02:06 PM, Matthew Wilcox wrote:
> On Fri, Mar 23, 2018 at 02:00:24PM -0400, Rich Felker wrote:
>> On Fri, Mar 23, 2018 at 05:48:06AM -0700, Matthew Wilcox wrote:
>>> On Thu, Mar 22, 2018 at 07:36:36PM +0300, Ilya Smith wrote:
>>>> Current implementation doesn't randomize address returned by mmap.
>>>> All the entropy ends with choosing mmap_base_addr at the process
>>>> creation. After that mmap build very predictable layout of address
>>>> space. It allows to bypass ASLR in many cases. This patch make
>>>> randomization of address on any mmap call.
>>>
>>> Why should this be done in the kernel rather than libc?  libc is perfectly
>>> capable of specifying random numbers in the first argument of mmap.
>>
>> Generally libc does not have a view of the current vm maps, and thus
>> in passing "random numbers", they would have to be uniform across the
>> whole vm space and thus non-uniform once the kernel rounds up to avoid
>> existing mappings.
> 
> I'm aware that you're the musl author, but glibc somehow manages to
> provide etext, edata and end, demonstrating that it does know where at
> least some of the memory map lies.

You can parse /proc/self/maps, but it's really expensive and disgusting.

Rob
