Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sngrel4.hp.com (sngrel4.hp.com [192.6.86.110])
	by dsl2.external.hp.com (Postfix) with ESMTP id A4DA6483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 19 Sep 2003 06:40:52 -0600 (MDT)
Message-ID: <A11077E28200D51182EA00D0B775525309A2AA44@xin02.india.hp.com>
From: "SUDARSANAN,RANJITH (HP-India,ex2)" <ranjith_sudarsanan@hp.com>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Problems with raw interface.
Date: Fri, 19 Sep 2003 18:07:41 +0530
MIME-Version: 1.0
Content-Type: text/plain
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi,

Grant:
>>>I get the impression "raw" is ignoring your input parameter
>>>to use /dev/raw/rawsdb and is using /dev/raw/raw<N> instead.
>>>So it looks like you are comparing the wrong data...

Ranjith:
	When I bind an block interface to a raw device, I see that
/dev/raw/raw<N>, <N> is the minor number of the node entry which is created
in the /dev/raw/ directory. I tried binding to /dev/raw/raw1 instead of
/dev/raw/rawsda. I still get the same results. (If the binding is not
present raw complains)

	This problem does not seem to be there on the X86 and IA64 kernels.
I guess this is something specific to PA Linux kernel. I am compiling the
kernel with debugs enabled. Please let me know if anyone gets a lead on
this.

Grant:
>>>>What does "dd if=/dev/raw/raw2 of=/tmp/o_raw2 bs=512 count=8" result in?
Ranjith:
This command reads the first 4K bytes of the disk and writes it to file
o_raw2. 

with warm regards,
Ranjith Sudarsanan

--------------------------------------
Ranjith Sudarsanan
Rage Team
30CA, Cunningham Road
Bangalore
Off: 91-80-205 3190
Res: 91-80-522 2577 
web: http://nt2651.india.hp.com:8080/
--------------------------------------
"When the head bows, it meets the heart and that head which has met the
heart gets the crown!!! - Sri Sri"


-----Original Message-----
From: Grant Grundler [mailto:grundler@parisc-linux.org] 
Sent: Friday, September 19, 2003 4:30 AM
To: SUDARSANAN,RANJITH (HP-India,ex2)
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems with raw interface.


On Fri, Sep 19, 2003 at 12:36:55AM +0530, SUDARSANAN,RANJITH (HP-India,ex2)
wrote: ...
> oak:/home/sranjith# raw /dev/raw/rawsdb /dev/sdb
> /dev/raw/raw1:  bound to major 8, minor 16 oak:/home/sranjith# raw 
> /dev/raw/rawsda /dev/sda
> /dev/raw/raw2:  bound to major 8, minor 0
> 
> oak:/home/sranjith# raw -qa
> /dev/raw/raw1:  bound to major 8, minor 16
> /dev/raw/raw2:  bound to major 8, minor 0

I get the impression "raw" is ignoring your input parameter
to use /dev/raw/rawsdb and is using /dev/raw/raw<N> instead.
So it looks like you are comparing the wrong data...

root@debian:/dev# raw --help
raw: invalid option -- -
Usage:
  raw /dev/raw/rawN <major> <minor>
  raw /dev/raw/rawN /dev/<blockdev>
  raw -q /dev/raw/rawN
  raw -qa

What does "dd if=/dev/raw/raw2 of=/tmp/o_raw2 bs=512 count=8" result in?

Anyway, it looks broken for me too.
I tried using raw on 32-bit 2.4.20-pa28:

	raw /dev/raw/raw1 /dev/sda
	raw -qa
/dev/raw/raw1:  bound to major 8, minor 0
	dd if=/dev/raw/raw1 of=/tmp/raw1.o count=8
	/usr/bin/od -Ax -t x /tmp/raw1.o 
000000 00000000 00000000 00000000 00000000
*
001000


/dev/sda is the boot disk for this machine.

root@debian:/dev# /usr/bin/od -Ax -t x /dev/sda | less
000000 00000000 00000000 00000000 00000000
*
000400 40030800 60653403 00000000 0a086200
000410 cd700200 00000000 02000000 02000000
000420 00800000 00800000 40010000 371e6a3f
000430 371e6a3f 10001800 53ef0100 01000000
....


grant
