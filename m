From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Change call ABI on PA-RISC
Date: Thu, 17 Nov 2016 15:19:15 -0500
Message-ID: <CAE2sS1hv7j548_4znqSPssD7sT1aNd+ta3EZfi_67NPjR2kaqQ@mail.gmail.com>
References: <0E3ABDFC-D082-4DA8-9D5B-12FC7E95335F@bell.net>
 <bf499ea2-6148-9cf8-eba3-b0f6de5cf309@gmx.de> <93610ddc-78d3-f456-9ca0-59362ac7b355@redhat.com>
 <2d705201-5651-b4e7-9e92-6d0f175b44b9@gmx.de> <06f2cef7-6946-911e-53d8-375637d54096@redhat.com>
 <77ee085f-205e-5fcb-d5e8-86bc95d5b9eb@bell.net> <491e8502-17a3-f203-0c9a-273a988ee0ee@gmx.de>
 <CAE2sS1g2AX328mz+vi0sfGEuS=YX0=aoOCFg+evfB9-5TJ-Cjg@mail.gmail.com>
 <b9d85ee3-6509-9648-feee-21ebf9d50b2b@gmx.de> <6D56169E-C8F4-406F-A1F9-8FAF633A92E6@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Helge Deller <deller@gmx.de>, Jeff Law <law@redhat.com>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <6D56169E-C8F4-406F-A1F9-8FAF633A92E6@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Nov 15, 2016 at 7:04 PM, John David Anglin <dave.anglin@bell.net> wrote:
> Hi Helge,
>
> On 2016-11-15, at 1:30 PM, Helge Deller wrote:
>
>> Hi Carlos,
>>
>> On 14.11.2016 18:23, Carlos O'Donell wrote:
>>> On Mon, Nov 14, 2016 at 11:24 AM, Helge Deller <deller@gmx.de> wrote:
>>>> What I want to archieve is to modify the return pointer, in order
>>>> to be able to track when the function returns to his caller.
>>>> The kernel ftracer uses this then to generate call stacks and to
>>>> time the function.
>>>> Looking at the above code, it should then be possible for me
>>>> to modify -10(r3), but is there a guarantee that it's always at
>>>> -10(r3) and that r3 is used?
>>>> That's the reason I asked if we could modify mcount to
>>>> give the address (in the stack) of the return pointer, but maybe
>>>> it's just overkill for this use case ?
>>>
>>> Why do you need to modify the value?
>>>
>>> AFAICT ftrace uses these values heuristically e.g.
>>> HAVE_FUNCTION_GRAPH_FP_TEST, HAVE_FUNCTION_GRAPH_RET_ADDR_PTR?
>>>
>>> For example the only uses I see are in ftrace_pop_return_trace() and
>>> they are purely heuristic.
>>
>> Maybe I get you wrong, but do you suggest I don't need to implement
>> it because it's just heuristic ?
>> (I agree, it's not top priority, but nice to have nevertheless)
>
>
> Probably, Carlos is referring to glibc code.

No, I'm referring to linux kernel code, there is no ftrace in glibc.

The above two conditionals in the kernel are only heuristic checks to
terminate ftrace unwinds with errors.

You need not implement them to have ftrace working.

kernel/trace/trace_functions_graph.c

 173 #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
 174         current->ret_stack[index].fp = frame_pointer;
 175 #endif
 176 #ifdef HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
 177         current->ret_stack[index].retp = retp;
 178 #endif


 211 #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
 212         /*
 213          * The arch may choose to record the frame pointer used
 214          * and check it here to make sure that it is what we expect it
 215          * to be. If gcc does not set the place holder of the return
 216          * address in the frame pointer, and does a copy instead, then
 217          * the function graph trace will fail. This test detects this
 218          * case.
 219          *
 220          * Currently, x86_32 with optimize for size (-Os) makes the latest
 221          * gcc do the above.
 222          *
 223          * Note, -mfentry does not use frame pointers, and this test
 224          *  is not needed if CC_USING_FENTRY is set.
 225          */
 226         if (unlikely(current->ret_stack[index].fp != frame_pointer)) {
 227                 ftrace_graph_stop();
 228                 WARN(1, "Bad frame pointer: expected %lx, received %lx\n"
 229                      "  from func %ps return to %lx\n",
 230                      current->ret_stack[index].fp,
 231                      frame_pointer,
 232                      (void *)current->ret_stack[index].func,
 233                      current->ret_stack[index].ret);
 234                 *ret = (unsigned long)panic;
 235                 return;
 236         }
 237 #endif

 286 /**
 287  * ftrace_graph_ret_addr - convert a potentially modified stack
return address
 288  *                         to its original value
 289  *
 290  * This function can be called by stack unwinding code to convert
a found stack
 291  * return address ('ret') to its original value, in case the function graph
 292  * tracer has modified it to be 'return_to_handler'.  If the address hasn't
 293  * been modified, the unchanged value of 'ret' is returned.
 294  *
 295  * 'idx' is a state variable which should be initialized by the
caller to zero
 296  * before the first call.
 297  *
 298  * 'retp' is a pointer to the return address on the stack.  It's ignored if
 299  * the arch doesn't have HAVE_FUNCTION_GRAPH_RET_ADDR_PTR defined.
 300  */
 301 #ifdef HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
...
 317         for (i = 0; i <= index; i++)
 318                 if (task->ret_stack[i].retp == retp)
 319                         return task->ret_stack[i].ret;
 320
 321         return ret;
 322 }
 323 #else /* !HAVE_FUNCTION_GRAPH_RET_ADDR_PTR */

So you see the FP is used for heuristics to terminate a trace.

In the case of RP, I expect you should always have access to
save/restore RP from the sp-10 slot and that should be enough?

Cheers,
Carlos.
