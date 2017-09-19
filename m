From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 3/5] powerpc64: Add .opd based function descriptor dereference
Date: Tue, 19 Sep 2017 20:22:37 +1000
Message-ID: <87shfjkmxe.fsf@concordia.ellerman.id.au>
References: <20170916035347.19705-1-sergey.senozhatsky@gmail.com> <20170916035347.19705-4-sergey.senozhatsky@gmail.com> <20170916094345.d332z3odceqiyrll@naverao1-tp.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "James E . J . Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>, Petr Mladek <pmladek@suse.com>,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <20170916094345.d332z3odceqiyrll@naverao1-tp.localdomain>
List-ID: <linux-ia64.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:

> On 2017/09/16 12:53PM, Sergey Senozhatsky wrote:
>> We are moving towards separate kernel and module function descriptor
>> dereference callbacks. This patch enables it for powerpc64.
>> 
>> For pointers that belong to the kernel
>> -  Added __start_opd and __end_opd pointers, to track the kernel
>>    .opd section address range;
>> 
>> -  Added dereference_kernel_function_descriptor(). Now we
>>    will dereference only function pointers that are within
>>    [__start_opd, __end_opd];
>> 
>> For pointers that belong to a module
>> -  Added dereference_module_function_descriptor() to handle module
>>    function descriptor dereference. Now we will dereference only
>>    pointers that are within [module->opd.start, module->opd.end].
>
> Would it be simpler to just use kernel_text_address() and dereference 
> everything else? See commit 83e840c770f2c5 ("powerpc64/elfv1: Only 
> dereference function descriptor for non-text symbols") for a related 
> patch.

Yeah that would be a lot simpler and probably work perfectly well.

cheers
