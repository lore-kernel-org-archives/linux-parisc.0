Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hermes.cs.brandeis.edu (hermes.cs.brandeis.edu [129.64.2.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3A29D482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Jan 2002 14:34:09 -0700 (MST)
Received: from [129.64.46.83] (dhcp-129.64.46.83.cs-i.brandeis.edu [129.64.46.83])
	by hermes.cs.brandeis.edu (8.11.6/8.9.3) with ESMTP id g0GLY7X22935
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Jan 2002 16:34:07 -0500
Mime-Version: 1.0
Message-Id: <a05100305b86b7478c8b3@[129.64.46.83]>
In-Reply-To: <15429.47940.937550.926908@gargle.gargle.HOWL>
References: <15429.47940.937550.926908@gargle.gargle.HOWL>
Date: Wed, 16 Jan 2002 13:19:49 -0500
To: parisc-linux@lists.parisc-linux.org
From: Aaron Macks <aaronm@cs.brandeis.edu.ml.to>
Subject: Re: [parisc-linux] journaling filesystem on parisc?
Content-Type: text/plain; charset="us-ascii" ; format="flowed"
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

>Did not see this mentioned on the list or the site. Any experiences on
>hppa? Does XFS work?
>
>Thanks, Matthias
>

You could try applying the XFS patches to the kernel for PARISC, and 
I know that they have worked on other RISC architectures(ppc and 
alpha, possibly also sparc), but I'm guessing you might need to do a 
little more work than just kernel compilation
aaron

-- 
_______________________________________________________
Aaron Macks(aaronm@cs.brandeis.edu)
My sheep has seven gall bladders, that makes me the King of the Universe!
