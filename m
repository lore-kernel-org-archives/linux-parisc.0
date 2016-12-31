From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [RFC 1/4] mm: remove unused TASK_SIZE_OF()
Date: Fri, 30 Dec 2016 17:36:31 -0800
Message-ID: <CALCETrVsjDqWpF2E4gZKMx4EEFHLYSR+AOX_3BcV3FNPe13pkg@mail.gmail.com>
References: <20161230155634.8692-1-dsafonov@virtuozzo.com> <20161230155634.8692-2-dsafonov@virtuozzo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Peter Zijlstra <peterz@infradead.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        linux-parisc@vger.kernel.org,
        l
To: Dmitry Safonov <dsafonov@virtuozzo.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161230155634.8692-2-dsafonov@virtuozzo.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Dec 30, 2016 at 7:56 AM, Dmitry Safonov <dsafonov@virtuozzo.com> wrote:
> All users of TASK_SIZE_OF(tsk) have migrated to mm->task_size or
> TASK_SIZE_MAX since:
> commit d696ca016d57 ("x86/fsgsbase/64: Use TASK_SIZE_MAX for
> FSBASE/GSBASE upper limits"),
> commit a06db751c321 ("pagemap: check permissions and capabilities at
> open time"),

I like this.

Reviewed-by: Andy Lutomirski <luto@kernel.org> # for x86
