Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from interzone.ucc.ie (interzone.ucc.ie [143.239.1.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id A9A15482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Apr 2002 06:32:18 -0700 (MST)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by interzone.ucc.ie (8.9.3/8.9.3) with ESMTP id OAA14496
	for <parisc-linux@lists.parisc-linux.org>; Fri, 5 Apr 2002 14:33:38 +0100 (BST)
Date: Fri, 5 Apr 2002 14:32:13 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0204051418500.27381-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] 64bit newbie question
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

I  was just wondering how you can produce 64bit executables for hppa.
'info gcc', 'man gcc' or 'gcc -v --help' doesn't mention 64bit
support at all.

IIRC on sparc systems, you can produce 64bit executables by specifying/
enabling the V9-Architecture and the 64bit support, i.e. just adding
the option '-mcpu=v9' and '-m64'. It seems to be similar on
many other architectures (submodels), too.

But it seems that for hppa 64bit is an entire different submodel,
or am I wrong ?

What do I have to do to

- build a 64bit capable gcc for hppa ?
- produce a 64bit executable ?
- create a 64bit kernel ? (I know it doesn't make sense on Cxxx
  machines, and 64bit has much more bugs than 32bit support ;)

And are there precompiled binaries available (debian/hppa executables) ?
I haven't seen an egcs64, gcc64 or hppa64-gcc in the debian pool ...

greetings max
