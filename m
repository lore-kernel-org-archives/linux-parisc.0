Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x2.nokia.com (mgw-x2.nokia.com [131.228.20.22])
	by dsl2.external.hp.com (Postfix) with ESMTP id 82E21482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Apr 2002 06:56:01 -0700 (MST)
Received: from esvir02nok.ntc.nokia.com (esvir02nokt.ntc.nokia.com [172.21.143.34])
	by mgw-x2.nokia.com (Switch-2.2.1/Switch-2.2.0) with ESMTP id g35DuF510314
	for <parisc-linux@lists.parisc-linux.org>; Fri, 5 Apr 2002 16:56:16 +0300 (EET DST)
Date: Fri, 5 Apr 2002 16:55:56 +0300
To: "ext M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 64bit newbie question
Message-ID: <20020405135556.GO10207@shire.ntc.nokia.com>
References: <Pine.LNX.4.44.0204051418500.27381-100000@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <Pine.LNX.4.44.0204051418500.27381-100000@sal.ucc.ie>
From: climent@stybba.ntc.nokia.com (Jesus Climent)
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

On Fri, Apr 05, 2002 at 02:32:13PM +0100, ext M. Grabert wrote:
> Hi,
> 
> I  was just wondering how you can produce 64bit executables for hppa.
> 'info gcc', 'man gcc' or 'gcc -v --help' doesn't mention 64bit
> support at all.
> 
> IIRC on sparc systems, you can produce 64bit executables by specifying/
> enabling the V9-Architecture and the 64bit support, i.e. just adding
> the option '-mcpu=v9' and '-m64'. It seems to be similar on
> many other architectures (submodels), too.
> 
> But it seems that for hppa 64bit is an entire different submodel,
> or am I wrong ?
> 
> What do I have to do to
> 
> - build a 64bit capable gcc for hppa ?
> - produce a 64bit executable ?
> - create a 64bit kernel ? (I know it doesn't make sense on Cxxx
>   machines, and 64bit has much more bugs than 32bit support ;)
> 
> And are there precompiled binaries available (debian/hppa executables) ?
> I haven't seen an egcs64, gcc64 or hppa64-gcc in the debian pool ...

Have you tried gcc-3.0 ??

IIRC is the one that introduced 64 bit compilation under hppa.

J.
