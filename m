From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [RFC 1/4] mm: remove unused TASK_SIZE_OF()
Date: Thu, 5 Jan 2017 09:51:26 +0000
Message-ID: <063D6719AE5E284EB5DD2968C1650D6DB0258289@AcuExch.aculab.com>
References: <20161230155634.8692-1-dsafonov@virtuozzo.com>
 <20161230155634.8692-2-dsafonov@virtuozzo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "0x7f454c46@gmail.com" <0x7f454c46@gmail.com>, Helge Deller <deller@gmx.de>,
 "x86@kernel.org" <x86@kernel.org>,
 "James E.J. Bottomley" <jejb@parisc-linux.org>, Ingo Molnar <mingo@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, Martin
 Schwidefsky <schwidefsky@de
To: 'Dmitry Safonov' <dsafonov@virtuozzo.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161230155634.8692-2-dsafonov@virtuozzo.com>
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org

From: Dmitry Safonov
> Sent: 30 December 2016 15:57
> All users of TASK_SIZE_OF(tsk) have migrated to mm->task_size or
> TASK_SIZE_MAX since:
> commit d696ca016d57 ("x86/fsgsbase/64: Use TASK_SIZE_MAX for
> FSBASE/GSBASE upper limits"),
> commit a06db751c321 ("pagemap: check permissions and capabilities at
> open time"),
...
> +#define TASK_SIZE	        (current->thread.task_size)

I'm not sure I like he hidden 'current' argument to an
apparent constant.

	David
