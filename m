Return-Path: <jools@oxfordinspire.co.uk>
Received: from hp9000.workshop (oxfordinspire.co.uk [62.3.242.169])
	by dsl2.external.hp.com (Postfix) with ESMTP id 14FB648E9
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 19 Jan 2004 12:33:55 -0700 (MST)
Received: from inspiron.workshop ([192.168.1.8])
	by hp9000.workshop with esmtp (Exim 4.30) id 1Aif76-0000Kt-I7
	for parisc-linux@lists.parisc-linux.org; Mon, 19 Jan 2004 19:31:08 +0000
From: Jools Smyth <jools@oxfordinspire.co.uk>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
Date: Mon, 19 Jan 2004 19:30:26 +0000
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Message-Id: <200401191930.27090.jools@oxfordinspire.co.uk>
Subject: [parisc-linux] Stability / Kernel 2.6.1 / HD Freezes
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

I've been reading the list for a while, thought I should join. I'm not really 
a developer (well not on hppa) but I am happy to test stuff out :-)

First of all, I want to thank everyone whos worked on linux for HPPA.
I never really felt comfortable with hp-ux, and getting things working was 
always a pain. 

I own a model 9000/800/A180c. (512 mb ram / 18gb hd)

I was running previously the 2.4 series kernels, but had a lot of crashes 
during HD access. I have seen this mentioned before, and Its probably the 
same issue ? (In fact most of the crashes were during package 
unpacking/installation). Since moving to the 2.6 series this hasnt happened. 
Is this scsi issue now fixed, or have I been lucky ? (I did have a crash 
recently involving a debug file being written. Could it be this problem 
again ?)

I just built Linux hp9000 2.6.1-pa7 and on my system it seems to be working 
fine.

Also, does anyone here know why dovecot wouldnt work with libgnutls on hppa ? 
the dovecot maintainer has been trying to debug it on my machine (If my 
machine hadnt crashed). works fine with openssl. Has anybody had any other 
problems with libgnutls ?

Best Regards

Jools
-- 
Oxford Inspire
jools@oxfordinspire.co.uk
Tel: 01865 751879
Mob: 07966 577498
