Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from c009.snv.cp.net (h018.c009.snv.cp.net [209.228.34.131])
	by dsl2.external.hp.com (Postfix) with SMTP id EF6D2482E
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Aug 2003 12:01:42 -0600 (MDT)
Content-Type: text/plain; charset=iso-8859-1
MIME-Version: 1.0
To: randolph@tausq.org
Cc: parisc-linux@lists.parisc-linux.org
From: geos@canada.com
Subject: Re: [parisc-linux] adding a second nic to B1000
Date: Thu, 07 Aug 2003 11:01:40 -0700 (PDT)
Message-Id: <20030807110141.25427.h020.c009.wm@mail.canada.com.criticalpath.net>
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

Sorry about that 
im kinda new to this if you cant tell ;)
make config allowed me to select what nic drivers i
wanted but this did not compile or load the new driver  

i will have to get the exact errors msg's when i get
back home 

i ran the recompile kernal found here 
http://www.parisc-linux.org/kernel/index.html
using Simple Recipe to Build a Kernel 

this added the source to /usr/src/linux
that source should be the same as my kernal 
after doing that i did this 
http://www.scyld.com/expert/modules.html
needed to get lib6,cvs after a net-install to do this 

the common error after compileing and doing a insmod
3c95x.o
was "this was compiled for 2.4.18 and this version is
for 2.4.19" 
so i copy the 3c95x.c from the 2.4.19 kernel and did it
again now i get an error like this will not function 

ill get better errors msgs tonight

am i doing this all wrong ?







> 
> Please reply to the list, not to me privately.
> 
> In reference to a message from geos@canada.com, dated
> Aug 07:
> > I will try that later tonite 
> > i cannot get the 3c95x.c to compile or when i do it
> > tells me its compiled for the wrong kerel 
> 
> this looks like a generic module compiling problem,
not
> hppa specific...
> have you done this before succesfully? Are you
building
> a module from
> the same tree where you built the kernel you are
> running? I just tried
> this against 2.4 cvs and it works fine.
> 
> > modconf does not show this nic in the list
> 
> is the module installed in /lib/modules/`uname -r` ?
> 
> > make config did not change anything 
> 
> what did you expect it to do?
> 
> randolph
> -- 
> Randolph Chung
> Debian GNU/Linux Developer, hppa/ia64 ports
> http://www.tausq.org/
