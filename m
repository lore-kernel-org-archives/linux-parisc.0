From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] Re: stay the same with gcc-3.4.2 :( [was: back to
 glibc-2.3.3 & gcc-3.4.1 pb]
Date: Sun, 12 Sep 2004 20:21:01 +0000
Message-ID: <4144AFAD.9050804@tiscali.be>
References: <200409060239.i862dAh2001466@hiauly1.hia.nrc.ca>
	<413CDB5F.3080705@tiscali.be> <41434248.7070009@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41434248.7070009@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello all,

Continuing investigation:

>> Hello Dave,
>>
>> John David Anglin wrote:
>>
>>>>     0x411cc740 <_dl_make_fptr+112>: ldw,s r7(,r6),ret0
>>>> in:
>>>> r7 == 0x7c4
>>>> r6 == 0x0
>>>
>>>
>>>
>>>
>>> r6 is wrong.  Find out why it is zero.
>>>
>> Far from being an expert, with help of ddd it seems that:
>> ElfW(Addr)
>> _dl_make_fptr (struct link_map *map, const ElfW(Sym) *sym,
>>                ElfW(Addr) ip)
>> {
>>   ElfW(Addr) *ftab = map->l_mach.fptr_table;    <====[2]
>>
[...]
>> the weird stuff his in fact here:
>>
>>   if (__builtin_expect (ftab == NULL, 0))
>>     ftab = make_fptr_table (map);	<================[3]
>>
 >>   symtab = (const void *) D_PTR (map, l_info[DT_SYMTAB]);
 >>   symidx = sym - symtab;    <=========================[1]
 >>
 >>   if (symidx >= map->l_mach.fptr_table_len)
 >>     _dl_signal_error (0, NULL, NULL,
 >>                       N_("internal error: symidx out of range of fptr table"));
 >>
 >>   while (ftab[symidx] == 0)	<========================[4]

Finaly it seems that two things hapened wronly in gcc-3.4 at those tags [3] & [4]:
comparing side by side the asm form of this chunk:

gcc-3.3						| gcc-3.4
=======						| =======
ldw 1fc(,r26),r7				| ldw 1fc(,r26),r6	<====[2]
	ftab == r7 == 0x0			|	ftab == r6 == 0x0
						|
copy r26,r8					|
cmpib,= 0,r7,0x412631a0 <_dl_make_fptr+252>	| cmpib,= 0,r6,0x412858f4 <_dl_make_fptr+548>	<====[3]'call' make_fptr_table()
	r7 == 0x40001000			|	r6 == 0x0
						|
copy r25,r3					| copy r25,r3
ldw 30(,r8),r20					| ldw 1f8(,r26),ret1
ldw 1f8(,r8),r22				| ldw 30(,r10),r21
ldw 4(,r20),r21					| ldw 4(,r21),r20
						|
	r3 == 0x4026d1c4 (== sym)		|	r3 == 0x40037cdc (== sym);
	r21 == 0x40265164 (== symtab)		|	r20 == 0x4003009c (== symtab)
sub r3,r21,r21					| sub r3,r20,r20	<====[1]
	r21 == 0x8060				|	r20 == 0x7c40
						|
extrw,s r21,27,28,r21				| extrw,s r20,27,28,r7
	[== r21 >> 4]				|	[r7 = r20 >> 4]
	r21 == 0x806				|	r7 == 0x7c4
						|
	r22 == 0x813				|	ret1 (aka r29) == 0x7d1 (== map->l_mach.fptr_table_len)
	(r22 == map->l_mach.fptr_table_len)	|	(ret1 == map->l_mach.fptr_table_len)
cmpb,<<= r22,r21,0x41263184 <_dl_make_fptr+224>	| cmpb,>>=,n r7,ret1,0x412859d0 <_dl_make_fptr+768>
depw,z r21,29,30,r9				|
	[r9 = r21 << 2]				|
	r9 == 0x2018				|
						|
add,l r9,r7,r21					|
	r21 == 0x40003018			|
						|
ldw 0(,r21),r20					| ldw,s r7(,r6),ret0	<====[4] (i.e. ftab[symidx])
cmpib,<> 0,r20,0x41263150 <_dl_make_fptr+172>	| cmpib,<> 0,ret0,0x4104aa38 <_dl_make_fptr+248>

Here I agreed that the code could be (assuming that r6 == fatb) ldw,s r7(,r6),ret0 but need at least 'depw,z r7,29,30,r7' before

[...]
ldw 2c(,r26),r21				| ldw 30(,r26),r20	<==== make_fptr_table()
ldw 30(,r26),r20				| ldw 4(,r20),r21
addil 0,r19,%r1					| addil 0,r19,%r1
copy r19,r4					| copy r1,r22
ldw 4(,r20),r22					| ldw 2c(,r26),r20
ldw 4(,r21),r26					| ldw 4(,r20),r26
ldi 3,r24					| sub r26,r21,r26
ldi 12,r23					| ldw 44(,r10),r20
ldw 44(,r8),r21					| ldw 4(,r20),r25
sub r26,r22,r26					| b,l 0x41287d60 <$$divU>,r31
ldw 654(,r1),r1					| copy r19,r4
ldw 4(,r21),r25					| ldi -1,r20
ldw 4(,r1),r20					| stw r20,-34(,sp)
ldi -1,r21					| ldi 0,r26
b,l 0x41265570 <$$divU>,r31			| ldw 638(,r22),r20
sub r0,r20,r22					| ldw 4(,r20),r25
stw r21,-34(,sp)				| depw,z ret1,29,30,r5
ldi 0,r26					| ldi 3,r24
depw,z ret1,29,30,r5				| sub r0,r25,r20
stw r0,-38(,sp)					| copy ret1,r6
copy ret1,r6					| stw r0,-38(,sp)
add,l r5,r20,r20				| add,l r5,r25,r25
add,l r20,r21,r20				| ldi 12,r23
and r20,r22,r20					| ldo -1(r25),r25
b,l 0x412641bc <__mmap>,rp			| b,l 0x412869a8 <__mmap>,rp
copy r20,r25					| and r25,r20,r25
copy r4,r19					| copy r4,r19
cmpib,= -1,ret0,0x4126323c <_dl_make_fptr+408>	| cmpib,= -1,ret0,0x412859e0 <_dl_make_fptr+784>
copy ret0,r26					| copy ret0,r26
						|	(ret0 == 0x40001000)
ldw 1fc(,r8),r20				| ldw 1fc(,r10),r20
cmpib,<>,n 0,r20,0x4126322c <_dl_make_fptr+392>	| cmpib,<>,n 0,r20,0x412859a0 <_dl_make_fptr+720>
						| copy r6,ret1
						|	(ret1 == 0x815)
stw ret0,1fc(,r8)	(a)			| stw r6,1f8(,r10)	(d)
stw r6,1f8(,r8)		(b)			| ldw 1fc(,r10),r6	(e)		<==== ????
b,l 0x412630e0 <_dl_make_fptr+60>,r0		| b,l 0x4128572c <_dl_make_fptr+92>,r0
ldw 1fc(,r8),r7		(c)			| stw ret0,1fc(,r10)	(f)		<==== make_fptr_table()'s return

hmmm here I have the feeling that (d) (e) and (f) were wrongly re-ordered;
if they have the similar order as  (f) (d) and (e), r6 == ftab would be loaded by the right value 0x40001000?

That said I didn't reach to produce a test case reporducing that fact :(
Do you think that if I transmit those explanations (may be a bit completed for gcc-3.3 example) with the precompile (-E) code, it 
could be enough to fill in a br near gcc team?

TIA,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
