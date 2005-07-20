From: Kurt Fitzner <kfitzner@excelcia.org>
Subject: Re: [parisc-linux] Machine hanging during high-traffic NFS
Date: Wed, 20 Jul 2005 00:59:42 -0600
Message-ID: <42DDF65E.7010605@excelcia.org>
References: <42DD6A7F.8090706@excelcia.org>
	<20050720010425.GC24060@roadwarrior.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <20050720010425.GC24060@roadwarrior.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Kyle McMartin wrote:

> TOC dump, IIR, IOAQ/IASQ locations? Come on people... It's really hard
> to even begin to figure out what's wrong if no debugging information
> has been provided...
> 
> http://www.parisc-linux.org/faq/kernelbug-howto.html

I apologize - I had not seen that page before.  I should have done more
research myself before reporting the issue.

There is no console output prior to the hang, and no kernel fault to
obtain the IAOQ/IASQ information from.  I did perform a TOC.  The data
from that is below.

If there is any further information that might help, please let me know.

	Kurt.


Information about the machine/kernel:
- Kernel 2.6.12-pa2
- Compiled with gcc 3.3.5 (Debian 1:3.3.5-13), Binutils 2.15-6
- B132L w/ 3COM 3c905 ethernet card
- System map at http://www.excelcia.org/~kfitzner/System.map-2.6.12
- Kernel config at http://www.excelcia.org/~kfitzner/config-2.6.12

Output of "ser pim toc":
General Registers 0 - 31
 0 -  3  0x00000000  0x10000000  0x101e3910  0x00000000
 4 -  7  0x1389a14c  0x1389a034  0x105fcf60  0x1389a108
 8 - 11  0x00000000  0x1389a14c  0x00000200  0x15273720
12 - 15  0x00000200  0x00000200  0x00000200  0x00000000
16 - 19  0x14502640  0x10428768  0x00000001  0x000280ca
20 - 23  0x17468122  0x000280ca  0x00000015  0x00000000
24 - 27  0x0000010f  0x1389a0f8  0x17468122  0x10412010
28 - 31  0x00000000  0x03980700  0x13980940  0x1014b700

Control Registers 0 - 31
 0 -  3  0x00000000  0x00000000  0x00000000  0x00000000
 4 -  7  0x00000000  0x00000000  0x00000000  0x00000000
 8 - 11  0x00002632  0x00000000  0x000000c0  0x00000010
12 - 15  0x00000000  0x00000000  0x0010b800  0xf1000000
16 - 19  0x4c31b913  0x00000000  0x1010c1b0  0x001f0e60
20 - 23  0x00000000  0x1010c19c  0x0004ff00  0x01000000
24 - 27  0x004a0000  0x0342a000  0xffffffff  0x40e5fb80
28 - 31  0xaaaaaaaa  0x11111111  0x13980000  0x104ac000

Space Registers 0 - 7
 0 -  3  0x00000000  0x00000000  0x00000000  0x00001319
 4 -  7  0x00000000  0x00000000  0x00000000  0x00000000

IIA Space                    = 0x00000000
IIA Offset                   = 0x1010c1b0
CPU State                    = 0x9e000001
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
