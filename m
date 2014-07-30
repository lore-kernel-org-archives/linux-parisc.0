From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: [RFC PATCHv2] 64bit LWS CAS
Date: Wed, 30 Jul 2014 11:17:02 +0200
Message-ID: <f4954acbf0d2c11646341cb93efdd247@tuxicoman.be>
References: <20140729211334.02d2b5e2@borg.lux.tuxicoman.be>
 <53D810FB.9010406@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_a65a2effa8fc3e62c5634e2c4e423ad1"
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <53D810FB.9010406@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--=_a65a2effa8fc3e62c5634e2c4e423ad1
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8;
 format=flowed


Hi Helge,

On 2014-07-29 23:24, Helge Deller wrote:
> Hi Guy,
> 
> Very nice work !

Thanks !

> I compile-tested it...(but didn't runtime tested it yet):

I have attached the small test program I use to test the LWS outside gcc 
for easy testing.

Moreover, the gcc patch I attached previously is not the right one. It 
also contained JDA's changes.
I have attached a patch that applies against gcc's trunk.

>   AS      arch/parisc/kernel/syscall.o
> /home/cvs/LINUX/git-kernel/linux-2.6/arch/parisc/kernel/syscall.S:
> Assembler messages:
> /home/cvs/LINUX/git-kernel/linux-2.6/arch/parisc/kernel/syscall.S:866:
> Error: Invalid operands
> /home/cvs/LINUX/git-kernel/linux-2.6/arch/parisc/kernel/syscall.S:870:
> Error: Invalid operands
> 
> Line 866 is the jump label 18:
> 18:     ldd,ma  0(%sr3,%r26), %r29
> 
> Line 870 is 19:
> 19:     ldd,ma  4(%sr3,%r26), %r29
> 
> I think both should be ldw ?


Indeed, fixed in the new patch attached.


> An idea:
> Maybe the config option CONFIG_PA8X00 (which enables -march=2.0) can be 
> used in
> some places to use the 64bit assembler even on 32bit kernel (instead
> of using CONFIG_64BIT) ?

Indeed, this is definitely a good idea. But it should probably be a 
separate patch since we need to touch the existing code to enable wide 
mode when entering the LWS.

> 
>> My approach for 64bit CAS on 32bit is be the following :
>>   - Load old into 2 registers
>>   - Compare low and high part and bail out if different
>>   - Load new into a FPU register
>>   - Store the content of the FPU register to the memory
>> 
>> The point here being to do the store in the last step in a single
>> instruction.
>> I think the same approach can be used for 128bit CAS as well but I
>> don't think it's needed at the moment.
> 
> Since the 64bit CAS on 32bit currently uses 9 asms, it can't be added
> as is right now anyway.
> Maybe it makes sense to pull out the "flddx 0(%sr3,%r24), %fr4" from
> this content and to preload
> it to where you set up r22/r23-high/low ?

Good point, I changed that too. However, having 9 asm isns shouldn't be 
a problem there because we won't jump past that.


>> Regading the GCC counterpart of the implementation, I'm not sure about
>> the way to proceed.
>> 
>> Should I try to detect the presence of the new LWS and use it for all
>> CAS operations at init time ?
> 
> I leave this up to Dave & Carlos to answer.
> 
>> So far I only used the new LWS for 64bit CAS.
> 
> +       /***************************************************
> +               New CAS implementation which uses pointers and
> variable size information.
> +               The value pointed by old and new MUST NOT change while
> performing CAS.
> +               The lock only protect the value at %r26.
> +
> +               %r26 - Address to examine
> +               %r25 - Pointer to the value to check (old)
> +               %r24 - Pointer to the value to set (new)
> +               %r23 - Size of the variable (8bit = 0, 16bit = 1,
> 32bit = 2, 64bit = 4)
> 
> Since you shift %r23 in your code, I think the comment above is wrong
> for 64bit which should be 3 instead of 4 ?

Fixed.

> You use nop's in your code to align to 32 bytes to be able to jump.
> Does it make sense to use .align 32 instead ? I'm not sure myself about 
> that...

I don't know either, nop seemed like the easiest and cleanest way to do 
so for me.

> Should we maybe drop the whole ENABLE_LWS_DEBUG thing? Was it ever 
> used/enabled?

Indeed, I have not tested it and I dropped it in this new patch.

>> I guess that using the new LWS unconditionally for all CAS operations
>> isn't an option since it will break for newer gcc on old kernels.
> 
> Up to now we only had the 32bit CAS working correctly, so we shouldn't 
> care much
> about the other CAS anyway.
> And if we get it backported into all relevant kernels before we change 
> gcc
> I would prefer this hard break...


32bit CAS works but as far as I understand, 8 and 16 bit is broken since 
the stw in the current LWS will overwrite 3 and 2 bytes of memory 
respectively with zeros.
So IMHO this should definitely be changed.

   Guy



--=_a65a2effa8fc3e62c5634e2c4e423ad1
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
 name=linux-hppa-atomic-cas2_v2.patch
Content-Disposition: attachment;
 filename=linux-hppa-atomic-cas2_v2.patch;
 size=7767

ZGlmZiAtLWdpdCBhL2FyY2gvcGFyaXNjL2tlcm5lbC9zeXNjYWxsLlMgYi9hcmNoL3BhcmlzYy9r
ZXJuZWwvc3lzY2FsbC5TCmluZGV4IDgzODc4NjAuLmQ1NjVlMWYgMTAwNjQ0Ci0tLSBhL2FyY2gv
cGFyaXNjL2tlcm5lbC9zeXNjYWxsLlMKKysrIGIvYXJjaC9wYXJpc2Mva2VybmVsL3N5c2NhbGwu
UwpAQCAtNzQsNyArNzQsNyBAQCBFTlRSWShsaW51eF9nYXRld2F5X3BhZ2UpCiAJLyogQUREUkVT
UyAweGIwIHRvIDB4YjgsIGx3cyB1c2VzIHR3byBpbnNucyBmb3IgZW50cnkgKi8KIAkvKiBMaWdo
dC13ZWlnaHQtc3lzY2FsbCBlbnRyeSBtdXN0IGFsd2F5cyBiZSBsb2NhdGVkIGF0IDB4YjAgKi8K
IAkvKiBXQVJOSU5HOiBLZWVwIHRoaXMgbnVtYmVyIHVwZGF0ZWQgd2l0aCB0YWJsZSBzaXplIGNo
YW5nZXMgKi8KLSNkZWZpbmUgX19OUl9sd3NfZW50cmllcyAoMikKKyNkZWZpbmUgX19OUl9sd3Nf
ZW50cmllcyAoMykKIAogbHdzX2VudHJ5OgogCWdhdGUJbHdzX3N0YXJ0LCAlcjAJCS8qIGluY3Jl
YXNlIHByaXZpbGVnZSAqLwpAQCAtNTAyLDcgKzUwMiw3IEBAIGx3c19leGl0OgogCiAJCiAJLyoq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgotCQlJbXBs
ZW1lbnRpbmcgQ0FTIGFzIGFuIGF0b21pYyBvcGVyYXRpb246CisJCUltcGxlbWVudGluZyAzMmJp
dCBDQVMgYXMgYW4gYXRvbWljIG9wZXJhdGlvbjoKIAogCQklcjI2IC0gQWRkcmVzcyB0byBleGFt
aW5lCiAJCSVyMjUgLSBPbGQgdmFsdWUgdG8gY2hlY2sgKG9sZCkKQEAgLTY1OSw2ICs2NTksMjM5
IEBAIGNhc19hY3Rpb246CiAJQVNNX0VYQ0VQVElPTlRBQkxFX0VOVFJZKDJiLWxpbnV4X2dhdGV3
YXlfcGFnZSwgM2ItbGludXhfZ2F0ZXdheV9wYWdlKQogCiAKKwkvKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCisJCU5ldyBDQVMgaW1wbGVtZW50YXRp
b24gd2hpY2ggdXNlcyBwb2ludGVycyBhbmQgdmFyaWFibGUgc2l6ZSBpbmZvcm1hdGlvbi4KKwkJ
VGhlIHZhbHVlIHBvaW50ZWQgYnkgb2xkIGFuZCBuZXcgTVVTVCBOT1QgY2hhbmdlIHdoaWxlIHBl
cmZvcm1pbmcgQ0FTLgorCQlUaGUgbG9jayBvbmx5IHByb3RlY3QgdGhlIHZhbHVlIGF0ICVyMjYu
CisKKwkJJXIyNiAtIEFkZHJlc3MgdG8gZXhhbWluZQorCQklcjI1IC0gUG9pbnRlciB0byB0aGUg
dmFsdWUgdG8gY2hlY2sgKG9sZCkKKwkJJXIyNCAtIFBvaW50ZXIgdG8gdGhlIHZhbHVlIHRvIHNl
dCAobmV3KQorCQklcjIzIC0gU2l6ZSBvZiB0aGUgdmFyaWFibGUgKDhiaXQgPSAwLCAxNmJpdCA9
IDEsIDMyYml0ID0gMiwgNjRiaXQgPSAzKQorCQklcjI4IC0gUmV0dXJuIG5vbi16ZXJvIG9uIGZh
aWx1cmUKKwkJJXIyMSAtIEtlcm5lbCBlcnJvciBjb2RlCisKKwkJSWYgZGVidWdnaW5nIGlzIERJ
U2FibGVkOgorCisJCSVyMjEgaGFzIHRoZSBmb2xsb3dpbmcgbWVhbmluZ3M6CisKKwkJRUFHQUlO
IC0gQ0FTIGlzIGJ1c3ksIGxkY3cgZmFpbGVkLCB0cnkgYWdhaW4uCisJCUVGQVVMVCAtIFJlYWQg
b3Igd3JpdGUgZmFpbGVkLgorCisJCUlmIGRlYnVnZ2luZyBpcyBlbmFibGVkOgorCisJCUVERUFE
TE9DSyAtIENBUyBjYWxsZWQgcmVjdXJzaXZlbHkuCisJCUVBR0FJTiAmJiByMjggPT0gMSAtIENB
UyBpcyBidXN5LiBMb2NrIGNvbnRlbmRlZC4KKwkJRUFHQUlOICYmIHIyOCA9PSAyIC0gQ0FTIGlz
IGJ1c3kuIGxkY3cgZmFpbGVkLgorCQlFRkFVTFQgLSBSZWFkIG9yIHdyaXRlIGZhaWxlZC4KKwor
CQlTY3JhdGNoOiByMjAsIHIyMiwgcjI4LCByMjksIHIxLCBmcjQgKDMyYml0IGZvciA2NGJpdCBD
QVMgb25seSkKKworCSoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKiovCisKKwkvKiBFTEYzMiBQcm9jZXNzIGVudHJ5IHBhdGggKi8KK2x3c19jb21wYXJl
X2FuZF9zd2FwXzI6CisjaWZkZWYgQ09ORklHXzY0QklUCisJLyogQ2xpcCB0aGUgaW5wdXQgcmVn
aXN0ZXJzICovCisJZGVwZGkJMCwgMzEsIDMyLCAlcjI2CisJZGVwZGkJMCwgMzEsIDMyLCAlcjI1
CisJZGVwZGkJMCwgMzEsIDMyLCAlcjI0CisJZGVwZGkJMCwgMzEsIDMyLCAlcjIzCisjZW5kaWYK
KworCS8qIENoZWNrIHRoZSB2YWxpZGl0eSBvZiB0aGUgc2l6ZSBwb2ludGVyICovCisJc3ViaSw+
Pj0gNCwgJXIyMywgJXIwCisJYixuCWx3c19leGl0X25vc3lzCisKKwkvKiBKdW1wIHRvIHRoZSBm
dW5jdGlvbnMgd2hpY2ggd2lsbCBsb2FkIHRoZSBvbGQgYW5kIG5ldyB2YWx1ZXMgaW50bworCSAg
IHJlZ2lzdGVycyBkZXBlbmRpbmcgb24gdGhlIHRoZWlyIHNpemUgKi8KKwlzaGx3CSVyMjMsIDIs
ICVyMjkKKwlibHIJJXIyOSwgJXIwCisJbm9wCisKKwkvKiA4Yml0IGxvYWQgKi8KKzQ6CWxkYgkw
KCVzcjMsJXIyNSksICVyMjUKKwliCWNhczJfbG9ja19zdGFydAorNToJbGRiCTAoJXNyMywlcjI0
KSwgJXIyNAorCW5vcAorCW5vcAorCW5vcAorCW5vcAorCW5vcAorCisJLyogMTZiaXQgbG9hZCAq
LworNjoJbGRoCTAoJXNyMywlcjI1KSwgJXIyNQorCWIJY2FzMl9sb2NrX3N0YXJ0Cis3OglsZGgJ
MCglc3IzLCVyMjQpLCAlcjI0CisJbm9wCisJbm9wCisJbm9wCisJbm9wCisJbm9wCisKKwkvKiAz
MmJpdCBsb2FkICovCis4OglsZHcJMCglc3IzLCVyMjUpLCAlcjI1CisJYgljYXMyX2xvY2tfc3Rh
cnQKKzk6CWxkdwkwKCVzcjMsJXIyNCksICVyMjQKKwlub3AKKwlub3AKKwlub3AKKwlub3AKKwlu
b3AKKworCS8qIDY0Yml0IGxvYWQgKi8KKyNpZmRlZiBDT05GSUdfNjRCSVQKKzEwOglsZGQJMCgl
c3IzLCVyMjUpLCAlcjI1CisxMToJbGRkCTAoJXNyMywlcjI0KSwgJXIyNAorI2Vsc2UKKwkvKiBM
b2FkIG5ldyB2YWx1ZSBpbnRvIHIyMi9yMjMgLSBoaWdoL2xvdyAqLworMTA6CWxkdwkwKCVzcjMs
JXIyNSksICVyMjIKKzExOglsZHcJNCglc3IzLCVyMjUpLCAlcjIzCisJLyogTG9hZCBuZXcgdmFs
dWUgaW50byBmcjQgZm9yIGF0b21pYyBzdG9yZSBsYXRlciAqLworMTI6CWZsZGR4CTAoJXNyMywl
cjI0KSwgJWZyNAorI2VuZGlmCisKK2NhczJfbG9ja19zdGFydDoKKwkvKiBMb2FkIHN0YXJ0IG9m
IGxvY2sgdGFibGUgKi8KKwlsZGlsCUwlbHdzX2xvY2tfc3RhcnQsICVyMjAKKwlsZG8JUiVsd3Nf
bG9ja19zdGFydCglcjIwKSwgJXIyOAorCisJLyogRXh0cmFjdCBmb3VyIGJpdHMgZnJvbSByMjYg
YW5kIGhhc2ggbG9jayAoQml0cyA0LTcpICovCisJZXh0cnUgICVyMjYsIDI3LCA0LCAlcjIwCisK
KwkvKiBGaW5kIGxvY2sgdG8gdXNlLCB0aGUgaGFzaCBpcyBlaXRoZXIgb25lIG9mIDAgdG8KKwkg
ICAxNSwgbXVsdGlwbGllZCBieSAxNiAoa2VlcCBpdCAxNi1ieXRlIGFsaWduZWQpCisJICAgYW5k
IGFkZCB0byB0aGUgbG9jayB0YWJsZSBvZmZzZXQuICovCisJc2hsdwklcjIwLCA0LCAlcjIwCisJ
YWRkCSVyMjAsICVyMjgsICVyMjAKKworCXJzbQlQU1dfU01fSSwgJXIwCQkJCS8qIERpc2FibGUg
aW50ZXJydXB0cyAqLworCS8qIENPVyBicmVha3MgY2FuIGNhdXNlIGNvbnRlbnRpb24gb24gVVAg
c3lzdGVtcyAqLworCUxEQ1cJMCglc3IyLCVyMjApLCAlcjI4CQkJLyogVHJ5IHRvIGFjcXVpcmUg
dGhlIGxvY2sgKi8KKwljbXBiLDw+LG4JJXIwLCAlcjI4LCBjYXMyX2FjdGlvbgkvKiBEaWQgd2Ug
Z2V0IGl0PyAqLworY2FzMl93b3VsZGJsb2NrOgorCWxkbwkyKCVyMCksICVyMjgJCQkJLyogMm5k
IGNhc2UgKi8KKwlzc20JUFNXX1NNX0ksICVyMAorCWIJbHdzX2V4aXQJCQkJLyogQ29udGVuZGVk
Li4uICovCisJbGRvCS1FQUdBSU4oJXIwKSwgJXIyMQkJCS8qIFNwaW4gaW4gdXNlcnNwYWNlICov
CisKKwkvKgorCQlwcmV2ID0gKmFkZHI7CisJCWlmICggcHJldiA9PSBvbGQgKQorCQkgICphZGRy
ID0gbmV3OworCQlyZXR1cm4gcHJldjsKKwkqLworCisJLyogTk9URVM6CisJCVRoaXMgYWxsIHdv
cmtzIGJlY3VzZSBpbnRyX2RvX3NpZ25hbAorCQlhbmQgc2NoZWR1bGUgYm90aCBjaGVjayB0aGUg
cmV0dXJuIGlhc3EKKwkJYW5kIHNlZSB0aGF0IHdlIGFyZSBvbiB0aGUga2VybmVsIHBhZ2UKKwkJ
c28gdGhpcyBwcm9jZXNzIGlzIG5ldmVyIHNjaGVkdWxlZCBvZmYKKwkJb3IgaXMgZXZlciBzZW50
IGFueSBzaWduYWwgb2YgYW55IHNvcnQsCisJCXRodXMgaXQgaXMgd2hvbGx5IGF0b21pYyBmcm9t
IHVzcnNwYWNlcworCQlwZXJzcGVjdGl2ZQorCSovCitjYXMyX2FjdGlvbjoKKwkvKiBKdW1wIHRv
IHRoZSBjb3JyZWN0IGZ1bmN0aW9uICovCisJYmxyCSVyMjksICVyMAorCS8qIFNldCAlcjI4IGFz
IG5vbi16ZXJvIGZvciBub3cgKi8KKwlsZG8JMSglcjApLCVyMjgKKworCS8qIDhiaXQgQ0FTICov
CisxMzoJbGRiLG1hCTAoJXNyMywlcjI2KSwgJXIyOQorCXN1Yiw9CSVyMjksICVyMjUsICVyMAor
CWIsbgljYXMyX2VuZAorMTQ6CXN0YixtYQklcjI0LCAwKCVzcjMsJXIyNikKKwliCWNhczJfZW5k
CisJY29weQklcjAsICVyMjgKKwlub3AKKwlub3AKKworCS8qIDE2Yml0IENBUyAqLworMTU6CWxk
aCxtYQkwKCVzcjMsJXIyNiksICVyMjkKKwlzdWIsPQklcjI5LCAlcjI1LCAlcjAKKwliLG4JY2Fz
Ml9lbmQKKzE2OglzdGgsbWEJJXIyNCwgMCglc3IzLCVyMjYpCisJYgljYXMyX2VuZAorCWNvcHkJ
JXIwLCAlcjI4CisJbm9wCisJbm9wCisKKwkvKiAzMmJpdCBDQVMgKi8KKzE3OglsZHcsbWEJMCgl
c3IzLCVyMjYpLCAlcjI5CisJc3ViLD0JJXIyOSwgJXIyNSwgJXIwCisJYixuCWNhczJfZW5kCisx
ODoJc3R3LG1hCSVyMjQsIDAoJXNyMywlcjI2KQorCWIJY2FzMl9lbmQKKwljb3B5CSVyMCwgJXIy
OAorCW5vcAorCW5vcAorCisJLyogNjRiaXQgQ0FTICovCisjaWZkZWYgQ09ORklHXzY0QklUCisx
OToJbGRkLG1hCTAoJXNyMywlcjI2KSwgJXIyOQorCXN1Yiw9CSVyMjksICVyMjUsICVyMAorCWIs
bgljYXMyX2VuZAorMjA6CXN0ZCxtYQklcjI0LCAwKCVzcjMsJXIyNikKKwljb3B5CSVyMCwgJXIy
OAorI2Vsc2UKKwkvKiBDb21wYXJlIGZpcnN0IHdvcmQgKi8KKzE5OglsZHcsbWEJMCglc3IzLCVy
MjYpLCAlcjI5CisJc3ViLD0JJXIyOSwgJXIyMiwgJXIwCisJYixuCWNhczJfZW5kCisJLyogQ29t
cGFyZSBzZWNvbmQgd29yZCAqLworMjA6CWxkdyxtYQk0KCVzcjMsJXIyNiksICVyMjkKKwlzdWIs
PQklcjI5LCAlcjIzLCAlcjAKKwliLG4JY2FzMl9lbmQKKwkvKiBQZXJmb3JtIHRoZSBzdG9yZSAq
LworMjE6CWZzdGR4CSVmcjQsIDAoJXNyMywlcjI2KQorCWNvcHkJJXIwLCAlcjI4CisjZW5kaWYK
KworY2FzMl9lbmQ6CisJLyogRnJlZSBsb2NrICovCisJc3R3LG1hCSVyMjAsIDAoJXNyMiwlcjIw
KQorCS8qIEVuYWJsZSBpbnRlcnJ1cHRzICovCisJc3NtCVBTV19TTV9JLCAlcjAKKwkvKiBSZXR1
cm4gdG8gdXNlcnNwYWNlLCBzZXQgbm8gZXJyb3IgKi8KKwliCWx3c19leGl0CisJY29weQklcjAs
ICVyMjEKKworMjI6CisJLyogRXJyb3Igb2NjdXJyZWQgb24gbG9hZCBvciBzdG9yZSAqLworCS8q
IEZyZWUgbG9jayAqLworCXN0dwklcjIwLCAwKCVzcjIsJXIyMCkKKwlzc20JUFNXX1NNX0ksICVy
MAorCWxkbwkxKCVyMCksJXIyOAorCWIJbHdzX2V4aXQKKwlsZG8JLUVGQVVMVCglcjApLCVyMjEJ
Lyogc2V0IGVycm5vICovCisJbm9wCisJbm9wCisJbm9wCisKKwkvKiBFeGNlcHRpb24gdGFibGUg
ZW50cmllcywgZm9yIHRoZSBsb2FkIGFuZCBzdG9yZSwgcmV0dXJuIEVGQVVMVC4KKwkgICBFYWNo
IG9mIHRoZSBlbnRyaWVzIG11c3QgYmUgcmVsb2NhdGVkLiAqLworCUFTTV9FWENFUFRJT05UQUJM
RV9FTlRSWSg0Yi1saW51eF9nYXRld2F5X3BhZ2UsIDIyYi1saW51eF9nYXRld2F5X3BhZ2UpCisJ
QVNNX0VYQ0VQVElPTlRBQkxFX0VOVFJZKDViLWxpbnV4X2dhdGV3YXlfcGFnZSwgMjJiLWxpbnV4
X2dhdGV3YXlfcGFnZSkKKwlBU01fRVhDRVBUSU9OVEFCTEVfRU5UUlkoNmItbGludXhfZ2F0ZXdh
eV9wYWdlLCAyMmItbGludXhfZ2F0ZXdheV9wYWdlKQorCUFTTV9FWENFUFRJT05UQUJMRV9FTlRS
WSg3Yi1saW51eF9nYXRld2F5X3BhZ2UsIDIyYi1saW51eF9nYXRld2F5X3BhZ2UpCisJQVNNX0VY
Q0VQVElPTlRBQkxFX0VOVFJZKDhiLWxpbnV4X2dhdGV3YXlfcGFnZSwgMjJiLWxpbnV4X2dhdGV3
YXlfcGFnZSkKKwlBU01fRVhDRVBUSU9OVEFCTEVfRU5UUlkoOWItbGludXhfZ2F0ZXdheV9wYWdl
LCAyMmItbGludXhfZ2F0ZXdheV9wYWdlKQorCUFTTV9FWENFUFRJT05UQUJMRV9FTlRSWSgxMGIt
bGludXhfZ2F0ZXdheV9wYWdlLCAyMmItbGludXhfZ2F0ZXdheV9wYWdlKQorCUFTTV9FWENFUFRJ
T05UQUJMRV9FTlRSWSgxMWItbGludXhfZ2F0ZXdheV9wYWdlLCAyMmItbGludXhfZ2F0ZXdheV9w
YWdlKQorCUFTTV9FWENFUFRJT05UQUJMRV9FTlRSWSgxM2ItbGludXhfZ2F0ZXdheV9wYWdlLCAy
MmItbGludXhfZ2F0ZXdheV9wYWdlKQorCUFTTV9FWENFUFRJT05UQUJMRV9FTlRSWSgxNGItbGlu
dXhfZ2F0ZXdheV9wYWdlLCAyMmItbGludXhfZ2F0ZXdheV9wYWdlKQorCUFTTV9FWENFUFRJT05U
QUJMRV9FTlRSWSgxNWItbGludXhfZ2F0ZXdheV9wYWdlLCAyMmItbGludXhfZ2F0ZXdheV9wYWdl
KQorCUFTTV9FWENFUFRJT05UQUJMRV9FTlRSWSgxNmItbGludXhfZ2F0ZXdheV9wYWdlLCAyMmIt
bGludXhfZ2F0ZXdheV9wYWdlKQorCUFTTV9FWENFUFRJT05UQUJMRV9FTlRSWSgxN2ItbGludXhf
Z2F0ZXdheV9wYWdlLCAyMmItbGludXhfZ2F0ZXdheV9wYWdlKQorCUFTTV9FWENFUFRJT05UQUJM
RV9FTlRSWSgxOGItbGludXhfZ2F0ZXdheV9wYWdlLCAyMmItbGludXhfZ2F0ZXdheV9wYWdlKQor
CUFTTV9FWENFUFRJT05UQUJMRV9FTlRSWSgxOWItbGludXhfZ2F0ZXdheV9wYWdlLCAyMmItbGlu
dXhfZ2F0ZXdheV9wYWdlKQorCUFTTV9FWENFUFRJT05UQUJMRV9FTlRSWSgyMGItbGludXhfZ2F0
ZXdheV9wYWdlLCAyMmItbGludXhfZ2F0ZXdheV9wYWdlKQorI2lmbmRlZiBDT05GSUdfNjRCSVQK
KwlBU01fRVhDRVBUSU9OVEFCTEVfRU5UUlkoMTJiLWxpbnV4X2dhdGV3YXlfcGFnZSwgMjJiLWxp
bnV4X2dhdGV3YXlfcGFnZSkKKwlBU01fRVhDRVBUSU9OVEFCTEVfRU5UUlkoMjFiLWxpbnV4X2dh
dGV3YXlfcGFnZSwgMjJiLWxpbnV4X2dhdGV3YXlfcGFnZSkKKyNlbmRpZgorCiAJLyogTWFrZSBz
dXJlIG5vdGhpbmcgZWxzZSBpcyBwbGFjZWQgb24gdGhpcyBwYWdlICovCiAJLmFsaWduIFBBR0Vf
U0laRQogRU5EKGxpbnV4X2dhdGV3YXlfcGFnZSkKQEAgLTY3NSw4ICs5MDgsOSBAQCBFTlRSWShl
bmRfbGludXhfZ2F0ZXdheV9wYWdlKQogCS8qIExpZ2h0LXdlaWdodC1zeXNjYWxsIHRhYmxlICov
CiAJLyogU3RhcnQgb2YgbHdzIHRhYmxlLiAqLwogRU5UUlkobHdzX3RhYmxlKQotCUxXU19FTlRS
WShjb21wYXJlX2FuZF9zd2FwMzIpCS8qIDAgLSBFTEYzMiBBdG9taWMgY29tcGFyZSBhbmQgc3dh
cCAqLwotCUxXU19FTlRSWShjb21wYXJlX2FuZF9zd2FwNjQpCS8qIDEgLSBFTEY2NCBBdG9taWMg
Y29tcGFyZSBhbmQgc3dhcCAqLworCUxXU19FTlRSWShjb21wYXJlX2FuZF9zd2FwMzIpCQkvKiAw
IC0gRUxGMzIgQXRvbWljIDMyYml0IGNvbXBhcmUgYW5kIHN3YXAgKi8KKwlMV1NfRU5UUlkoY29t
cGFyZV9hbmRfc3dhcDY0KQkJLyogMSAtIEVMRjY0IEF0b21pYyAzMmJpdCBjb21wYXJlIGFuZCBz
d2FwICovCisJTFdTX0VOVFJZKGNvbXBhcmVfYW5kX3N3YXBfMikJCS8qIDIgLSBFTEYzMiBBdG9t
aWMgNjRiaXQgY29tcGFyZSBhbmQgc3dhcCAqLwogRU5EKGx3c190YWJsZSkKIAkvKiBFbmQgb2Yg
bHdzIHRhYmxlICovCiAK
--=_a65a2effa8fc3e62c5634e2c4e423ad1--


