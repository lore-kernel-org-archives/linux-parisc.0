Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA22882
	for <parisc-linux@puffin.external.hp.com>; Wed, 4 Oct 2000 08:55:39 -0600
Received: from user32-143.jakinternet.co.uk (HELO rhirst.linuxcare.com) (@212.41.32.143)
  by mailserv2.iuinc.com with SMTP; 4 Oct 2000 14:56:35 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id D2B10B005; Wed,  4 Oct 2000 15:54:38 +0100 (BST)
Date: Wed, 4 Oct 2000 15:54:38 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001004155438.D27981@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] ret_from_kernel_thread incomplete
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  Some scsi drivers create a kernel thread for error handling.  If
such a driver is build as a module, then when the module is unloaded
you get something like:

10:~# rmmod lasi7xx_mod
break 0,0: pid=100 command='scsi_eh_0'
scsi_eh_0[100]: Breakpoint 0

PSW  : 0004010b  GR 1 : c022c000  GR 2 : c0104c48  GR 3 : c7834000  
GR 4 : c7f241c0  GR 5 : c7f241c0  GR 6 : c7968000  GR 7 : c7834840  
GR 8 : c7834694  GR 9 : 00000000  GR10 : c8815000  GR11 : c8815000  
GR12 : c880d000  GR13 : c7825000  GR14 : c7834548  GR15 : 00000001  
GR16 : 000927f8  GR17 : 00000001  GR18 : 20020128  GR19 : 00000001  
GR20 : 00000020  GR21 : c022c264  GR22 : 0000001a  GR23 : c7968000  
GR24 : 0000000a  GR25 : c7834758  GR26 : c78346a4  GR27 : c0218000  
GR28 : c7834000  GR29 : c783469c  GR30 : c7968740  GR31 : 00000002  
SR0  : 00000000  SR1  : 00002002  SR2  : 00000000  SR3  : 00002002  
SR4  : 00000000  SR5  : 00000000  SR6  : 00000000  SR7  : 00000000  

IASQ : 00000000 00000000 IAOQ : c0104c48 c0104c4c ORIG_R28 : c7f241c0
 IIR : 00000000 ISR : 00000000 IOR : c79685ac

scsi : 0 hosts.
10:~# 

c0104c48 corresponds to

        .word   0       /* FIXME */

round about line 521 of arch/parisc/kernel/entry.S

Richard
