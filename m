Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0922F4829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Sep 2002 00:52:31 -0600 (MDT)
Date: Wed, 11 Sep 2002 23:52:28 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Arto Jantunen <viiru@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP problems (hardware gurus, please read)
In-Reply-To: <20020912054834.GA32209@www1.dt-link.fi>
Message-ID: <Pine.LNX.4.44.0209112338570.1464-100000@garibaldi.apptechsys.com>
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

I have the exact same problem on my J5000.  apt-get update and samba are 
the two things that tend to crash it immediately.  It can run fairly well 
SMP w/o doing either of these.  Also, X is now also crashing SMP (not sure 
if/when things changed, as I wasn't running graphics for a while, and 
can't clearly remember running X on smp).

The HPMC had an odd thing in the IO stuff -

> > '9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:
> > 
> >  Rope     Word1        Word2            Word3
> > ------ ------------ ------------
> >    0    0x00000000   0x0e0cc009   0x00000000fed30048
> >    1    0x00000000   0x1e0cc009   0x00000000fed32048
> >    2    ----------   0x2e0cc229   ------------------
> >    3    ----------   0x3e0cc009   ------------------
> >    4    0x00000000   0x4e0cc009   0x00000000fed38048
> >    5    ----------   0x5e0cc009   ------------------
> >    6    0x00000000   0x6e0cc009   0x00000000fed3c048
> >    7    ----------   0x7e0cc009   ------------------

And here is one from another time:

'9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:

 Rope     Word1        Word2            Word3
------ ------------ ------------
   0    0x00000000   0x0e0cc009   0x00000000fed30048
   1    0x00000000   0x1e0cc009   0x00000000fed32048
   2    ----------   0x2e0cc229   ------------------
   3    ----------   0x3f4fd808   ------------------
   4    0x00000000   0x40000008   0xffffffffffffffff
   5    ----------   0x50000008   ------------------
   6    0x00000000   0x60000008   0xffffffffffffffff
   7    ----------   0x70100008   ------------------

possibly, could you send the output of ser pim after such a crash.  Here's 
the general idea:

interrupt the boot process, and at the BOOT_ADMIN prompt type "ser 
clearpim".  then bo pri.  Crash the box, reboot it, interrupt it again, 
and type ser pim.  I am particularly interested in the io part (should be 
at the end)...

Also, are there any HP hardware gurus out there that can explain these odd 
io numbers?  Could they be relevant?


On Thu, 12 Sep 2002, Arto 
Jantunen wrote:

> This is a HP9000/R390 machine, or atleast the previous owner
> said so. It has two PA8200 cpu's running at 240Mhz, but I have
> disabled the second cpu for debuging this problem. As you can see
> from the attached minicom capture, if running an SMP kernel with
> only one cpu, it crashes. It also crashes when running on two cpu's,
> which is why I am reporting this. This proves that the problem has
> nothing to do with the two cpu's stepping on each others toes or
> anything. The machine runs perfectly stable on an UP kernel. Any
> comments, suggestions of things that I could do to help someone
> debug it and anything else is welcome. Please CC me on replies,
> I'm not on the list.
> 
> --
> Arto Jantunen
> 

-- 
During the next two hours, the system will be going up and down several
times, often with lin~po_~{po       ~poz~ppo\~{ o n~po_~{o[po	 ~y oodsou>#w4k**n~po_~{ol;lkld;f;g;dd;po\~{o
