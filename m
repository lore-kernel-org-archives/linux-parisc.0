Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Helge Deller <helge.deller@sap.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: Fwd: Re: [parisc-linux] mpg321 on 715/64? 
In-Reply-To: Message from Helge Deller <helge.deller@sap.com>
   of "Mon, 07 Jan 2002 12:49:52 +0100." <E16NYI1-0003EK-00@linuxlab.wdf.sap-ag.de>
References: <E16NYI1-0003EK-00@linuxlab.wdf.sap-ag.de> 
Date: Mon, 07 Jan 2002 09:27:31 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020107162731.6B530482A@dsl2.external.hp.com>
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

Helge Deller wrote:
> > Now to be a total annoying slacker newbie.. can I apt-get install the
> > kernel?
> 
> No.
> 
> You need to build it yourself.

I've uploaded 32-2.4.17-pa05.tar.gz to ftp://ftp.parisc-linux.org/kernels/32.

Unless one needs to tune CONFIG* options (ie build more modules),
Paul Bame has been pretty good about uploading vmlinux/System.map/config
tar balls to ftp://ftp.parisc-linux.org/kernels/32. I generally drop
the kernels I build in kernels/c3000 or kernels/a500 (they are different).

grant
