Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id A29BE482B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Nov 2001 11:04:50 -0700 (MST)
To: Albert Strasheim <fullung@ilink.nis.za>
Cc: kenneth westelinck <kennywest1@hotmail.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Compiling Mozilla on parisc-linux fails 
In-Reply-To: Message from Albert Strasheim <fullung@ilink.nis.za>
   of "Fri, 02 Nov 2001 14:09:41 +0200." <20011102140941.B17393@dogbert.localdomain>
References: <OE761L3gJcYPqd2rg2Q00007507@hotmail.com>  
 <20011102140941.B17393@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 06 Nov 2001 11:04:34 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20011106180434.D22C337DAD@carmen.fc.hp.com>
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

Albert Strasheim writes...

> AFAIK, we're still missing a kernel-headers package for hppa; someone
> suggested simply install the sparc one. Don't know how well that works.

DO NOT use the Sparc ones. I'm not even sure why they're available for hppa. 
Just take the ones from cvs and put them in the right place. Someday we'll 
have a kernel-headers package for hppa...

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
