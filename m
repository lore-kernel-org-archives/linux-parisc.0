From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Tue, 15 May 2012 16:05:47 -0400
Message-ID: <4FB2B71B.7090602@bell.net>
References: <4FA9975C.5060708@bergerie>  <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net>  <4FAADE2A.9080803@bergerie> <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl>  <4FAEE943.2030203@gmx.de> <BLU0-SMTP93504AF1AF0414C90D1EFB971A0@phx.gbl>  <4FB182F8.2040403@gmx.de> <BLU0-SMTP728EA90F4400504B2AF7A4971A0@phx.gbl>  <1337069366.3005.10.camel@dabdike.lan> <1337073212.3005.12.camel@dabdike.lan> <4FB29F13.5070801@bell.net> <4FB2A58A.9050706@gmx.de> <4FB2AD78.1020002@bell.net> <4FB2B2A2.2020207@bell.net> <4FB2B5B1.7000604@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Vincent <vincent.stehle@laposte.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4FB2B5B1.7000604@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 5/15/2012 3:59 PM, Helge Deller wrote:
> On 05/15/2012 09:46 PM, John David Anglin wrote:
>> On 5/15/2012 3:24 PM, John David Anglin wrote:
>>> James patch now let my 715/64 boot, but still crashes on my B160L:
>>>>
>>>> swapper (pid 1): Illegal instruction (code 8)
>>>>
>>>>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>>>> PSW: 00000000000001001110000100001111 Not tainted
>>>> r00-03  0004e10f 00000020 101198cc 17c245c0
>>>> r04-07  ffeff000 17ec05f8 007d4000 17e60260
>>>> r08-11  17c5100b fffff000 17e60310 00020000
>>>> r12-15  00000ffc 0000000b 00000000 ffeff000
>>>> r16-19  007d4000 10768020 10000000 17c22db8
>>>> r20-23  17c245c8 108fc000 00000001 00000020
>>>> r24-27  000007d4 0f2fffe0 0000fa80 106e2020
>>>> r28-31  0f2ff000 000074ee 17c24640 000072e6
>>>> sr00-03  00000000 00000001 00000000 00000000
>>>> sr04-07  00000000 00000000 00000000 00000000
>>>>
>>>> IASQ: 00000000 00000000 IAOQ: 1010118c 10101190
>>>>  IIR: 078113e0    ISR: 00000000  IOR: 0f2ff000
>>>>  CPU:        0   CR30: 17c24000 CR31: f0102978
>>>>  ORIG_R28: 17ebbe40
>>>>  IAOQ[0]: flush_icache_page_asm+0x28/0x7c
>>>>  IAOQ[1]: flush_icache_page_asm+0x2c/0x7c
>>>>  RP(r2): flush_cache_page+0x90/0xb0
>>>> Backtrace:
>>> This one is in a different place: flush_icache_page_asm.  It has
>>> crashed on the first fic,m instruction.  Again it is an illegal 
>>> instruction.
>>>
>> Looking at the PA 1.1 arch, I see that the space register needs to be
>> explicitly specified on PA 1.1 (format 26).  The implicit (format 24)
>> instruction was added in PA 2.0.
>>
>> Could you try adding %sr0 to the fic instructions?
> no illegal instruction any longer, but "bad address"....
> I changed all to " fic,m           %r1(%sr0,%r28)"
>
>
>
> Freeing unused kernel memory: 320k freed
> Backtrace:
>  [<101198cc>] flush_cache_page+0x90/0xb0
>  [<101b9b84>] do_wp_page+0x1e0/0x7b4
>  [<101bb970>] handle_pte_fault+0x284/0x7c0
>  [<101bbf74>] handle_mm_fault+0xc8/0x120
>  [<10118cc8>] do_page_fault+0x228/0x2d0
>  [<1011a838>] handle_interruption+0x1d4/0x6c4
>  [<10105078>] intr_check_sig+0x0/0x34
>
>
> Bad Address (null pointer deref?): Code=17 regs=17c244c0 (Addr=0f17d000)
>
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111100100001111 Not tainted
> r00-03  0004f90f 00000020 101198cc 17c24440
> r04-07  4017d4c4 17ebf498 007cd000 007cdb05
> r08-11  17ebee40 17ec55f4 107eb7c0 10768020
> r12-15  000007cd 17ebee74 000005f4 00050000
> r16-19  17c23098 17c24140 0011849c 17c22db8
> r20-23  0000004b 108fc000 00000000 00000000
> r24-27  000007cd 0f17dfe0 0000f9a0 106e2020
> r28-31  0f17d000 17c23098 17c244c0 6fffffff
> sr00-03  00000800 00000001 00000000 00000001
> sr04-07  00000000 00000000 00000000 00000000
>
> IASQ: 00000000 00000000 IAOQ: 1010118c 10101190
>  IIR: 078102a0    ISR: 00000800  IOR: 0f17d000
>  CPU:        0   CR30: 17c24000 CR31: f0102978
>  ORIG_R28: 17c51000
>  IAOQ[0]: flush_icache_page_asm+0x28/0x7c
>  IAOQ[1]: flush_icache_page_asm+0x2c/0x7c
>  RP(r2): flush_cache_page+0x90/0xb0
> Backtrace:
>  [<101198cc>] flush_cache_page+0x90/0xb0
>  [<101b9b84>] do_wp_page+0x1e0/0x7b4
>  [<101bb970>] handle_pte_fault+0x284/0x7c0
>  [<101bbf74>] handle_mm_fault+0xc8/0x120
>  [<10118cc8>] do_page_fault+0x228/0x2d0
>  [<1011a838>] handle_interruption+0x1d4/0x6c4
>  [<10105078>] intr_check_sig+0x0/0x34
>
>
>
>
Try %sr2 or %sr4.  %sr0 isn't zero.

Dave

-- 
John David Anglin    dave.anglin@bell.net

