Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5FE9E4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Dec 2002 15:30:12 -0700 (MST)
Message-Id: <200212202219.gBKMJSJj022082@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 2.5 randomly kills applications with page faults
To: James.Bottomley@SteelEye.com (James Bottomley)
Date: Fri, 20 Dec 2002 17:19:28 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, James.Bottomley@SteelEye.com,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <200212202212.gBKMCbv08741@localhost.localdomain> from "James Bottomley" at Dec 20, 2002 04:12:37 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> @@ -104,7 +105,8 @@
>  	   PSW value is stored.  This is needed for gdb and sys_ptrace. */
>  	STREG	%r0,  TASK_PT_PSW(%r1)
>  	STREG	%r2,  TASK_PT_GR2(%r1)		/* preserve rp */
> -	LDREG	0(%r30), %r2			/* get users sp back */
> +	LDREG	-16(%r30), %r2			/* get users sp back */
> +	ldo	-16(%r30), %r30

I believe that can combine the above two instructions into one with
a ",ma" completer.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
