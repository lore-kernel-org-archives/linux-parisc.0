From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Latest 2.6.13-rc6-pa2 test pr :_(
Date: Sun, 21 Aug 2005 14:37:38 +0000
Message-ID: <430891B2.1010507@tiscali.be>
References: <200508201751.j7KHpqIH017505@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200508201751.j7KHpqIH017505@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



John David Anglin wrote:
>>>TOC:
>>>
>>>r2	__handle_mm_fault+0x68  (return from call to pte_alloc_map)
>>>IIA	__handle_mm_fault+0x190
>>>
>>>It looks as if this might have been caused by Process_3.exe in the
>>>libjava GCC testsuite.
>>
>>Does it always hang in the same place? How much RAM/swap do you have in 
>>your system? Does it hang more/less if you disable swap?
> 
> 
> Had another hang last night.  Here is the TOC for it:
> 
> r2	intr_check_sig+0
> IIA	handle_interruption+0x30
> r26,r5	code = 0x1a = 26 => Data Memory Access Rights Trap
> 
mmm, from pure user point of view that sounds a bit like a segv?

and btw in traps.c still stand some other
[...]
     479 void handle_interruption(int code, struct pt_regs *regs)
     480 {
[...]
     737                 force_sig_info(SIGSEGV, &si, current);
[...]
     781                 force_sig_info(SIGSEGV, &si, current);
[...]

This last one is specialy interesting as (if I well understand) ending handle_interruption() for case 26.

Unfortunately, not yet find how to fix it:
	o as tausq did for signal.c
	o s/force_sig_info(SIGSEGV, &si, current)/force_sig(SIGSEGV, current)/

Joel

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
