Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id C7F4A482A
	for <parisc-linux@parisc-linux.org>; Sun, 13 Jan 2002 04:29:40 -0700 (MST)
Date: Sun, 13 Jan 2002 12:25:01 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: Christian Suder <csuder@cisco.com>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	<palinux@alaskatech.org>, <plaven@bigpond.net.au>,
	<parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] bogomips?
In-Reply-To: <20020113021209.55bad2ea.csuder@cisco.com>
Message-ID: <Pine.LNX.4.43.0201131222400.1023-100000@alpha.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sun, 13 Jan 2002, Christian Suder wrote:

> For those who believe BogoMips matter..... ;-)

The document lists a HP9000/720 running HP/UX with 48 BogoMIPS. This seems 
to match Linux (Linux is even a bit faster :-) ):

# cat /proc/cpuinfo
processor       : 0
cpu family      : PA-RISC 1.1a
cpu             : PA7000 (PCX-S)
cpu MHz         : 50.000000
model           : 9000/720
model name      : Cobra (720)
hversion        : 0x00002000
sversion        : 0x00000481
I-cache         : 128 KB
D-cache         : 256 KB (WB)
ITLB entries    : 96
DTLB entries    : 96
BTLB fixed      : max. 4096 pages, pagesize=4096 (16MB)
BTLB fix-entr.  : 4 instruction, 4 data (0 combined)
BTLB var-entr.  : 0 instruction, 0 data (0 combined)
bogomips        : 49.86
software id     : 86914152

Cheers,
Jochen
