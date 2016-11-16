From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Change call ABI on PA-RISC
Date: Tue, 15 Nov 2016 19:04:02 -0500
Message-ID: <6D56169E-C8F4-406F-A1F9-8FAF633A92E6@bell.net>
References: <0E3ABDFC-D082-4DA8-9D5B-12FC7E95335F@bell.net> <bf499ea2-6148-9cf8-eba3-b0f6de5cf309@gmx.de> <93610ddc-78d3-f456-9ca0-59362ac7b355@redhat.com> <2d705201-5651-b4e7-9e92-6d0f175b44b9@gmx.de> <06f2cef7-6946-911e-53d8-375637d54096@redhat.com> <77ee085f-205e-5fcb-d5e8-86bc95d5b9eb@bell.net> <491e8502-17a3-f203-0c9a-273a988ee0ee@gmx.de> <CAE2sS1g2AX328mz+vi0sfGEuS=YX0=aoOCFg+evfB9-5TJ-Cjg@mail.gmail.com> <b9d85ee3-6509-9648-feee-21ebf9d50b2b@gmx.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Carlos O'Donell <carlos@systemhalted.org>,
        Jeff Law <law@redhat.com>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <b9d85ee3-6509-9648-feee-21ebf9d50b2b@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Helge,

On 2016-11-15, at 1:30 PM, Helge Deller wrote:

> Hi Carlos,
> 
> On 14.11.2016 18:23, Carlos O'Donell wrote:
>> On Mon, Nov 14, 2016 at 11:24 AM, Helge Deller <deller@gmx.de> wrote:
>>> What I want to archieve is to modify the return pointer, in order
>>> to be able to track when the function returns to his caller.
>>> The kernel ftracer uses this then to generate call stacks and to
>>> time the function.
>>> Looking at the above code, it should then be possible for me
>>> to modify -10(r3), but is there a guarantee that it's always at
>>> -10(r3) and that r3 is used?
>>> That's the reason I asked if we could modify mcount to
>>> give the address (in the stack) of the return pointer, but maybe
>>> it's just overkill for this use case ?
>> 
>> Why do you need to modify the value?
>> 
>> AFAICT ftrace uses these values heuristically e.g.
>> HAVE_FUNCTION_GRAPH_FP_TEST, HAVE_FUNCTION_GRAPH_RET_ADDR_PTR?
>> 
>> For example the only uses I see are in ftrace_pop_return_trace() and
>> they are purely heuristic.
> 
> Maybe I get you wrong, but do you suggest I don't need to implement
> it because it's just heuristic ?
> (I agree, it's not top priority, but nice to have nevertheless)


Probably, Carlos is referring to glibc code.

Dave
--
John David Anglin	dave.anglin@bell.net



