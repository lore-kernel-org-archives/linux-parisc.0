Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from manty.net (unknown [213.96.224.204])
	by dsl2.external.hp.com (Postfix) with ESMTP id 318734838
	for <parisc-linux@lists.parisc-linux.org>; Sat, 11 Aug 2001 14:07:10 -0600 (MDT)
Received: from man.beta.es (man.beta.es [192.168.1.1])
	by manty.net (Postfix) with ESMTP id 9C08D15EBD
	for <parisc-linux@lists.parisc-linux.org>; Sat, 11 Aug 2001 22:07:08 +0200 (CEST)
Date: Sat, 11 Aug 2001 22:07:08 +0200
From: Santiago Garcia Mantinan <manty@manty.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010811220708.C4089@man.beta.es>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="bp/iNruPH9dso1Pn"
Subject: [parisc-linux] parisc machine system crash
List-ID: <linux-parisc.vger.kernel.org>

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

I'm one of the Debian developers and I've been trying to get openh323
package to work on the parisc architecture lately, I nearly got it to run,
but I still have some problems wich I haven't been able to trace (if anyone
wants to try and help me with this, he can gatter my latest packages from
debian unstable). The thing is that while trying to trace down this problems
I have crashed paer, a debian's parisc machine.

The proccess that I did run was to strace simph323, an example of the
openh323 library. I had libpt1 from pwlib_1.1.34-2 installed on the machine
and had liboh323v1 and simph323 from openh323_1.5.6-2 installed on my home
directory, then whenever I run...

LD_LIBRARY_PATH=/home/manty/p/usr/lib strace -ff -o salida
usr/bin/simph323 -n -l -s loopback

paer would crash, I think this also happens with strace -f but not with a
plain strace.

I cannot do much tests, as I don't have a local machine that I can reset and
all that, so, it would be good if someone could test this out. The packages
have been installed on Debian right now, but will be in the mirrors soon if
they are not yet there.

I'm attaching a dump of the stack of paer when it crashed hoping that it
will give you enough info to help with this. Paer is running kernel
2.4.0-pa43 without SMP and runs libc6 2.2.3-9.

Well, I don't know what else I could say, but if you find that I'm missing
something, don't hesitate to ask.

Thanks in advance.

Regards...
-- 
Manty/BestiaTester -> http://manty.net

--bp/iNruPH9dso1Pn
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="paer_stack.dump.gz"
Content-Transfer-Encoding: base64

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
v335173A6F2H86H6H7jjvtqNIgAA

--bp/iNruPH9dso1Pn--
