Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA20605
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Nov 2000 08:40:23 -0700
Received: from sleepie.demon.co.uk (HELO rhirst.linuxcare.com) (194.222.23.208)
  by mailserv2.iuinc.com with SMTP; 17 Nov 2000 15:42:29 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 0BD92B007; Fri, 17 Nov 2000 15:39:55 +0000 (GMT)
Date: Fri, 17 Nov 2000 15:39:55 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001117153954.H32715@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] SEGV signal handling bug (dynamic linking)
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  Don't know if anyone expects this to work yet or not, but:

------------------------- cut -----------------------------
#include <sys/ptrace.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>
#include <sys/mman.h>

char *mem;

void sig_handler(int sig)
{
        int res;

        printf("Trapped!!!\n");
        res = mprotect(mem, 4096, PROT_READ|PROT_WRITE);
        if (res < 0) {
                perror("mprotect");
                exit(1);
        }
}


void install_handlers(void)
{
        struct sigaction act;

        memset(&act, 0, sizeof(act));
        act.sa_handler = sig_handler;
        sigaction(SIGSEGV, &act, NULL);
}

int main(int argc, char **argv)
{
        int res;

        mem = malloc(8192);
        if (mem == NULL) {
                perror("malloc");
                exit(1);
        }
        mem = (char *)(((int)mem + 4095) & ~0x0fff);
        res = mprotect(mem, 4096, PROT_READ);
        if (res < 0) {
                perror("mprotect");
                exit(1);
        }
        install_handlers();
        write(1, "Going\n", 6);
        mem[24] = 17;
        write(1, "Gone\n", 5);
        return 0;
}
------------------------- cut -----------------------------

generates:

Going
Bus error

plus the following on the console:

do_page_fault() pid=167 command='ch'

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001011
r0-3     00000000 fffff000 0000166f 00002944
r4-7     40138c38 2001fd8c 00002852 00000001
r8-11    00002862 0008b010 0009c290 0009cbf0
r12-15   00000000 00000000 0009cb50 00000000
r16-19   00000000 00000001 0000b71b 00000011
r20-23   00004000 40041fcc 40041fcc 00000008
r24-27   00000006 00001000 00000001 0000280c
r28-31   00000006 00000020 20020140 40041fd7
sr0-4    00000000 00000003 00000000 0000000a
sr4-8    0000000a 0000000a 0000000a 0000000a

IASQ: 0000000a 0000000a IAOQ: 0000167b 0000167f
 IIR: 6293002e    ISR: 0000000a  IOR: 00004017
ORIG_R28: 00002880
!!die_if_kernel: ch(167): Unaligned data reference 28

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000011001111111100001011
r0-3     00000000 fffff000 20020140 00002944
r4-7     40138c38 2001fd8c 00002852 00000001
r8-11    00002862 0008b010 0009c290 0009cbf0
r12-15   00000000 00000000 0009cb50 00000000
r16-19   00000000 00000001 0000b71b 00000000
r20-23   0000289f 40041fcc 40041fcc 00000008
r24-27   200201d0 20020150 0000000b 0000280c
r28-31   00000006 00000020 200203c0 40041fd7
sr0-4    00000000 00000003 00000000 0000000a
sr4-8    0000000a 0000000a 0000000a 0000000a

IASQ: 0000000a 0000000a IAOQ: 0000289b 0000289b
 IIR: 0e801096    ISR: 0000000a  IOR: 0000289f
ORIG_R28: 00002880


The first do_page_fault() is fine, it is the 'mem[24] = 17' line,
but the second isn't.  The corresponding code is at the end of
.plt:

    2898:       0e 80 10 96     ldw  0(sr0,r20),r22
    289c:       ea c0 c0 00     bv r0(r22)
    28a0:       0e 88 10 95     ldw  4(sr0,r20),r21
    28a4:       ea 9f 1f dd     b,l 2898 <__DTOR_END__+0x74>,r20
    28a8:       d6 80 1c 1e     depwi 0,31,2,r20
    28ac:       00 c0 ff ee     #  c0ffee
    28b0:       de ad be ef     #deadbeef


However, if I make it statically linked, it works fine, giving:

Going
Trapped!!!
Gone

Richard
