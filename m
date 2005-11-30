From: Fabio Bizzi <bizzi@albacom.net>
Subject: Strange compiler behavior
Date: Wed, 30 Nov 2005 09:38:08 +0100
Message-ID: <438D64F0.7080307__31841.736395336$1416624568$gmane$org@albacom.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: debian-hppa@lists.debian.org
To: parisc-linux <parisc-linux@parisc-linux.org>
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
Resent-Message-ID: <iC-ii.A.MdE.QUWjDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

Hi PA-Gurus! :)

I've tried to compile a LiveMedia test program on my B180L with sarge 
and etch 2.6.12-1-parisc kernel installed.

If I give all the correct include all goes well and a correct executable 
is produced, the following is the working compile string:

bizzi@b180l:~/examples$ g++ testMP3Streamer.cpp -o testMP3Streamer 
-I/usr/include/liveMedia/ -I/usr/include/groupsock/ 
-I/usr/include/BasicUsageEnvironment -I/usr/include/UsageEnvironment 
-lliveMedia -lgroupsock -lBasicUsageEnvironment -lUsageEnvironment

But if I miss a couple of include dir I have a correct error generation 
and a strange message in /var/log/debug , the uncorrect compile string is:

g++ testMP3Streamer.cpp -o testMP3Streamer -I/usr/include/liveMedia/ 
-I/usr/include/groupsock/ -lliveMedia -lgroupsock 
-lBasicUsageEnvironment -lUsageEnvironment

and the /var/log/debug message is:

8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-

do_page_fault() pid=19583 command='cc1plus' type=15 address=0x000000ec

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111100100001111 Not tainted
r00-03  00000000 0036c198 0002570f 4062eaf0
r04-07  40014cb0 4062eaf0 0036c198 00000000
r08-11  003c1998 0039c198 0039c198 0036c198
r12-15  00000000 002ef000 0039e198 00036f4c
r16-19  bff8f908 0039e198 00000000 00000000
r20-23  00000000 00000022 00000001 00000000
r24-27  00000001 4062eaf0 00000160 0036c198
r28-31  40014cb0 00000000 bff90580 00162f37
sr0-3   00000000 00000006 00000000 0000012b
sr4-7   0000012b 0000012b 0000012b 0000012b

IASQ: 0000012b 0000012b IAOQ: 00025713 00025717
  IIR: 4a8301d8    ISR: 0000012b  IOR: 000000ec
  CPU:        0   CR30: 17f5c000 CR31: 103e4000
  ORIG_R28: 00000000
  IAOQ[0]: 0x25713
  IAOQ[1]: 0x25717
  RP(r2): 0x2570f

8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-8<-

I've installed via apt-get the liblivemedia-dev paackage version 
2005.04.01-1

Is this a normal behavior or I've found something strange? ;)

Thanks a lot to evrybody!!! :)

Ciao.

	Fabio.


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
