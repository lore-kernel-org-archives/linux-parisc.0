From: Daniel Coletti <dcoletti@xtech.com.ar>
Subject: [parisc-linux] Linux on a HP 9000/800/N4000-36
Date: Fri, 03 Jun 2005 16:36:13 -0300
Message-ID: <42A0B12D.8070602@xtech.com.ar>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: Roel <Rule@freegates.be>,
 Peter Van Loock <pvl@maxon.be>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi,
	I tried to install Debian on a HP9000/800/N4000-36 and the kernel 
doesn't work. As I can read in this[0] page, somebody did make it work 
but on a -55 model (not -36 like the one I tried with).
http://hwdb.parisc-linux.org/view.php?type=machine&name=N4000-55

Since I used the HP console I don't have the full output, but the 
startup seams to work fine (with the default kernel params) until it 
starts writing:
Kernel bug at lba_pci.c:1285!
Kernel bug at lba_pci.c:1250!
lba range[2]: ignoring GMMIO (0x-a-lot-of-hexa-numbers)
[....]
WARNING! Stack pointer and cr30 do not correspond
Dumping virtual address stack instead
Dumping from 0x000000005fd40000 to 0x000000005fa44b00

and it prints lots and lots of hexa numbers and sais things like "PSW: 
NNNNN Not tainted nnnnNNNnnNN"

I tried with debian-woody official ISO (downloaded from debian), is 
there something special that I have to do with the HP N-class?
Is there another kernel I should try out?

thanks a lot.

daniel///
-- 
Daniel Coletti
XTech (Soluciones Linux para Empresas) - http://www.xtech.com.ar
25 de Mayo 293 - 5to. 'B'
Buenos Aires, Argentina
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
