From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: back to glibc-2.3.3 & gcc-3.4.1 pb
Date: Mon, 06 Sep 2004 21:49:19 +0000
Message-ID: <413CDB5F.3080705@tiscali.be>
References: <200409060239.i862dAh2001466@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409060239.i862dAh2001466@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Dave,

John David Anglin wrote:
>>     0x411cc740 <_dl_make_fptr+112>: ldw,s r7(,r6),ret0
>>in:
>>r7 == 0x7c4
>>r6 == 0x0
> 
> 
> r6 is wrong.  Find out why it is zero.
> 
Far from being an expert, with help of ddd it seems that:
ElfW(Addr)
_dl_make_fptr (struct link_map *map, const ElfW(Sym) *sym,
                ElfW(Addr) ip)
{
   ElfW(Addr) *ftab = map->l_mach.fptr_table;	<====[2]

(Elf32_Addr *)fptr_table == (Elf32_Addr *) 0x0

(the same for gcc-3.3 ;) )

is:
Dump of assembler code from 0x411e371c to 0x411e381c:
     0x411e371c <_dl_make_fptr+76>:  ldw 1fc(,r26),r6 (r6 == 0x0)

the weird stuff his in fact here:

   if (__builtin_expect (ftab == NULL, 0))
     ftab = make_fptr_table (map);

with gcc-3.3 the register (r7) (which seems to me contains the value pointed by ftab) is well the one addressed by 
map->l_mach.fptr_table ie map->l_mach.fptr_table == 0x40001000 (and btw map->l_mach.fptr_table_len == 2067)

OTC with gcc-3.4 the register (r6) after the 'call' of the inlined make_fptr_table() is restored to its starting value i.e.: 0x0
eventhought that map->l_mach.fptr_table == 0x40001000 (and btw map->l_mach.fptr_table_len == 2067) exactly the same as gcc-3.3.

duno if it could help:
for gcc-3.3 the text is:
Dump of assembler code from 0x412630d0 to 0x412631d0:
     0x412630d0 <_dl_make_fptr+44>:  ldw 1fc(,r26),r7	<====[2]
     0x412630d4 <_dl_make_fptr+48>:  copy r26,r8
     0x412630d8 <_dl_make_fptr+52>:  cmpib,= 0,r7,0x412631a0 <_dl_make_fptr+252>	<===='call' make_fptr_table()
     0x412630dc <_dl_make_fptr+56>:  copy r25,r3
     0x412630e0 <_dl_make_fptr+60>:  ldw 30(,r8),r20
     0x412630e4 <_dl_make_fptr+64>:  ldw 1f8(,r8),r22
     0x412630e8 <_dl_make_fptr+68>:  ldw 4(,r20),r21
     0x412630ec <_dl_make_fptr+72>:  sub r3,r21,r21
     0x412630f0 <_dl_make_fptr+76>:  extrw,s r21,27,28,r21
     0x412630f4 <_dl_make_fptr+80>:  cmpb,<<= r22,r21,0x41263184 <_dl_make_fptr+224>
     0x412630f8 <_dl_make_fptr+84>:  depw,z r21,29,30,r9
     0x412630fc <_dl_make_fptr+88>:  add,l r9,r7,r21
     0x41263100 <_dl_make_fptr+92>:  ldw 0(,r21),r20
     0x41263104 <_dl_make_fptr+96>:  cmpib,<> 0,r20,0x41263150 <_dl_make_fptr+172>
     0x41263108 <_dl_make_fptr+100>: copy r21,r3
     0x4126310c <_dl_make_fptr+104>: copy r21,r6
     0x41263110 <_dl_make_fptr+108>: addil 0,r19,%r1
     0x41263114 <_dl_make_fptr+112>: ldw 5dc(,r1),r5
     0x41263118 <_dl_make_fptr+116>: ldw 24(,r8),r20
     0x4126311c <_dl_make_fptr+120>: copy r19,r4
     0x41263120 <_dl_make_fptr+124>: copy r10,r26
     0x41263124 <_dl_make_fptr+128>: b,l 0x41262fc4 <make_fdesc>,rp
     0x41263128 <_dl_make_fptr+132>: ldw 4(,r20),r25
     0x4126312c <_dl_make_fptr+136>: ldw 0(,r3),r20
     0x41263130 <_dl_make_fptr+140>: cmpib,= 0,r20,0x4126317c <_dl_make_fptr+216>
     0x41263134 <_dl_make_fptr+144>: copy r4,r19
     0x41263138 <_dl_make_fptr+148>: ldw 4(,r5),r20
     0x4126313c <_dl_make_fptr+152>: stw r20,0(,ret0)
     0x41263140 <_dl_make_fptr+156>: stw ret0,4(,r5)
     0x41263144 <_dl_make_fptr+160>: ldw 0(,r6),r20
     0x41263148 <_dl_make_fptr+164>: cmpib,=,n 0,r20,0x4126311c <_dl_make_fptr+120>
     0x4126314c <_dl_make_fptr+168>: ldw 24(,r8),r20
     0x41263150 <_dl_make_fptr+172>: ldw r7(,r9),ret0
     0x41263154 <_dl_make_fptr+176>: ldw -94(,sp),rp
     0x41263158 <_dl_make_fptr+180>: ldw -7c(,sp),r9
     0x4126315c <_dl_make_fptr+184>: ldw -78(,sp),r8
     0x41263160 <_dl_make_fptr+188>: ldw -74(,sp),r7
     0x41263164 <_dl_make_fptr+192>: ldw -70(,sp),r6
     0x41263168 <_dl_make_fptr+196>: ldw -6c(,sp),r5
     0x4126316c <_dl_make_fptr+200>: ldw -68(,sp),r4
     0x41263170 <_dl_make_fptr+204>: ldw -64(,sp),r3
     0x41263174 <_dl_make_fptr+208>: bv r0(rp)
     0x41263178 <_dl_make_fptr+212>: ldw,mb -80(,sp),r10
     0x4126317c <_dl_make_fptr+216>: b,l 0x41263150 <_dl_make_fptr+172>,r0
     0x41263180 <_dl_make_fptr+220>: stw ret0,0(,r3)
     0x41263184 <_dl_make_fptr+224>: addil 0,r19,%r1
     0x41263188 <_dl_make_fptr+228>: ldi 0,r26
     0x4126318c <_dl_make_fptr+232>: ldw 5e4(,r1),r1
     0x41263190 <_dl_make_fptr+236>: copy r1,r23
     0x41263194 <_dl_make_fptr+240>: ldi 0,r25
     0x41263198 <_dl_make_fptr+244>: b,l 0x4125e4f8 <_dl_signal_error>,rp
     0x4126319c <_dl_make_fptr+248>: ldi 0,r24
     0x412631a0 <_dl_make_fptr+252>: ldw 2c(,r26),r21		<==== map->l_mach.fptr_table()
     0x412631a4 <_dl_make_fptr+256>: ldw 30(,r26),r20
     0x412631a8 <_dl_make_fptr+260>: addil 0,r19,%r1
     0x412631ac <_dl_make_fptr+264>: copy r19,r4
     0x412631b0 <_dl_make_fptr+268>: ldw 4(,r20),r22
     0x412631b4 <_dl_make_fptr+272>: ldw 4(,r21),r26
     0x412631b8 <_dl_make_fptr+276>: ldi 3,r24
     0x412631bc <_dl_make_fptr+280>: ldi 12,r23
     0x412631c0 <_dl_make_fptr+284>: ldw 44(,r8),r21
     0x412631c4 <_dl_make_fptr+288>: sub r26,r22,r26
     0x412631c8 <_dl_make_fptr+292>: ldw 654(,r1),r1
     0x412631cc <_dl_make_fptr+296>: ldw 4(,r21),r25
     0x412631d0 <_dl_make_fptr+300>: ldw 4(,r1),r20
     0x412631d4 <_dl_make_fptr+304>: ldi -1,r21
     0x412631d8 <_dl_make_fptr+308>: b,l 0x41265570 <$$divU>,r31
     0x412631dc <_dl_make_fptr+312>: sub r0,r20,r22
     0x412631e0 <_dl_make_fptr+316>: stw r21,-34(,sp)
     0x412631e4 <_dl_make_fptr+320>: ldi 0,r26
     0x412631e8 <_dl_make_fptr+324>: depw,z ret1,29,30,r5
     0x412631ec <_dl_make_fptr+328>: stw r0,-38(,sp)
     0x412631f0 <_dl_make_fptr+332>: copy ret1,r6
     0x412631f4 <_dl_make_fptr+336>: add,l r5,r20,r20
     0x412631f8 <_dl_make_fptr+340>: add,l r20,r21,r20
     0x412631fc <_dl_make_fptr+344>: and r20,r22,r20
     0x41263200 <_dl_make_fptr+348>: b,l 0x412641bc <__mmap>,rp
     0x41263204 <_dl_make_fptr+352>: copy r20,r25
     0x41263208 <_dl_make_fptr+356>: copy r4,r19
     0x4126320c <_dl_make_fptr+360>: cmpib,= -1,ret0,0x4126323c <_dl_make_fptr+408>
     0x41263210 <_dl_make_fptr+364>: copy ret0,r26
     0x41263214 <_dl_make_fptr+368>: ldw 1fc(,r8),r20
     0x41263218 <_dl_make_fptr+372>: cmpib,<>,n 0,r20,0x4126322c <_dl_make_fptr+392>
     0x4126321c <_dl_make_fptr+376>: stw ret0,1fc(,r8)
     0x41263220 <_dl_make_fptr+380>: stw r6,1f8(,r8)
     0x41263224 <_dl_make_fptr+384>: b,l 0x412630e0 <_dl_make_fptr+60>,r0
     0x41263228 <_dl_make_fptr+388>: ldw 1fc(,r8),r7	<==== return map->l_mach.fptr_table;
     0x4126322c <_dl_make_fptr+392>: b,l 0x4126421c <munmap>,rp
     0x41263230 <_dl_make_fptr+396>: copy r5,r25
     0x41263234 <_dl_make_fptr+400>: b,l 0x41263224 <_dl_make_fptr+384>,r0
     0x41263238 <_dl_make_fptr+404>: copy r4,r19
     0x4126323c <_dl_make_fptr+408>: addil 0,r4,%r1
     0x41263240 <_dl_make_fptr+412>: copy r1,r20
     0x41263244 <_dl_make_fptr+416>: ldw 62c(,r20),r20
     0x41263248 <_dl_make_fptr+420>: ldw 0(,r20),r26
     0x4126324c <_dl_make_fptr+424>: addil 0,r4,%r1
     0x41263250 <_dl_make_fptr+428>: ldw 5e8(,r1),r21
     0x41263254 <_dl_make_fptr+432>: b,l 0x41263194 <_dl_make_fptr+240>,r0
     0x41263258 <_dl_make_fptr+436>: copy r21,r23
  [...]

and for gcc-3.4:
Dump of assembler code from 0x4128571c to 0x4128581c:
     0x4128571c <_dl_make_fptr+76>:  ldw 1fc(,r26),r6	<====[2]
     0x41285720 <_dl_make_fptr+80>:  cmpib,= 0,r6,0x412858f4 <_dl_make_fptr+548>	<===='call' make_fptr_table()
     0x41285724 <_dl_make_fptr+84>:  copy r25,r3
     0x41285728 <_dl_make_fptr+88>:  ldw 1f8(,r26),ret1
     0x4128572c <_dl_make_fptr+92>:  ldw 30(,r10),r21
     0x41285730 <_dl_make_fptr+96>:  ldw 4(,r21),r20
     0x41285734 <_dl_make_fptr+100>: sub r3,r20,r20
     0x41285738 <_dl_make_fptr+104>: extrw,s r20,27,28,r7
     0x4128573c <_dl_make_fptr+108>: cmpb,>>=,n r7,ret1,0x412859d0 <_dl_make_fptr+768>
     0x41285740 <_dl_make_fptr+112>: ldw,s r7(,r6),ret0
     0x41285744 <_dl_make_fptr+116>: cmpib,<> 0,ret0,0x412857c8 <_dl_make_fptr+248>
     0x41285748 <_dl_make_fptr+120>: addil 0,r19,%r1
     0x4128574c <_dl_make_fptr+124>: depw,z r7,29,30,r11
     0x41285750 <_dl_make_fptr+128>: ldw 638(,r1),r13
     0x41285754 <_dl_make_fptr+132>: addil 0,r19,%r1
     0x41285758 <_dl_make_fptr+136>: ldw 5c0(,r1),r5
     0x4128575c <_dl_make_fptr+140>: addil 0,r19,%r1
     0x41285760 <_dl_make_fptr+144>: ldo -78(sp),r14
     0x41285764 <_dl_make_fptr+148>: ldw 610(,r1),r16
     0x41285768 <_dl_make_fptr+152>: add,l r11,r6,r15
     0x4128576c <_dl_make_fptr+156>: copy r5,r9
     0x41285770 <_dl_make_fptr+160>: ldw 24(,r10),r20
     0x41285774 <_dl_make_fptr+164>: ldw 4(,r20),r8
     0x41285778 <_dl_make_fptr+168>: ldw 0(,r5),r3
     0x4128577c <_dl_make_fptr+172>: ldw 4(,r3),r23
     0x41285780 <_dl_make_fptr+176>: ldw 8(,r3),r20
     0x41285784 <_dl_make_fptr+180>: cmpb,>>= r20,r23,0x4128580c <_dl_make_fptr+316>
     0x41285788 <_dl_make_fptr+184>: ldo 1(r20),r22
     0x4128578c <_dl_make_fptr+188>: ldw 8(,r3),r21
     0x41285790 <_dl_make_fptr+192>: cmpb,<> r20,r21,0x41285780 <_dl_make_fptr+176>
     0x41285794 <_dl_make_fptr+196>: shladd,l r21,3,r3,r20
     0x41285798 <_dl_make_fptr+200>: stw r22,8(,r3)
     0x4128579c <_dl_make_fptr+204>: ldo c(r20),r26
     0x412857a0 <_dl_make_fptr+208>: stw r8,4(,r26)
     0x412857a4 <_dl_make_fptr+212>: stw r12,0(,r26)
     0x412857a8 <_dl_make_fptr+216>: ldw r11(,r6),r20
     0x412857ac <_dl_make_fptr+220>: cmpib,=,n 0,r20,0x412858a8 <_dl_make_fptr+472>
     0x412857b0 <_dl_make_fptr+224>: ldw 4(,r9),r20
     0x412857b4 <_dl_make_fptr+228>: stw r20,0(,r26)
     0x412857b8 <_dl_make_fptr+232>: stw r26,4(,r9)
     0x412857bc <_dl_make_fptr+236>: ldw,s r7(,r6),ret0
     0x412857c0 <_dl_make_fptr+240>: cmpib,=,n 0,ret0,0x41285774 <_dl_make_fptr+164>
     0x412857c4 <_dl_make_fptr+244>: ldw 24(,r10),r20
     0x412857c8 <_dl_make_fptr+248>: ldw -94(,sp),rp
     0x412857cc <_dl_make_fptr+252>: ldw -74(,sp),r16
     0x412857d0 <_dl_make_fptr+256>: ldw -70(,sp),r15
     0x412857d4 <_dl_make_fptr+260>: ldw -6c(,sp),r14
     0x412857d8 <_dl_make_fptr+264>: ldw -68(,sp),r13
     0x412857dc <_dl_make_fptr+268>: ldw -64(,sp),r12
     0x412857e0 <_dl_make_fptr+272>: ldw -60(,sp),r11
     0x412857e4 <_dl_make_fptr+276>: ldw -5c(,sp),r10
     0x412857e8 <_dl_make_fptr+280>: ldw -58(,sp),r9
     0x412857ec <_dl_make_fptr+284>: ldw -54(,sp),r8
     0x412857f0 <_dl_make_fptr+288>: ldw -50(,sp),r7
     0x412857f4 <_dl_make_fptr+292>: ldw -4c(,sp),r6
     0x412857f8 <_dl_make_fptr+296>: ldw -48(,sp),r5
     0x412857fc <_dl_make_fptr+300>: ldw -44(,sp),r4
     0x41285800 <_dl_make_fptr+304>: ldw -40(,sp),r3
     0x41285804 <_dl_make_fptr+308>: bv r0(rp)
     0x41285808 <_dl_make_fptr+312>: ldo -80(sp),sp
     0x4128580c <_dl_make_fptr+316>: ldw 4(,r5),r20
     0x41285810 <_dl_make_fptr+320>: cmpib,<>,n 0,r20,0x41285984 <_dl_make_fptr+692>
     0x41285814 <_dl_make_fptr+324>: ldw 8(,r5),r21
     0x41285818 <_dl_make_fptr+328>: depw,z r21,30,31,r20

Dump of assembler code from 0x412858f4 to 0x412859f4:
     0x412858f4 <_dl_make_fptr+548>: ldw 30(,r26),r20	<==== map->l_mach.fptr_table()
     0x412858f8 <_dl_make_fptr+552>: ldw 4(,r20),r21
     0x412858fc <_dl_make_fptr+556>: addil 0,r19,%r1
     0x41285900 <_dl_make_fptr+560>: copy r1,r22
     0x41285904 <_dl_make_fptr+564>: ldw 2c(,r26),r20
     0x41285908 <_dl_make_fptr+568>: ldw 4(,r20),r26
     0x4128590c <_dl_make_fptr+572>: sub r26,r21,r26
     0x41285910 <_dl_make_fptr+576>: ldw 44(,r10),r20
     0x41285914 <_dl_make_fptr+580>: ldw 4(,r20),r25
     0x41285918 <_dl_make_fptr+584>: b,l 0x41287d60 <$$divU>,r31
     0x4128591c <_dl_make_fptr+588>: copy r19,r4
     0x41285920 <_dl_make_fptr+592>: ldi -1,r20
     0x41285924 <_dl_make_fptr+596>: stw r20,-34(,sp)
     0x41285928 <_dl_make_fptr+600>: ldi 0,r26
     0x4128592c <_dl_make_fptr+604>: ldw 638(,r22),r20
     0x41285930 <_dl_make_fptr+608>: ldw 4(,r20),r25
     0x41285934 <_dl_make_fptr+612>: depw,z ret1,29,30,r5
     0x41285938 <_dl_make_fptr+616>: ldi 3,r24
     0x4128593c <_dl_make_fptr+620>: sub r0,r25,r20
     0x41285940 <_dl_make_fptr+624>: copy ret1,r6
     0x41285944 <_dl_make_fptr+628>: stw r0,-38(,sp)
     0x41285948 <_dl_make_fptr+632>: add,l r5,r25,r25
     0x4128594c <_dl_make_fptr+636>: ldi 12,r23
     0x41285950 <_dl_make_fptr+640>: ldo -1(r25),r25
     0x41285954 <_dl_make_fptr+644>: b,l 0x412869a8 <__mmap>,rp
     0x41285958 <_dl_make_fptr+648>: and r25,r20,r25
     0x4128595c <_dl_make_fptr+652>: copy r4,r19
     0x41285960 <_dl_make_fptr+656>: cmpib,= -1,ret0,0x412859e0 <_dl_make_fptr+784>
     0x41285964 <_dl_make_fptr+660>: copy ret0,r26
     0x41285968 <_dl_make_fptr+664>: ldw 1fc(,r10),r20
     0x4128596c <_dl_make_fptr+668>: cmpib,<>,n 0,r20,0x412859a0 <_dl_make_fptr+720>
     0x41285970 <_dl_make_fptr+672>: copy r6,ret1
     0x41285974 <_dl_make_fptr+676>: stw r6,1f8(,r10)
     0x41285978 <_dl_make_fptr+680>: ldw 1fc(,r10),r6
     0x4128597c <_dl_make_fptr+684>: b,l 0x4128572c <_dl_make_fptr+92>,r0
     0x41285980 <_dl_make_fptr+688>: stw ret0,1fc(,r10)	<==== return map->l_mach.fptr_table;
     0x41285984 <_dl_make_fptr+692>: copy r20,r26
     0x41285988 <_dl_make_fptr+696>: ldw 0(,r20),r20
     0x4128598c <_dl_make_fptr+700>: b,l 0x412857a0 <_dl_make_fptr+208>,r0
     0x41285990 <_dl_make_fptr+704>: stw r20,4(,r5)
     0x41285994 <_dl_make_fptr+708>: stw ret0,0(,r5)
     0x41285998 <_dl_make_fptr+712>: b,l 0x412857a0 <_dl_make_fptr+208>,r0
     0x4128599c <_dl_make_fptr+716>: ldo c(ret0),r26
     0x412859a0 <_dl_make_fptr+720>: b,l 0x41286a04 <munmap>,rp
     0x412859a4 <_dl_make_fptr+724>: copy r5,r25
     0x412859a8 <_dl_make_fptr+728>: ldw 1f8(,r10),ret1
     0x412859ac <_dl_make_fptr+732>: ldw 1fc(,r10),r6
     0x412859b0 <_dl_make_fptr+736>: b,l 0x4128572c <_dl_make_fptr+92>,r0
     0x412859b4 <_dl_make_fptr+740>: copy r4,r19
     0x412859b8 <_dl_make_fptr+744>: addil 0,r4,%r1
     0x412859bc <_dl_make_fptr+748>: ldw 0(,r16),r26
     0x412859c0 <_dl_make_fptr+752>: ldw 5c4(,r1),r23
     0x412859c4 <_dl_make_fptr+756>: ldi 0,r25
     0x412859c8 <_dl_make_fptr+760>: b,l 0x41280f10 <_dl_signal_error>,rp
     0x412859cc <_dl_make_fptr+764>: ldi 0,r24
     0x412859d0 <_dl_make_fptr+768>: addil 0,r19,%r1
     0x412859d4 <_dl_make_fptr+772>: ldi 0,r26
     0x412859d8 <_dl_make_fptr+776>: b,l 0x412859c4 <_dl_make_fptr+756>,r0
     0x412859dc <_dl_make_fptr+780>: ldw 5c8(,r1),r23
     0x412859e0 <_dl_make_fptr+784>: addil 0,r4,%r1
     0x412859e4 <_dl_make_fptr+788>: ldw 610(,r1),r20
     0x412859e8 <_dl_make_fptr+792>: ldw 0(,r20),r26
     0x412859ec <_dl_make_fptr+796>: addil 0,r4,%r1
     0x412859f0 <_dl_make_fptr+800>: b,l 0x412859c4 <_dl_make_fptr+756>,r0
End of assembler dump.

I have to thought more on how to create a test case (all advise is always well come :) )

Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
