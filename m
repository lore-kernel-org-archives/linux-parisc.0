Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3122482D
	for <parisc-linux@parisc-linux.org>; Mon, 14 Jul 2003 04:49:02 -0600 (MDT)
Date: Mon, 14 Jul 2003 12:48:56 +0200
Message-ID: <3F0BEA8300001164@ocpmta1.freegates.net>
In-Reply-To: <1058030142.2314.23.camel@fuzzy>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] [PATCH] fix arbitrary limits on stack size
To: "James Bottomley" <James.Bottomley@steeleye.com>,
	parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>One of the problems with the PA linux implementation is the upward
>growing stack.  On most architectures, the virtual process space is
>divided into
>
>
>| unmapped | exec and heap |  mappings and stack | TASK_UNMAPPED_BASE  
     
>TASK_SIZE
>
>
>The mappings grow up from the start and the stack grows down from the
>end of the area. If they ever meet, the process segfaults.
>
>On palinux, we have an upward growing stack, so we have to size the
>stack so when it reaches its ulimit, it hits the top of the area.  This
>means that large stack limits cut into the mappable area (and also that
>we have to impose a hard limit of 1GB on the stack size otherwise the
>user could remove the ability to map processes entirely by setting the
>stack limit too high).
>
>The proposal to fix this is to start the stack growing upwards from
>TASK_UNMAPPED_BASE and have the mappings grow downwards from TASK_SIZE.

>This should allow us to behave in exactly the same manner as x86 and not
>have an arbitrary limit on the stack size.
>
>The attached patch (against 2.5.70-pa1) does this, if you'd like to
>comment on it or try it out.

I don' t remember the historical reason of this choice but do you think it
is possible to back-port it into 2.4 (it will facilitate so much the merge
with upstream?)

Thanks in advance for advise,
    Joel

------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
