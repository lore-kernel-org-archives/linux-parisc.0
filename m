Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [192.151.27.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4C4C7489E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Sep 2001 14:37:59 -0600 (MDT)
To: Albert Strasheim <fullung@ilink.nis.za>
Cc: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Don't Use base tarballs (was Re: [parisc-linux] nfsroot login
 problems on 720/50)
In-Reply-To: Message from Albert Strasheim <fullung@ilink.nis.za>
   of "Sat, 22 Sep 2001 01:56:10 +0200." <20010922015609.A14166@dogbert.localdomain>
References: <20010921193553.A11874@dogbert.localdomain>
 <20010921180529.C32145@megatonmonkey.net>  <20010922015609.A14166@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 24 Sep 2001 14:37:57 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010924203757.BCCE337DDD@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Albert Strasheim writes...

> Should I try the base tarball (same date... :-( ) or is that known to be
> bad too?

Neither are "bad" just out of date. As soon as we had a real installer 
everyone switched over to using that. They were left there for historical 
reasons.

I have moved them to an old directory to prevent confusion. No one should be 
using these any more. If, for some good reason, you can't use the normal 
installer process then I think the proper way to generate base tarballs now is 
to use the debootstrap tool. If there's enough demand then we could generate 
them and put them on the ftp site again.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
