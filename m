From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] C240 and Linux 2.6.x
Date: Wed, 5 Jan 2005 10:17:20 -0700
Message-ID: <20050105171720.GB24439@colo.lackof.org>
References: <20041230231420.GA15674@nilpferd.asyl>
	<41D553CB.6070802@tiscali.be>
	<20041231174649.GA21212@nilpferd.asyl>
	<20041231212330.GB23592@colo.lackof.org>
	<20050103181334.GB21212@nilpferd.asyl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Alexander Bartolich <alexander.bartolich@gmx.at>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050103181334.GB21212@nilpferd.asyl>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jan 03, 2005 at 07:13:34PM +0100, Alexander Bartolich wrote:
> I fetched palinux-b180-defconfig-2.6.10-pa2_0-2_all.deb from
> http://cvs.parisc-linux.org/download/linux-2.6/autobuild/b180_defconfig/
> and build a nice vmlinux-2.6.10-pa2.
...

> Linux Tulip driver version 1.1.13 (May 11, 2002)
...
> Kernel Fault: Code=26 regs=11474480 (Addr=00000004)
...
>  IAOQ[0]: tulip_init_one+0x23c/0xdc0
>  IAOQ[1]: tulip_init_one+0x240/0xdc0
>  RP(r2): tulip_init_one+0x21c/0xdc0

The code in question is:
...
103eb100:       34 17 00 40     ldi 20,r23
103eb104:       2b 78 e0 00     addil f1000,dp,%r1
103eb108:       34 1a 00 00     ldi 0,r26
103eb10c:       48 33 01 60     ldw b0(,r1),r19
103eb110:       34 f8 04 60     ldo 230(r7),r24
103eb114:       91 00 20 00     cmpiclr,= 0,r8,r0
103eb118:       08 0f 02 5a     copy r15,r26
103eb11c:       34 19 14 00     ldi a00,r25
103eb120:       0e 68 10 96     ldw 4(,r19),r22		<== Fault
103eb124:       e6 c0 20 00     be,l 0(sr4,r22),%sr0,%r31
103eb128:       08 1f 02 42     copy r31,rp
103eb12c:       87 80 2c 50     cmpib,= 0,ret0,103eb75c <tulip_init_one+0x878>
103eb130:       0d 7c 12 90     stw ret0,8(,r11)
103eb134:       49 73 00 20     ldw 10(,r11),r19
103eb138:       37 94 10 00     ldo 800(ret0),r20

"103eb124: be,l" is an indirect function call.
The fault occurs when the function pointer is loaded.
This means the function table pointer (R19) hasn't been initialized.

I'm still trying to track down which indirection function this is.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
