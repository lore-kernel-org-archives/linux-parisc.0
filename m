Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from eagle.grdl.noaa.gov (eagle.grdl.noaa.gov [140.90.158.128])
	by dsl2.external.hp.com (Postfix) with ESMTP id C8AE5482A
	for <parisc-linux@parisc-linux.org>; Thu, 14 Mar 2002 13:41:27 -0700 (MST)
Message-ID: <3C910AEE.6AB2235E@eagle.grdl.noaa.gov>
Date: Thu, 14 Mar 2002 15:41:18 -0500
From: John <hplinux@eagle.grdl.noaa.gov>
MIME-Version: 1.0
To: parisc-linux@parisc-linux.org
References: <3C7D115C.9AEE5DDB@eagle.grdl.noaa.gov> <20020227172844.2534F485A@dsl2.external.hp.com> <3C7D1C89.121A1B30@eagle.grdl.noaa.gov> <20020227183818.6A427482B@dsl2.external.hp.com>  <3C8D1B6F.162195CF@eagle.grdl.noaa.gov> <20020312171650.7AF54484A@dsl2.external.hp.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PA-RISC 0.9.3+C200+Visualize-EG+2.4.18-pa05 = working X!
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

Grant Grundler wrote:
>
> John wrote:
>>
>> I saw your post from this weekend. Did you actually get X working on your 
>> C3000 with the Visualize-EG?! If a mere mortal can patch the kernel (or you 
>> have it available) I'd love to try it on my C200 to see if it works now 
>> too.
> 
> patch is on ftp.p-l.o/patches/entry.S-diff.
> Then:
>         cd /usr/src/linux
>         patch -p0 < entry.S-diff
>         make vmlinux
> 
> I don't have any kernels suitable for C200 built since I remove ccio driver 
> from the c3k builds. I expect to commit the patch today or tomorrow and can
> build "generic" kernels then.

I wanted to share the good news that Grant's recent patch to "entry.S" yields a
new kernel (2.4.18-pa05) which allows X-windows to work on my C200 with
Visualize-EG graphics. Before installing the patch I would get an HPMC when X
tried to start. I got gdm up & running fine, but have had some troubles with KDE
that I hope to resolve. The 8-bit color isn't great, but that's all I've got!
Thanks Grant!

John
